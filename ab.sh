#!/bin/sh
REQUESTS=5000
earlyDtlUrl=http://127.0.0.1:8080/wdg-profile
ctppUrl=http://127.0.0.1/widget/profile

ab -n $REQUESTS -c 10   -g abResults/earlyDtl-$REQUESTS-10.txt $earlyDtlUrl 
ab -n $REQUESTS -c 100  -g abResults/earlyDtl-$REQUESTS-100.txt $earlyDtlUrl  
ab -n $REQUESTS -c 1000 -g abResults/earlyDtl-$REQUESTS-1000.txt $earlyDtlUrl 

ab -n $REQUESTS -c 10   -g abResults/ctpp-$REQUESTS-10.txt $ctppUrl 
ab -n $REQUESTS -c 100  -g abResults/ctpp-$REQUESTS-100.txt $ctppUrl 
ab -n $REQUESTS -c 1000 -g abResults/ctpp-$REQUESTS-1000.txt $ctppUrl 
