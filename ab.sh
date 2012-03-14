#!/bin/sh
REQUESTS=5000
earlyDtlUrl=http://127.0.0.1:8080/wdg-profile
ctppUrl=http://127.0.0.1/widget/profile

ab -n $REQUESTS -c 10   $earlyDtlUrl > abResults/earlyDtl-$REQUESTS-10.txt 
ab -n $REQUESTS -c 100  $earlyDtlUrl > abResults/earlyDtl-$REQUESTS-100.txt 
ab -n $REQUESTS -c 1000 $earlyDtlUrl > abResults/earlyDtl-$REQUESTS-100.txt 

ab -n $REQUESTS -c 10   $ctppUrl > abResults/ctpp-$REQUESTS-10.txt 
ab -n $REQUESTS -c 100  $ctppUrl > abResults/ctpp-$REQUESTS-100.txt
ab -n $REQUESTS -c 1000 $ctppUrl > abResults/ctpp-$REQUESTS-1000.txt
