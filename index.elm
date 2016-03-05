import Html exposing (div, button, text, input, label)
import Html.Events exposing (onClick, on, targetValue)
import Html.Attributes exposing (attribute, class, for, id, type')

import StartApp.Simple as StartApp


main =
  StartApp.start { model = model, view = view, update = update }


model : String
model = ""

type Action
  = SetName String
  | Greetings

view address model =
  div []
    [ label [] [text "Name:"],
    input [ id "name", type' "text", on "input" targetValue (Signal.message address << SetName)] [],
    button [ onClick address Greetings ] [ text "OK" ]
    , div [] [text (toString model)]
    ]


update action model =
  case action of
    Greetings -> model

    SetName name-> "Hello, " ++ name