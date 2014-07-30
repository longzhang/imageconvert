#!/bin/sh
#need install  imagemagick
input_dir=$1
out_put_dir=$2
size=$3
png_inputs=`find $input_dir -name "*.png"`
for path in $png_inputs
do 
    dir=${path%/*}
    f_name=${path##*/}
    _tmp_path=${path##./}
    _tmp_path=${_tmp_path#*/}
    out_path=$out_put_dir/"$_tmp_path"
    out_dir=${out_path%/*}
    if [ -d $out_dir ]
    then
        _w=""
    else
        echo "created"
        mkdir -p $out_dir
    fi
    convert -resize ${size} $path $out_path
done

