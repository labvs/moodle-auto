#!/bin/bash
cur_dir=$(pwd)
lms='/home'
folders=$(ls -d */ | cut -f1 -d'/')
for ids in $folders
do
    cd $cur_dir
    echo "Восстанавливаем курсы в категорию: $ids"
    echo "    |-- получаем список файлов для восстановления"
    a=$(ls -1 $cur_dir/$ids)
    echo "    |-- Восстановление курса: "
    cd $lms
    for j in $a
    do
        echo "         |-- идет перенос $j"
                echo "         |-- moosh -n $cur_dir/$ids/$j $ids"
                moosh -n course-restore $cur_dir/$ids/$j $ids
                echo "         |-- завршено"
                echo "         |--------------- "
    done
done
echo "------------------------------------------------"
echo "                В С Е"

