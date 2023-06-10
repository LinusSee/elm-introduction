module Main exposing (..)

import Browser
import Html exposing (Html, button, div, input, label, sub, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Http
import Json.Decode exposing (field, string)
import Json.Encode as Encode



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }



-- MODEL


init : () -> ( Model, Cmd Msg )
init _ =
    ( { registrationData =
            { username = ""
            , password = ""
            , passwordConfirmation = ""
            }
      , userId = Nothing
      }
    , Cmd.none
    )


type alias Model =
    { registrationData : RegistrationData
    , userId : Maybe String
    }


type alias RegistrationData =
    { username : String
    , password : String
    , passwordConfirmation : String
    }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- UPDATE


type Msg
    = ChangeUsername String
    | ChangePassword String
    | ChangePasswordConfirmation String
    | SubmitUser
    | GotUserId (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeUsername newUsername ->
            let
                registrationData =
                    model.registrationData
            in
            ( { model | registrationData = { registrationData | username = newUsername } }, Cmd.none )

        ChangePassword newPassword ->
            let
                registrationData =
                    model.registrationData
            in
            ( { model | registrationData = { registrationData | password = newPassword } }, Cmd.none )

        ChangePasswordConfirmation newPasswordConfirmation ->
            let
                registrationData =
                    model.registrationData
            in
            ( { model | registrationData = { registrationData | passwordConfirmation = newPasswordConfirmation } }, Cmd.none )

        SubmitUser ->
            let
                jsonData =
                    encodeUserRequestBody model.registrationData
            in
            ( model
            , Http.post
                { url = "http://localhost:8080/users"
                , body = Http.jsonBody jsonData
                , expect = Http.expectJson GotUserId (field "id" string)
                }
            )

        GotUserId result ->
            case result of
                Ok newUserId ->
                    ( { model | userId = Just newUserId }, Cmd.none )

                Err _ ->
                    ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "registration-container" ]
        [ viewRegistrationForm model.registrationData
        , case model.userId of
            Just userId ->
                div []
                    [ text ("Resulting UserId is: " ++ userId) ]

            Nothing ->
                div [] [ text "No user registered yet." ]
        ]


viewRegistrationForm : RegistrationData -> Html Msg
viewRegistrationForm registrationData =
    div []
        [ div []
            [ label [ for "username" ] [ text "Benutzername" ]
            , input
                [ id "username"
                , value registrationData.username
                , placeholder "Benutzername/E-Mail"
                , onInput ChangeUsername
                ]
                []
            , text registrationData.username
            ]
        , div []
            [ label [ for "password" ] [ text "Passwort" ]
            , input
                [ id "password"
                , value registrationData.password
                , placeholder "Passwort"
                , type_ "password"
                , onInput ChangePassword
                ]
                []
            , text registrationData.password
            ]
        , div []
            [ label [ for "password-confirmation" ] [ text "Passwort bestätigen" ]
            , input
                [ id "password-confirmation"
                , value registrationData.passwordConfirmation
                , placeholder "Passwort"
                , type_ "password"
                , onInput ChangePasswordConfirmation
                ]
                []
            , text registrationData.passwordConfirmation
            ]
        , div []
            [ button [ type_ "submit", onClick SubmitUser ] [ text "Registrieren" ] ]
        ]



-- ENCODER


encodeUserRequestBody : RegistrationData -> Encode.Value
encodeUserRequestBody registrationData =
    Encode.object
        [ ( "username", Encode.string registrationData.username )
        , ( "password", Encode.string registrationData.password )
        , ( "passwordConfirmation", Encode.string registrationData.passwordConfirmation )
        ]
