#!/bin/sh

if [ -z $LABGUI_PORT ]; then
	echo "need to specifiy a port for the gui"
	exit	
fi

#start the xpra client
xpra --window-close=shutdown start ssh/gns3user@localhost --start-child=gns3 --ssh='ssh -p '"$LABGUI_PORT"' -i gns3gui/keys/id_ed25519 -o "StrictHostKeyChecking=no"'
