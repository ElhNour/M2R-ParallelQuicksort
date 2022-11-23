
OUTPUT_DIRECTORY=data/nour_2022-11-23
mkdir -p $OUTPUT_DIRECTORY
OUTPUT_FILE=$OUTPUT_DIRECTORY/measurements_1.txt

touch $OUTPUT_FILE
expe_file="data/nour_2022-11-23/experiments.csv"

# repeat the experiment 10 times so that each array size is executed hopefully 5 times by each function
for i in {0..9}
do
while IFS="," read -r line; do
    size=$(echo $line | sed 's/[",]/ /g' | sed 's/^[0-9]*  *//g')
    echo "Size: $size" >> $OUTPUT_FILE;
     # pick randomly a function to be executed
    func=$(shuf -i 0-2 -n1)
    src/parallelQuicksort $size $func >> $OUTPUT_FILE;

done < $expe_file
done
