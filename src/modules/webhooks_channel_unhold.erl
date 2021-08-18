%%%-----------------------------------------------------------------------------
%%% @copyright (C) 2021-, Voxter Communication Inc
%%%
%%% @end
%%%-----------------------------------------------------------------------------
-module(webhooks_channel_unhold).

-export([init/0
        ,bindings_and_responders/0
        ]).

-include("webhooks.hrl").

-define(ID, kz_term:to_binary(?MODULE)).
-define(NAME, <<"Channel Unhold">>).
-define(DESC, <<"This webhook is triggered when an established call gets taken off hold">>).
-define(METADATA
       ,kz_json:from_list([{<<"_id">>, ?ID}
                          ,{<<"name">>, ?NAME}
                          ,{<<"description">>, ?DESC}
                          ])
       ).

-spec init() -> 'ok'.
init() ->
    webhooks_util:init_metadata(?ID, ?METADATA).

-spec bindings_and_responders() -> {gen_listener:bindings(), listener_utils:responder_start_params()}.
bindings_and_responders() ->
    {bindings(), responders()}.

-spec bindings() -> gen_listener:bindings().
bindings() ->
    [{'call', [{'restrict_to', ['CHANNEL_UNHOLD']}]}].

-spec responders() -> listener_utils:responder_start_params().
responders() ->
    [{{'webhooks_channel_util', 'handle_event'}
     ,[{<<"call_event">>, <<"CHANNEL_UNHOLD">>}]
     }
    ].
