
OUTPUT_DIRECTORY=data/`hostname`
mkdir -p $OUTPUT_DIRECTORY
OUTPUT_FILE=$OUTPUT_DIRECTORY/measurements.txt

touch $OUTPUT_FILE
expe_file="data/experiments.csv"
while IFS="," read -r line; do
    size=$(echo $line | sed 's/[",]/ /g' | sed 's/^[0-9]*  *//g')
    echo "Size: $size" >> $OUTPUT_FILE;
    ./src/parallelQuicksort $size >> $OUTPUT_FILE;
done < $expe_file
