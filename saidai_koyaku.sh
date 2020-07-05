#!/bin/sh

a=$1
b=$2

# 引数が2つではない場合
if [ $# -ne 2 ];then
	echo "input 2 argments" 1>&2
	exit 1
fi
# 引数が数値以外の場合
expr $1 + $2 > /dev/null 2>&1
if [ $? -ge 2 ]; then 
	echo "input natural number" 1>&2
	exit 1
fi

# 1つ目の引数が2つ目の引数よりも小さい場合、入れ替える
if [ $a -lt $b ];then
	tempn=$a
	a=$b
	b=$tempn
fi

# 最大公約数を求める
c=$(($a%$b))
while [ $c -ne 0 ]
do
	a=$b
	b=$c
	c=$(($a%$b))
done

echo $b
