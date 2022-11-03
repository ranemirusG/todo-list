#!/bin/sh

# set TODO directory
dir="$HOME/todo/"
len=$(ls $dir | wc -l)

# Show the options
ls -1 $dir | sort | awk '{ print ++count")", $0}'
echo "Select file by number: "

# Input number, test, and open file with vim
read inputNum
if
    [ $inputNum -le $len ] && [ $inputNum -gt 0 ] ; then
    selectedPath=$(ls -1 $dir | awk -v x=$inputNum -v z=$dir 'NR==x {print z$0}')
    fileName=(`basename $selectedPath`)
    echo "Opening $fileName"
    vim $selectedPath
else
    echo "Invalid option. Try again.\n"
    $0
fi
