#!/bin/sh

a=$1
b=$2

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
