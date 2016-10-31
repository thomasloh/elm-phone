module PhoneExample exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import Regex exposing (regex)
import String
import Phone


-- Main


main : Program Never
main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }



-- Model


type alias Model =
    { number : String
    , country : String
    }


init : ( Model, Cmd Msg )
init =
    let
        model =
            { number = ""
            , country = "us"
            }
    in
        ( model, Cmd.none )



-- Update


type Msg
    = Change String
    | SelectCountry String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ number, country } as model) =
    case msg of
        Change raw ->
            let
                num =
                    let
                        matches =
                            Regex.find Regex.All (regex "[0-9]") raw
                    in
                        matches
                            |> List.map .match
                            |> List.map String.toList
                            |> List.concat
                            |> String.fromList

                isEmpty =
                    raw == ""
            in
                case isEmpty of
                    True ->
                        ( { model | number = "" }, Cmd.none )

                    False ->
                        ( { model | number = num }, Cmd.none )

        SelectCountry iso2 ->
            ( { model | country = iso2 }, Cmd.none )



-- View


view : Model -> Html Msg
view model =
    div []
        [ phone model
        ]


phone : Model -> Html Msg
phone ({ number, country } as model) =
    let
        iso2s =
            List.map (\( _, iso2, _, _ ) -> iso2) Phone.getAllCountries

        options =
            List.map (viewSelectOption model) iso2s

        v =
            Phone.format country number
    in
        div []
            [ select [ onInput SelectCountry ] options
            , input
                [ onInput Change
                ]
                []
            , span [] [ text v ]
            ]


viewSelectOption : Model -> String -> Html Msg
viewSelectOption { number, country } iso2 =
    option
        [ value iso2, selected (country == iso2) ]
        [ text iso2 ]
