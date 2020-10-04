#!/bin/sh
curl -s -A "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:56.0) Gecko/20100101 Firefox/56.0" "https://translate.google.com/m?sl=FROM&tl=TO&ie=UTF-8" --data-urlencode "q=WORD_OR_SENTENCE" | grep -Po '<div dir="ltr" class="t0">\K[^<]*'
