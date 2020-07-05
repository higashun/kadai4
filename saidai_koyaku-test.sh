#!/bin/bash

# saidai_koyaku-test.shは12と18がインプットされたときの
# 最大公約数が6と正しく出力されるかどうかを調べるためのシェルスクリプトである


# 変数化
a=$1
b=$2

ans="/tmp/$$-ans"
result="/tmp/$$-result"
err="/tmp/$$-error" 

# テスとの正常動作の確認
echo "6" > ${ans}
./saidai_koyaku.sh $a $b > ${result}
#./saidai_koyaku.sh $a $b > ${result}
diff ${ans} ${result} || echo "error in 1-1" >> ${err}

#if [ ${ans} -eq ${result} ]; then
#       	echo "error in 1-1" >> ${err}

# エラーログがある場合
if [ -f ${err} ]; then
	cat ${err}
	rm /tmp/$$-*
	exit 1
fi
