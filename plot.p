set terminal png
set output "results-5000-1000.png"
set title "ab -n 5000 -c 1000"
set size 1,0.7

set grid y
set xlabel "request"
set ylabel "response time (ms)"

plot "abResults/earlyDtl-5000-1000.txt" using 9 smooth sbezier with lines title "earlyDtl", \
"abResults/ctpp-5000-1000.txt" using 9 smooth sbezier with lines title "ctpp"
