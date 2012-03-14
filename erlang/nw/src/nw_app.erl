%% @author Mochi Media <dev@mochimedia.com>
%% @copyright nw Mochi Media <dev@mochimedia.com>

%% @doc Callbacks for the nw application.

-module(nw_app).
-author("Mochi Media <dev@mochimedia.com>").

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for nw.
start(_Type, _StartArgs) ->
    nw_deps:ensure(),
    nw_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for nw.
stop(_State) ->
    ok.
