module Countries exposing (all, index)

{-| Countries data

# Data

@docs all

-}

import List exposing (foldl)
import Dict exposing (Dict, empty, insert)


type alias Country =
    ( String, String, String, Maybe String )


{-| All countries
-}
all : List Country
all =
    [ ( "Afghanistan"
      , "af"
      , "93"
      , Just "+__ (___) ___-____"
      )
    , ( "Albania"
      , "al"
      , "355"
      , Nothing
      )
    , ( "Algeria "
      , "dz"
      , "213"
      , Nothing
      )
    , ( "American Samoa"
      , "as"
      , "1684"
      , Nothing
      )
    , ( "Andorra"
      , "ad"
      , "376"
      , Nothing
      )
    , ( "Angola"
      , "ao"
      , "244"
      , Nothing
      )
    , ( "Anguilla"
      , "ai"
      , "1264"
      , Nothing
      )
    , ( "Antigua and Barbuda"
      , "ag"
      , "1268"
      , Nothing
      )
    , ( "Argentina"
      , "ar"
      , "54"
      , Nothing
      )
    , ( "Armenia"
      , "am"
      , "374"
      , Nothing
      )
    , ( "Aruba"
      , "aw"
      , "297"
      , Nothing
      )
    , ( "Australia"
      , "au"
      , "61"
      , Just "+__ ___ ___ ___"
      )
    , ( "Austria"
      , "at"
      , "43"
      , Nothing
      )
    , ( "Azerbaijan"
      , "az"
      , "994"
      , Nothing
      )
    , ( "Bahamas"
      , "bs"
      , "1242"
      , Nothing
      )
    , ( "Bahrain"
      , "bh"
      , "973"
      , Nothing
      )
    , ( "Bangladesh"
      , "bd"
      , "880"
      , Nothing
      )
    , ( "Barbados"
      , "bb"
      , "1246"
      , Nothing
      )
    , ( "Belarus"
      , "by"
      , "375"
      , Nothing
      )
    , ( "Belgium"
      , "be"
      , "32"
      , Just "+__ ___ __ __ __"
      )
    , ( "Belize"
      , "bz"
      , "501"
      , Nothing
      )
    , ( "Benin"
      , "bj"
      , "229"
      , Nothing
      )
    , ( "Bermuda"
      , "bm"
      , "1441"
      , Nothing
      )
    , ( "Bhutan"
      , "bt"
      , "975"
      , Nothing
      )
    , ( "Bolivia"
      , "bo"
      , "591"
      , Nothing
      )
    , ( "Bosnia and Herzegovina"
      , "ba"
      , "387"
      , Nothing
      )
    , ( "Botswana"
      , "bw"
      , "267"
      , Nothing
      )
    , ( "Brazil"
      , "br"
      , "55"
      , Nothing
      )
    , ( "British Indian Ocean Territory"
      , "io"
      , "246"
      , Nothing
      )
    , ( "British Virgin Islands"
      , "vg"
      , "1284"
      , Nothing
      )
    , ( "Brunei"
      , "bn"
      , "673"
      , Nothing
      )
    , ( "Bulgaria"
      , "bg"
      , "359"
      , Nothing
      )
    , ( "Burkina Faso"
      , "bf"
      , "226"
      , Nothing
      )
    , ( "Burundi"
      , "bi"
      , "257"
      , Nothing
      )
    , ( "Cambodia"
      , "kh"
      , "855"
      , Nothing
      )
    , ( "Cameroon"
      , "cm"
      , "237"
      , Nothing
      )
    , ( "Canada"
      , "ca"
      , "1"
      , Just "+_ (___) ___-____"
        --1,
        --("204", "236", "249", "250", "289", "306", "343", "365", "387", "403", "416", "418", "431", "437", "438", "450", "506", "514", "519", "548", "579", "581", "587", "604", "613", "639", "647", "672", "705", "709", "742", "778", "780", "782", "807", "819", "825", "867", "873", "902", "905"]
      )
    , ( "Cape Verde"
      , "cv"
      , "238"
      , Nothing
      )
    , ( "Caribbean Netherlands"
      , "bq"
      , "599"
        --"",
        --1
      , Nothing
      )
    , ( "Cayman Islands"
      , "ky"
      , "1345"
      , Nothing
      )
    , ( "Central African Republic"
      , "cf"
      , "236"
      , Nothing
      )
    , ( "Chad"
      , "td"
      , "235"
      , Nothing
      )
    , ( "Chile"
      , "cl"
      , "56"
      , Nothing
      )
    , ( "China"
      , "cn"
      , "86"
      , Just "+__ __-________"
      )
    , ( "Colombia"
      , "co"
      , "57"
      , Nothing
      )
    , ( "Comoros"
      , "km"
      , "269"
      , Nothing
      )
    , ( "Congo"
      , "cd"
      , "243"
      , Nothing
      )
    , ( "Congo"
      , "cg"
      , "242"
      , Nothing
      )
    , ( "Cook Islands"
      , "ck"
      , "682"
      , Nothing
      )
    , ( "Costa Rica"
      , "cr"
      , "506"
      , Just "+___ ____-____"
      )
    , ( "Côte d’Ivoire"
      , "ci"
      , "225"
      , Nothing
      )
    , ( "Croatia"
      , "hr"
      , "385"
      , Nothing
      )
    , ( "Cuba"
      , "cu"
      , "53"
      , Nothing
      )
    , ( "Curaçao"
      , "cw"
      , "599"
        --"",
        --0
      , Nothing
      )
    , ( "Cyprus"
      , "cy"
      , "357"
      , Nothing
      )
    , ( "Czech Republic"
      , "cz"
      , "420"
      , Nothing
      )
    , ( "Denmark"
      , "dk"
      , "45"
      , Just "+__ __ __ __ __"
      )
    , ( "Djibouti"
      , "dj"
      , "253"
      , Nothing
      )
    , ( "Dominica"
      , "dm"
      , "1767"
      , Nothing
      )
    , ( "Dominican Republic"
      , "do"
      , "1"
        --""
        --2,
        --("809", "829", "849"]
      , Nothing
      )
    , ( "Ecuador"
      , "ec"
      , "593"
      , Nothing
      )
    , ( "Egypt"
      , "eg"
      , "20"
      , Nothing
      )
    , ( "El Salvador"
      , "sv"
      , "503"
      , Just "+___ ____-____"
      )
    , ( "Equatorial Guinea"
      , "gq"
      , "240"
      , Nothing
      )
    , ( "Eritrea"
      , "er"
      , "291"
      , Nothing
      )
    , ( "Estonia"
      , "ee"
      , "372"
      , Nothing
      )
    , ( "Ethiopia"
      , "et"
      , "251"
      , Nothing
      )
    , ( "Falkland Islands"
      , "fk"
      , "500"
      , Nothing
      )
    , ( "Faroe Islands"
      , "fo"
      , "298"
      , Nothing
      )
    , ( "Fiji"
      , "fj"
      , "679"
      , Nothing
      )
    , ( "Finland"
      , "fi"
      , "358"
      , Just "+___ __ ___ __ __"
      )
    , ( "France"
      , "fr"
      , "33"
      , Just "+__ _ __ __ __ __"
      )
    , ( "French Guiana"
      , "gf"
      , "594"
      , Nothing
      )
    , ( "French Polynesia"
      , "pf"
      , "689"
      , Nothing
      )
    , ( "Gabon"
      , "ga"
      , "241"
      , Nothing
      )
    , ( "Gambia"
      , "gm"
      , "220"
      , Nothing
      )
    , ( "Georgia"
      , "ge"
      , "995"
      , Nothing
      )
    , ( "Germany"
      , "de"
      , "49"
      , Just "+__ ___ _______"
      )
    , ( "Ghana"
      , "gh"
      , "233"
      , Nothing
      )
    , ( "Gibraltar"
      , "gi"
      , "350"
      , Nothing
      )
    , ( "Greece"
      , "gr"
      , "30"
      , Nothing
      )
    , ( "Greenland"
      , "gl"
      , "299"
      , Nothing
      )
    , ( "Grenada"
      , "gd"
      , "1473"
      , Nothing
      )
    , ( "Guadeloupe"
      , "gp"
      , "590"
        --, ""
        --0
      , Nothing
      )
    , ( "Guam"
      , "gu"
      , "1671"
      , Nothing
      )
    , ( "Guatemala"
      , "gt"
      , "502"
      , Just "+___ ____-____"
      )
    , ( "Guinea"
      , "gn"
      , "224"
      , Nothing
      )
    , ( "Guinea-Bissau"
      , "gw"
      , "245"
      , Nothing
      )
    , ( "Guyana"
      , "gy"
      , "592"
      , Nothing
      )
    , ( "Haiti"
      , "ht"
      , "509"
      , Just "+___ ____-____"
      )
    , ( "Honduras"
      , "hn"
      , "504"
      , Nothing
      )
    , ( "Hong Kong"
      , "hk"
      , "852"
      , Just "+___ ____ ____"
      )
    , ( "Hungary"
      , "hu"
      , "36"
      , Nothing
      )
    , ( "Iceland"
      , "is"
      , "354"
      , Just "+___ ___ ____"
      )
    , ( "India"
      , "in"
      , "91"
      , Just "+__ _____-_____"
      )
    , ( "Indonesia"
      , "id"
      , "62"
      , Nothing
      )
    , ( "Iran"
      , "ir"
      , "98"
      , Nothing
      )
    , ( "Iraq"
      , "iq"
      , "964"
      , Nothing
      )
    , ( "Ireland"
      , "ie"
      , "353"
      , Just "+___ __ _______"
      )
    , ( "Israel"
      , "il"
      , "972"
      , Nothing
      )
    , ( "Italy"
      , "it"
      , "39"
      , Just "+__ ___ ______"
        --0
      )
    , ( "Jamaica"
      , "jm"
      , "1876"
      , Nothing
      )
    , ( "Japan"
      , "jp"
      , "81"
      , Just "+__ ___ __ ____"
      )
    , ( "Jordan"
      , "jo"
      , "962"
      , Nothing
      )
    , ( "Kazakhstan"
      , "kz"
      , "7"
      , Just "+_ ___ ___-__-__"
        --1
      )
    , ( "Kenya"
      , "ke"
      , "254"
      , Nothing
      )
    , ( "Kiribati"
      , "ki"
      , "686"
      , Nothing
      )
    , ( "Kuwait"
      , "kw"
      , "965"
      , Nothing
      )
    , ( "Kyrgyzstan"
      , "kg"
      , "996"
      , Nothing
      )
    , ( "Laos"
      , "la"
      , "856"
      , Nothing
      )
    , ( "Latvia"
      , "lv"
      , "371"
      , Nothing
      )
    , ( "Lebanon"
      , "lb"
      , "961"
      , Nothing
      )
    , ( "Lesotho"
      , "ls"
      , "266"
      , Nothing
      )
    , ( "Liberia"
      , "lr"
      , "231"
      , Nothing
      )
    , ( "Libya"
      , "ly"
      , "218"
      , Nothing
      )
    , ( "Liechtenstein"
      , "li"
      , "423"
      , Nothing
      )
    , ( "Lithuania"
      , "lt"
      , "370"
      , Nothing
      )
    , ( "Luxembourg"
      , "lu"
      , "352"
      , Nothing
      )
    , ( "Macau"
      , "mo"
      , "853"
      , Nothing
      )
    , ( "Macedonia"
      , "mk"
      , "389"
      , Nothing
      )
    , ( "Madagascar"
      , "mg"
      , "261"
      , Nothing
      )
    , ( "Malawi"
      , "mw"
      , "265"
      , Nothing
      )
    , ( "Malaysia"
      , "my"
      , "60"
      , Just "+__ __-____-____"
      )
    , ( "Maldives"
      , "mv"
      , "960"
      , Nothing
      )
    , ( "Mali"
      , "ml"
      , "223"
      , Nothing
      )
    , ( "Malta"
      , "mt"
      , "356"
      , Nothing
      )
    , ( "Marshall Islands"
      , "mh"
      , "692"
      , Nothing
      )
    , ( "Martinique"
      , "mq"
      , "596"
      , Nothing
      )
    , ( "Mauritania"
      , "mr"
      , "222"
      , Nothing
      )
    , ( "Mauritius"
      , "mu"
      , "230"
      , Nothing
      )
    , ( "Mexico"
      , "mx"
      , "52"
      , Nothing
      )
    , ( "Micronesia"
      , "fm"
      , "691"
      , Nothing
      )
    , ( "Moldova"
      , "md"
      , "373"
      , Nothing
      )
    , ( "Monaco"
      , "mc"
      , "377"
      , Nothing
      )
    , ( "Mongolia"
      , "mn"
      , "976"
      , Nothing
      )
    , ( "Montenegro"
      , "me"
      , "382"
      , Nothing
      )
    , ( "Montserrat"
      , "ms"
      , "1664"
      , Nothing
      )
    , ( "Morocco"
      , "ma"
      , "212"
      , Nothing
      )
    , ( "Mozambique"
      , "mz"
      , "258"
      , Nothing
      )
    , ( "Myanmar"
      , "mm"
      , "95"
      , Nothing
      )
    , ( "Namibia"
      , "na"
      , "264"
      , Nothing
      )
    , ( "Nauru"
      , "nr"
      , "674"
      , Nothing
      )
    , ( "Nepal"
      , "np"
      , "977"
      , Nothing
      )
    , ( "Netherlands"
      , "nl"
      , "31"
      , Just "+__ __ ________"
      )
    , ( "New Caledonia"
      , "nc"
      , "687"
      , Nothing
      )
    , ( "New Zealand"
      , "nz"
      , "64"
      , Just "+__ ___-___-____"
      )
    , ( "Nicaragua"
      , "ni"
      , "505"
      , Nothing
      )
    , ( "Niger"
      , "ne"
      , "227"
      , Nothing
      )
    , ( "Nigeria"
      , "ng"
      , "234"
      , Nothing
      )
    , ( "Niue"
      , "nu"
      , "683"
      , Nothing
      )
    , ( "Norfolk Island"
      , "nf"
      , "672"
      , Nothing
      )
    , ( "North Korea"
      , "kp"
      , "850"
      , Nothing
      )
    , ( "Northern Mariana Islands"
      , "mp"
      , "1670"
      , Nothing
      )
    , ( "Norway"
      , "no"
      , "47"
      , Just "+__ ___ __ ___"
      )
    , ( "Oman"
      , "om"
      , "968"
      , Nothing
      )
    , ( "Pakistan"
      , "pk"
      , "92"
      , Just "+__ ___-_______"
      )
    , ( "Palau"
      , "pw"
      , "680"
      , Nothing
      )
    , ( "Palestine"
      , "ps"
      , "970"
      , Nothing
      )
    , ( "Panama"
      , "pa"
      , "507"
      , Nothing
      )
    , ( "Papua New Guinea"
      , "pg"
      , "675"
      , Nothing
      )
    , ( "Paraguay"
      , "py"
      , "595"
      , Nothing
      )
    , ( "Peru"
      , "pe"
      , "51"
      , Nothing
      )
    , ( "Philippines"
      , "ph"
      , "63"
      , Just "+__ ___ ____"
      )
    , ( "Poland"
      , "pl"
      , "48"
      , Just "+__ ___-___-___"
      )
    , ( "Portugal"
      , "pt"
      , "351"
      , Nothing
      )
    , ( "Puerto Rico"
      , "pr"
      , "1"
        --""
        --3,
        --["787", "939"]
      , Nothing
      )
    , ( "Qatar"
      , "qa"
      , "974"
      , Nothing
      )
    , ( "Réunion"
      , "re"
      , "262"
      , Nothing
      )
    , ( "Romania"
      , "ro"
      , "40"
      , Nothing
      )
    , ( "Russia"
      , "ru"
      , "7"
      , Just "+_ ___ ___-__-__"
        --, 0
      )
    , ( "Rwanda"
      , "rw"
      , "250"
      , Nothing
      )
    , ( "Saint Barthélemy"
      , "bl"
      , "590"
        --, ""
        --, 1
      , Nothing
      )
    , ( "Saint Helena"
      , "sh"
      , "290"
      , Nothing
      )
    , ( "Saint Kitts and Nevis"
      , "kn"
      , "1869"
      , Nothing
      )
    , ( "Saint Lucia"
      , "lc"
      , "1758"
      , Nothing
      )
    , ( "Saint Martin"
      , "mf"
      , "590"
        --, ""
        --, 2
      , Nothing
      )
    , ( "Saint Pierre and Miquelon"
      , "pm"
      , "508"
      , Nothing
      )
    , ( "Saint Vincent and the Grenadines"
      , "vc"
      , "1784"
      , Nothing
      )
    , ( "Samoa"
      , "ws"
      , "685"
      , Nothing
      )
    , ( "San Marino"
      , "sm"
      , "378"
      , Nothing
      )
    , ( "São Tomé and Príncipe"
      , "st"
      , "239"
      , Nothing
      )
    , ( "Saudi Arabia"
      , "sa"
      , "966"
      , Nothing
      )
    , ( "Senegal"
      , "sn"
      , "221"
      , Nothing
      )
    , ( "Serbia"
      , "rs"
      , "381"
      , Nothing
      )
    , ( "Seychelles"
      , "sc"
      , "248"
      , Nothing
      )
    , ( "Sierra Leone"
      , "sl"
      , "232"
      , Nothing
      )
    , ( "Singapore"
      , "sg"
      , "65"
      , Just "+__ ____-____"
      )
    , ( "Sint Maarten"
      , "sx"
      , "1721"
      , Nothing
      )
    , ( "Slovakia"
      , "sk"
      , "421"
      , Nothing
      )
    , ( "Slovenia"
      , "si"
      , "386"
      , Nothing
      )
    , ( "Solomon Islands"
      , "sb"
      , "677"
      , Nothing
      )
    , ( "Somalia"
      , "so"
      , "252"
      , Nothing
      )
    , ( "South Africa"
      , "za"
      , "27"
      , Nothing
      )
    , ( "South Korea"
      , "kr"
      , "82"
      , Nothing
      )
    , ( "South Sudan"
      , "ss"
      , "211"
      , Nothing
      )
    , ( "Spain"
      , "es"
      , "34"
      , Just "+__ ___ ___ ___"
      )
    , ( "Sri Lanka"
      , "lk"
      , "94"
      , Nothing
      )
    , ( "Sudan"
      , "sd"
      , "249"
      , Nothing
      )
    , ( "Suriname"
      , "sr"
      , "597"
      , Nothing
      )
    , ( "Swaziland"
      , "sz"
      , "268"
      , Nothing
      )
    , ( "Sweden"
      , "se"
      , "46"
      , Just "+__ __ ___ __ __"
      )
    , ( "Switzerland"
      , "ch"
      , "41"
      , Just "+__ __ ___ __ __"
      )
    , ( "Syria"
      , "sy"
      , "963"
      , Nothing
      )
    , ( "Taiwan"
      , "tw"
      , "886"
      , Nothing
      )
    , ( "Tajikistan"
      , "tj"
      , "992"
      , Nothing
      )
    , ( "Tanzania"
      , "tz"
      , "255"
      , Nothing
      )
    , ( "Thailand"
      , "th"
      , "66"
      , Nothing
      )
    , ( "Timor-Leste"
      , "tl"
      , "670"
      , Nothing
      )
    , ( "Togo"
      , "tg"
      , "228"
      , Nothing
      )
    , ( "Tokelau"
      , "tk"
      , "690"
      , Nothing
      )
    , ( "Tonga"
      , "to"
      , "676"
      , Nothing
      )
    , ( "Trinidad and Tobago"
      , "tt"
      , "1868"
      , Nothing
      )
    , ( "Tunisia"
      , "tn"
      , "216"
      , Nothing
      )
    , ( "Turkey"
      , "tr"
      , "90"
      , Just "+__ ___ ___ __ __"
      )
    , ( "Turkmenistan"
      , "tm"
      , "993"
      , Nothing
      )
    , ( "Turks and Caicos Islands"
      , "tc"
      , "1649"
      , Nothing
      )
    , ( "Tuvalu"
      , "tv"
      , "688"
      , Nothing
      )
    , ( "U_S_ Virgin Islands"
      , "vi"
      , "1340"
      , Nothing
      )
    , ( "Uganda"
      , "ug"
      , "256"
      , Nothing
      )
    , ( "Ukraine"
      , "ua"
      , "380"
      , Nothing
      )
    , ( "United Arab Emirates"
      , "ae"
      , "971"
      , Nothing
      )
    , ( "United Kingdom"
      , "gb"
      , "44"
      , Just "+__ ____ ______"
      )
    , ( "United States"
      , "us"
      , "1"
      , Just "+_ (___) ___-____"
      )
    , ( "Uruguay"
      , "uy"
      , "598"
      , Nothing
      )
    , ( "Uzbekistan"
      , "uz"
      , "998"
      , Nothing
      )
    , ( "Vanuatu"
      , "vu"
      , "678"
      , Nothing
      )
    , ( "Vatican City"
      , "va"
      , "39"
      , Just "+__ __ ____ ____"
        --1
      )
    , ( "Venezuela"
      , "ve"
      , "58"
      , Nothing
      )
    , ( "Vietnam"
      , "vn"
      , "84"
      , Nothing
      )
    , ( "Wallis and Futuna"
      , "wf"
      , "681"
      , Nothing
      )
    , ( "Yemen"
      , "ye"
      , "967"
      , Nothing
      )
    , ( "Zambia"
      , "zm"
      , "260"
      , Nothing
      )
    , ( "Zimbabwe"
      , "zw"
      , "263"
      , Nothing
      )
    ]


index : Dict String Country
index =
    foldl (\(( _, iso2, _, _ ) as country) dict -> insert iso2 country dict) empty all
