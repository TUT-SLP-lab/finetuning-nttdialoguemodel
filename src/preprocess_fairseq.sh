#!/bin/bash

# Usage: bash preprocess_fairseq.sh [TRAIN PREFIX] [DEV PREFIX] [OUT PATH] [SPM VOCAB PATH]
#  bash preprocess_fairseq.sh /home/z44384r/aoba/data/Blender/pre1/train /home/z44384r/aoba/data/Blender/pre1/valid /home/z44384r/aoba/data/Blender/pre1 /home/horiuchi/learning/ILYS-aoba-chatbot/fairseq_vocab/dict.context.txt
DATA_NAME=saya_empathetic_labeled_remove_emp_from_valid
PRE_DATA_DIR=../data/PreprocessedData/$DATA_NAME
AFTER_DATA_DIR=../data/PreprocessedBinaryData/$DATA_NAME
TRAIN=$PRE_DATA_DIR/train
DEV=$PRE_DATA_DIR/valid
TEST=$PRE_DATA_DIR/test
PRE_PROCESSED_DIR=$AFTER_DATA_DIR
SPM_VOCAB=../model/spm/sp_oall_32k.txt

SRC_LANG="context"
TRG_LANG="response"
N_WORKER=12

echo "Train-context:" ${TRAIN}.${SRC_LANG}
echo "Train-response:" ${TRAIN}.${TRG_LANG}
echo "Dev-context:" ${DEV}.${SRC_LANG}
echo "Dev-response:" ${DEV}.${TRG_LANG}
echo "Dev-context:" ${TEST}.${SRC_LANG}
echo "Dev-response:" ${TEST}.${TRG_LANG}
echo "Output:" ${PRE_PROCESSED_DIR}
echo
echo "sentencepiece vocab:" ${SPM_VOCAB}
echo


echo "Create:" ${FAIRSEQ_VOCAB}
echo
echo "Your fairseq version:"
pip list | grep fairseq
echo

set -x

fairseq-preprocess \
  --source-lang ${SRC_LANG} \
  --target-lang ${TRG_LANG} \
  --trainpref ${TRAIN} \
  --validpref ${DEV} \
  --testpref ${TEST} \
  --destdir ${PRE_PROCESSED_DIR} \
  --srcdict ${SPM_VOCAB} \
  --joined-dictionary \
  --workers ${N_WORKER}
