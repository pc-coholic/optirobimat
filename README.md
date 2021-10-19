Opti Robimat
============

While there is ongoing development on the device happening, quite a few reported bugs are being ignored. A list of these bugs can be found here: https://wiki.muc.ccc.de/matemat:robimat:bugtracker:start

An inofficial changelog for the device's software can be found here: https://wiki.muc.ccc.de/matemat:robimat:changelog

rebrand_and_ssh
---------------
This "update" does two things:
- It replaces the Sielaff Logo on the UI with a custom logo
- It adds two SSH-keys to `/home/root/.ssh/authorized_keys`

Usage:
* copy `sielaff_au` folder to the root of a USB-stick
* plug in the USB-stick and wait

framebuffer-vncserver
---------------------
RPI-compiled version of https://github.com/ponty/framebuffer-vncserver - lacking a proper build-environment for the `exceet imx.6` in the device, the required libraries are included in the folder and are being preloaded with `LD_LIBRARY_PATH=libs`.
