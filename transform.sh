#!/bin/sh
perl -lne '/^(.+)\// && print $1' sk.dic \
  | iconv -f utf-8 -t ascii//translit//ignore \
  | tr -d "\"'^" \
  | perl -lne "if ((not m/y|z/i ) and (length() < 10)){ print }" \
  | perl -lne '/^(.+)/ && printf("\"%s\",\n", $1)' 
