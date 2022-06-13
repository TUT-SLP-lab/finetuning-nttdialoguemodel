file_dir=$1

for file in `ls ${file_dir}/*`
do
    new_file=`echo ${file//context/src}`
    new_file=`echo ${new_file//response/dst}`
    mv $file $new_file
done