echo 'Please enter path to file from root directory'
read file

echo 'Please enter string to rewrite'
read origin_string

echo 'Please enter string-replacer'
read new_string

if [[ -n $origin_string  && -f $file ]]; then
sed -i '' "s/$origin_string/$new_string/g" $file
filesize=$(ls -lh $file | awk '{print $5}')
filesize=${filesize%?}

month=$(ls -lh $file | awk '{print $6}')
day=$(ls -lh $file | awk '{print $7}')
last_change=$(ls -lh $file | awk '{print $8}')

case $month in
    Jan) month="01" ;;
    Feb) month="02" ;;
    Mar) month="03" ;;
    Apr) month="04" ;;
    May) month="05" ;;
    Jun) month="06" ;;
    Jul) month="07" ;;
    Aug) month="08" ;;
    Sep) month="09" ;;
    Oct) month="10" ;;
    Nov) month="11" ;;
    Dec) month="12" ;;
esac


if [[ ${#day} -eq 1 ]]; then
day="0$day"
fi

code=$(shasum -a 256 $file)

code=${code% *}

res="src/$file - $filesize - 2022-$month-$day $last_change - $code - sha256\n"

echo $res >> files.log

else

echo "String to rewrite can't be empty or file need to exist"

fi

