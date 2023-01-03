
OUTPUT_DIRECTORY=data/nour_2023-01-03
OUTPUT_FILE=$OUTPUT_DIRECTORY/measurements.txt

touch $OUTPUT_FILE
expe_file="data/nour_2023-01-03/experiments.csv"

# repeat the full experiment for each function to ensure that each array size is executed 5 times
for i in {0..2}
do
while IFS="," read -r line; do
    size=$(echo $line | sed 's/[",]/ /g' | sed 's/^[0-9]*  *//g')
    echo "Size: $size" >> $OUTPUT_FILE;
    src/parallelQuicksort $size $i >> $OUTPUT_FILE;

done < $expe_file
done
