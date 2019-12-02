#!/bin/bash

NAME=MiniJawnRemix_`date +"%m-%d-%Y_%H-%M"`
ZIP=$NAME.zip

if [ -d "$NAME" ]; then rm -rvf $NAME; fi
if [ -f "$ZIP" ]; then rm -vf $ZIP; fi

mkdir -p $NAME/MinijawnRemixClear
mkdir -p $NAME/MinijawnRemixScanlines

cp -vf LICENSE $NAME
for r in icons imgs sections wallpapers skin.conf font.ttf; do
  cp -rf $r $NAME/MinijawnRemixClear
  cp -rf $r $NAME/MinijawnRemixScanlines
done

for r in backdrops wallpapers; do
 mkdir $NAME/MinijawnRemixClear/$r 
 mkdir $NAME/MinijawnRemixScanlines/$r 
 cp -rf $r/clear/* $NAME/MinijawnRemixClear/$r
 cp -rf $r/scanlines/* $NAME/MinijawnRemixScanlines/$r
done

zip -rv $ZIP $NAME/*
rm -rf $NAME
