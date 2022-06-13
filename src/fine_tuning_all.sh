#! /bin/bash

set -eu
set -o pipefail

. ~/tools/line_notificator.sh

line_notify "finetuning start!"

DATA_NAME="saya_empathetic_labeled_remove_emp_from_valid"
. ./train_fine_tuning.sh || line_notify ${DATA_NAME}"failed" 
line_notify ${DATA_NAME}"finished"

# DATA_NAME="saya_persona"
# . ./train_fine_tuning.sh || line_notify ${DATA_NAME}"failed" 
# line_notify ${DATA_NAME}"finished"

# DATA_NAME="saya_persona_labeled"
# . ./train_fine_tuning.sh || line_notify ${DATA_NAME}"failed" 
# line_notify ${DATA_NAME}" finished"

# DATA_NAME="saya_empathetic_labeled" 
# . ./train_fine_tuning.sh || line_notify ${DATA_NAME}" failed"
# line_notify ${DATA_NAME}" finished"

