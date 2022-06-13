#! /bin/bash

set -Ceu
# line notificator
. ~/tools/line_notificator.sh

wget https://www.dropbox.com/s/k3ugxmr7nw6t86l/japanese-dialog-transformer-1.6B.pt || line_notify "baseline failed to download!"
line_notify "baseline downloaded!"

wget https://www.dropbox.com/s/e5ib6rhsbldup3v/japanese-dialog-transformer-1.6B-persona50k.pt || line_notify "persona failed to download"
line_notify "succeed to download persona!"


wget https://www.dropbox.com/s/laqz0jcgxvpxiy0/japanese-dialog-transformer-1.6B-empdial50k.pt || line_notify "empathetic failed to download"
line_notify "succeed to download empathetic!"
