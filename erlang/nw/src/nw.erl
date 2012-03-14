%% @author Mochi Media <dev@mochimedia.com>
%% @copyright 2010 Mochi Media <dev@mochimedia.com>

%% @doc nw.

-module(nw).
-author("Mochi Media <dev@mochimedia.com>").
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.


%% @spec start() -> ok
%% @doc Start the nw server.
start() ->
    nw_deps:ensure(),
    ensure_started(crypto),
    application:start(nw).


%% @spec stop() -> ok
%% @doc Stop the nw server.
stop() ->
    application:stop(nw).
