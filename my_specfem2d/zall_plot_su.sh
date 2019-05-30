#!bin/bash

# plot su file to seismo.png

# created on July 2018
# revised on Tue Oct 16 20:14:21 UTC 2018
# created by Jiaze He


x=$(find ./OUTPUT_FILES -iname 'U*.su')
echo $x
for fname in $x; do
    echo "$fname"
    fhead=$(echo "$fname" |cut -c16-17)
    echo "$fhead"       
    seismo_png_fn=$(printf "./OUTPUT_FILES/${fhead}_seismo.png")
    echo "$seismo_png_fn"
    ./zsavesismo "$fname" -save="$seismo_png_fn" -c=100 -t="$fhead" -xint=2 -yint=500 -c=90 > /dev/null &
done





#./savesismo ./OUTPUT_FILES/Up_file_single.su -save=./OUTPUT_FILES/zseismo.png -c=100 -xint=2 -yint=1000 -c=90 > /dev/null &
