module Tests exposing (..)

import Test exposing (..)
import Expect
import String
import Phone


all : Test
all =
    describe "Phone Format Test"
        [ test "United States" <|
            \() ->
                Expect.equal (Phone.format "us" 2345678912) "+1 (234) 567-8912"
        , test "United Kingdom" <|
            \() ->
                Expect.equal (Phone.format "gb" 2345678912) "+44 2345 678912"
        , test "Invalid" <|
            \() ->
                Expect.equal (Phone.format "mars" 2345678912) "Invalid ISO2"
        ]
