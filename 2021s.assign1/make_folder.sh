while read line
do
    mkdir -p ./submitted/"class1_$line"
    mkdir -p ./graded/assign1/"class1_$line"
done < ./registration_class1.txt

while read line
do
    mkdir -p ./submitted/"class2_$line"
    mkdir -p ./graded/assign1/"class2_$line"
done < ./registration_class2.txt