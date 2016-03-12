#!/bin/sh
XMODIFIERS="@im=none"
GTK_IM_MODULE=none
export XMODIFIERS GTK_IM_MODULE
exec /usr/bin/emacs --daemon
