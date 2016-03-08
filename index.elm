import Html exposing (Html, div, button, text, input, label, h2)
import Html.Events exposing (onClick, on, targetValue)
import Html.Attributes exposing (attribute, class, for, id, type')

import Signal exposing (Address)

import StartApp.Simple as StartApp

-- MODEL --

type alias Model =
 {
   greeting : String,
   name : String,
   message : String
 }


model : Model
model =
 {
   greeting = "Hello, ",
   name = "",
   message = ""
 }


-- UPDATE --

type Action
  = SetName String
  | Greetings


update action model =
  case action of
    Greetings -> { model | message = model.greeting ++ model.name }

    SetName content -> { model | name = content }

-- VIEW --

view : Address Action -> Model -> Html
view address model =
  div []
    [ label [] [text "Name:"],
    input [ id "name", type' "text", on "input" targetValue (Signal.message address << SetName)] [],
    button [ onClick address Greetings ] [ text "OK" ],
    h2 [] [text model.message]
    ]

main : Signal Html
main =
  StartApp.start { model = model, view = view, update = update }