module Main exposing (..)

import Browser
import Html exposing (Html, button, div, input, label, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- MODEL


init : Model
init =
    { username = ""
    , password = ""
    , passwordConfirmation = ""
    }


type alias Model =
    { username : String
    , password : String
    , passwordConfirmation : String
    }



-- UPDATE


type Msg
    = Nothing
    | ChangeUsername String
    | ChangePassword String
    | ChangePasswordConfirmation String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Nothing ->
            model

        ChangeUsername newUsername ->
            { model | username = newUsername }

        ChangePassword newPassword ->
            { model | password = newPassword }

        ChangePasswordConfirmation newPasswordConfirmation ->
            { model | passwordConfirmation = newPasswordConfirmation }



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "registration-container" ]
        [ div []
            [ label [ for "username" ] [ text "Benutzername" ]
            , input
                [ id "username"
                , value model.username
                , placeholder "Benutzername/E-Mail"
                , onInput ChangeUsername
                ]
                []
            , text model.username
            ]
        , div []
            [ label [ for "password" ] [ text "Passwort" ]
            , input
                [ id "password"
                , value model.password
                , placeholder "Passwort"
                , type_ "password"
                , onInput ChangePassword
                ]
                []
            , text model.password
            ]
        , div []
            [ label [ for "password-confirmation" ] [ text "Passwort bestätigen" ]
            , input
                [ id "password-confirmation"
                , value model.passwordConfirmation
                , placeholder "Passwort"
                , type_ "password"
                , onInput ChangePasswordConfirmation
                ]
                []
            , text model.passwordConfirmation
            ]
        , div []
            [ button [ type_ "submit" ] [ text "Registrieren" ] ]
        ]
