#!/bin/bash
#auther eko.zhan
#date 2017-05-22 09:45
#[params]
#warName : kbase-core.war
#[description]
#war to zip

warName=$1
if [ ! -n "$warName" ] ; then
    echo "请输入待处理的war包"
    exit 0
else
    echo "当前输入的参数为 " $warName 
fi

war=`echo "$warName" | grep ".war$"`
len=`echo ${#war}`
if [ $len = 0 ] ; then
    echo "请输入类型为 war 的文件包"
    exit 0
else
		echo "当前输入的参数是符合要求的war包"
fi
	
folderName=`echo ${warName%.war}`
echo "开始运命令 unzip $warName -d $folderName 解压..."
unzip $warName -d $folderName
echo "解压完毕..."
echo "开始运行命令 zip -r "$folderName.zip" "$folderName" 压缩成zip包 ..."
sleep 3s
zip -r "$folderName.zip" "$folderName"
echo "压缩完毕..."
echo "删除目录 $folderName ..."
sleep 3s
rm -rf $folderName
echo "目录删除完毕..."
echo -n "是否删除 $warName ?(y/n)"
read isDel
case $isDel in
	y|Y|yes|Yes|1)
      echo "开始删除 $warName ..."
      rm -rf $warName
      echo "删除完毕 ..."
      ;;
  n|N|no|No|0)
      exit 0
      ;;
esac