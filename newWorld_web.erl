%% @author Mochi Media <dev@mochimedia.com>
%% @copyright 2010 Mochi Media <dev@mochimedia.com>

%% @doc Web server for newWorld.

-module(nw_web).
-author("Mochi Media <dev@mochimedia.com>").

-export([start/1, stop/0, loop/2]).

%% External API

start(Options) ->
    {DocRoot, Options1} = get_option(docroot, Options),
    Loop = fun (Req) ->
                   ?MODULE:loop(Req, DocRoot)
           end,
    mochiweb_http:start([{name, ?MODULE}, {loop, Loop} | Options1]).

stop() ->
    mochiweb_http:stop(?MODULE).

loop(Req, DocRoot) ->
    "/" ++ Path = Req:get(path),
    try
        case Req:get(method) of
            Method when Method =:= 'GET'; Method =:= 'HEAD' ->
                case Path of
					"profile" ->
                        QueryStringData = Req:parse_qs(),
                        Username = proplists:get_value("username", QueryStringData, "Anonymous"),
						{_,B} = file:read_file("favoriteGames.txt" ),
                        Req:respond({200, [{"Content-Type", "text/plain"}],
                     %                "{ 'name' : '" ++ Username ++ "'}"});
                                     B });
                                     % favouriteGames  });
                    _ ->
                        Req:serve_file(Path, DocRoot)
                end;
            'POST' ->
                case Path of
					"profile" ->
                        PostData = Req:parse_post(),
                        Username = proplists:get_value("username", PostData, "Anonymous"),
						{ok, WriteDescr} = file:open(favoriteGames.txt, [raw, write]), 
						file:write(WriteDescr,"{ 'name' : 'Gabriele', 'gameName' : '" ++ Username ++ "' }\n"), 
						file:close(WriteDescr),
                        Req:respond({200, [{"Content-Type", "text/plain"}],
                                     "{	'name' : 'Gabriele', 'gameName' : '" ++ Username ++ "' }"});
                    _ ->
                        Req:not_found()
                end;
            _ ->
                Req:respond({501, [], []})
        end
    catch
        Type:What ->
            Report = ["web request failed",
                      {path, Path},
                      {type, Type}, {what, What},
                      {trace, erlang:get_stacktrace()}],
            error_logger:error_report(Report),
            %% NOTE: mustache templates need \ because they are not awesome.
            Req:respond({500, [{"Content-Type", "text/plain"}],
                         "request failed, sorry\n"})
    end.

%% Internal API

get_option(Option, Options) ->
    {proplists:get_value(Option, Options), proplists:delete(Option, Options)}.

%%
%% Tests
%%
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

you_should_write_a_test() ->
    ?assertEqual(
       "No, but I will!",
       "Have you written any tests?"),
    ok.

-endif.
