##判断变量是否为空，若为空则赋给它值
#/bin/bash
if [ "$1" == "" ]
then
    start_date=`date -d "today last month" "+%Y%m01"`
    end_date=`date -d "today" "+%Y%m%d"`
elif [ "$2" == "" ]
then
    start_date=`date -d "$1" "+%Y%m%d"`
    end_date=`date -d "today" "+%Y%m%d"`
else
    start_date=`date -d "$1" "+%Y%m%d"`
    end_date=`date -d "$2" "+%Y%m%d"`
fi
##判断变量准确性，起始日期是否小于截至日期
if [ ${start_date} -gt ${end_date} ]
then
	echo "Error\nPLease input right date!!"
	exit
fi
##通过循环，返回日期值
for i in `seq 0 10000`
do
	t_date=`date -d "${start_date} +$(($i+1)) day" "+%Y%m%d"`
	echo $t_date
        cnt_day=$i
     ##如果循环到当天，就退出
	if [ ${t_date} == ${end_date} ]
	then
		break
	fi
done
echo "The days between two dates is ${cnt_day}"
