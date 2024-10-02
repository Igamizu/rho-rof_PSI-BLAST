#!/bin/sh
#$ -S /bin/sh
#$ -cwd
#$ -l short
#$ -l s_vmem=8G
#$ -l mem_req=8G
#$ -pe def_slot 4

echo $PWD
ls -l
find .
