#!/bin/sh
LD_LIBRARY_PATH=libs ./framebuffer-vncserver "$@" > /dev/null 2>&1 &
