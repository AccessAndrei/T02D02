echo 'Please enter path to file from root directory'
read log

declare -a hashes=()
declare -a files=()

$index
while IFS= read -r line
do
  index=$[ $index + 1 ];
  line_parsed=($line)
  files[$index]=${line_parsed[0]}
  hashes[$index]=${line_parsed[7]}
done <  $log

uniques1=($(for v in "${files[@]}"; do echo "$v";done| sort| uniq))
uniques2=($(for v in "${hashes[@]}"; do echo "$v";done| sort| uniq))

echo "$index ${#uniques1[@]} ${#uniques2[@]}"
