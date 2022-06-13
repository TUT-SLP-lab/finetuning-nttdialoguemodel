#! /bin/bash

PATH1=saya
#PATH2=empathetic
PATH2=persona

mkdir ${PATH1}_${PATH2}_labeled

cat ~/Documents/saya_finetuning/202201_data/${PATH1}/formatted_addSPK_labeled/context/train.context.csv > ./${PATH1}_${PATH2}_labeled/train.context
cat ~/Documents/saya_finetuning/202201_data/${PATH1}/formatted_addSPK_labeled/context/valid.context.csv > ./${PATH1}_${PATH2}_labeled/valid.context
cat ~/Documents/saya_finetuning/202201_data/${PATH1}/formatted_addSPK_labeled/context/test.context.csv  > ./${PATH1}_${PATH2}_labeled/test.context

cat ~/Documents/saya_finetuning/202201_data/${PATH1}/formatted_addSPK_labeled/response/train.response.csv > ./${PATH1}_${PATH2}_labeled/train.response
cat ~/Documents/saya_finetuning/202201_data/${PATH1}/formatted_addSPK_labeled/response/valid.response.csv > ./${PATH1}_${PATH2}_labeled/valid.response
cat ~/Documents/saya_finetuning/202201_data/${PATH1}/formatted_addSPK_labeled/response/test.response.csv  > ./${PATH1}_${PATH2}_labeled/test.response



cat ~/Documents/saya_finetuning/202201_data/${PATH2}/formatted_labeled/context/train.context >> ./${PATH1}_${PATH2}_labeled/train.context
cat ~/Documents/saya_finetuning/202201_data/${PATH2}/formatted_labeled/context/valid.context >> ./${PATH1}_${PATH2}_labeled/valid.context
cat ~/Documents/saya_finetuning/202201_data/${PATH2}/formatted_labeled/context/test.context  >> ./${PATH1}_${PATH2}_labeled/test.context

cat ~/Documents/saya_finetuning/202201_data/${PATH2}/formatted_labeled/response/train.response >> ./${PATH1}_${PATH2}_labeled/train.response
cat ~/Documents/saya_finetuning/202201_data/${PATH2}/formatted_labeled/response/valid.response >> ./${PATH1}_${PATH2}_labeled/valid.response
cat ~/Documents/saya_finetuning/202201_data/${PATH2}/formatted_labeled/response/test.response  >> ./${PATH1}_${PATH2}_labeled/test.response


#cat ~/Documents/saya_finetuning/202201_data/${PATH3}/formatted/context/train.context >> ./${PATH1}_${PATH2}_${PATH3}/train.context
#cat ~/Documents/saya_finetuning/202201_data/${PATH3}/formatted/context/valid.context >> ./${PATH1}_${PATH2}_${PATH3}/valid.context
#cat ~/Documents/saya_finetuning/202201_data/${PATH3}/formatted/context/test.context  >> ./${PATH1}_${PATH2}_${PATH3}/test.context

#cat ~/Documents/saya_finetuning/202201_data/${PATH3}/formatted/response/train.response >> ./${PATH1}_${PATH2}_${PATH3}/train.response
#cat ~/Documents/saya_finetuning/202201_data/${PATH3}/formatted/response/valid.response >> ./${PATH1}_${PATH2}_${PATH3}/valid.response
#cat ~/Documents/saya_finetuning/202201_data/${PATH3}/formatted/response/test.response  >> ./${PATH1}_${PATH2}_${PATH3}/test.response

