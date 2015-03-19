-module(webmachine_demo_put_json_resource).
-export([init/1]).
-export([allowed_methods/2,
         content_types_accepted/2,
         accept_content/2]).

-include_lib("webmachine/include/webmachine.hrl").

init(_) ->
    {ok, undefined}.

allowed_methods(ReqData, Context) ->
    {['PUT'], ReqData, Context}.

content_types_accepted(ReqData, Context) ->
    {MT, _Params} = webmachine_util:media_type_to_detail("application/json"),
    {[{MT, accept_content}], ReqData, Context}.

accept_content(ReqData, Context) ->
    Body = wrq:req_body(ReqData),
    io:format("Received the following request body: ~p~n", [Body]),
    {true, wrq:set_resp_body("ok", ReqData), Context}.
