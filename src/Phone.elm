module Phone exposing (format, getAllCountries)

{-| A library for converting plain number to desired country's phone format.
    Supports ISO2 codes for 232 countries/

@docs format
@docs getAllCountries
-}

import List exposing (foldl)
import Dict
import String exposing (repeat, length)
import Countries


{-| Formats a phone number by country (in form of iso2)

For example:

    import Phone

    output = Phone.format "us" 2345678912

    --> output == "+1 (234) 567-8912"

    -----------------------------------------------

    import Phone

    output = Phone.format "gb" 2345678912

    --> output == "+44 2345 678912"

-}
format : String -> Int -> String
format iso2 number =
    case Dict.get iso2 Countries.index of
        Just co ->
            let
                ( _, _, dialcode, format ) =
                    co

                f =
                    let
                        plain =
                            let
                                a =
                                    [ "+"
                                    , (repeat (length dialcode) "_")
                                    , (repeat (length (toString number)) "_")
                                    ]
                            in
                                foldl (\s acc -> acc ++ s) "" a
                    in
                        case format of
                            Just ff ->
                                ff

                            Nothing ->
                                plain

                numlist =
                    String.toList (dialcode ++ (toString number))

                formatlist =
                    String.toList f

                l =
                    sprinkle numlist formatlist
            in
                String.fromList l

        Nothing ->
            "Invalid ISO2"


{-| Sprinkle raw input into format string (internal)
-}
sprinkle : List Char -> List Char -> List Char
sprinkle numlist formatlist =
    let
        val x =
            case x of
                Just y ->
                    y

                Nothing ->
                    '-'

        array x =
            case x of
                Just y ->
                    y

                Nothing ->
                    []

        h1 =
            List.head numlist

        r1 =
            List.tail numlist

        h2 =
            List.head formatlist

        r2 =
            List.tail formatlist
    in
        case h1 of
            Just h ->
                case h2 of
                    Just '_' ->
                        h :: (sprinkle (array r1) (array r2))

                    Just x ->
                        x :: (sprinkle numlist (array r2))

                    Nothing ->
                        formatlist

            Nothing ->
                formatlist


{-| Get all countries
-}
getAllCountries : List ( String, String, String, Maybe String )
getAllCountries =
    Countries.all
