import sentencepiece as spm
import re
import os

DATANAME="saya_empathetic_labeled_remove_emp_from_valid"

SPM="../model/spm/sp_oall_32k.model"
SRC_DIR="../data/RawData/"+DATANAME+"/"
DATA_DIR="../data/PreprocessedData/"+DATANAME+"/"

if not os.path.exists(SRC_DIR):
    os.mkdir(SRC_DIR)
if not os.path.exists(DATA_DIR):
    os.mkdir(DATA_DIR)

sp = spm.SentencePieceProcessor()
sp.Load(SPM)


for name in ['train.response', 'valid.response', 'train.context' , 'valid.context', 'test.context', 'test.response']:
    with open(SRC_DIR+name) as f, open(DATA_DIR+name, 'w') as g:
        for x in f:
            x = x.strip()
            x = re.sub(r'\s+', ' ', x)
            x = sp.encode_as_pieces(x)
            x = ' '.join(x)
            print(x, file=g)
