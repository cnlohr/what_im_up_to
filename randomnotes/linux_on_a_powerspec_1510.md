# Installing Linux on a PowerSpec 1510 / PowerSpec 1710

I've taken some notes about what I needed to do to get Linux running on my powerspec.  Most notably, with regards to the NVIDIA + Intel card. This is the same laptop that's built on a clevo frame with aIntel I7-7700 and an Nvidia GTX 1070.  These instructions for the most part should also workon  

I admit some of this is a little hocus pocus and may not be needed, but I do currently have a working system.

In BIOS, set the video card to Dedicated.  It's very difficult to get the system installed if you're dealing with the whole hybrid thing.

You can then install your system, and install the NVIDIA drivers.  As a note, what I did was I used ntfsresize to change the size of the Windows partition on the nvme to be smaller, then used fdisk to manually set up partitions and told the installer what to do, since the installer wants to just put everything on the spinny disk.

Once you're booted into your new system on NVIDIA, you can edit your grub defaults. ```/etc/defaults/grub```

Make yours look like this.  It is important that the kernel and grub don't try doing stuff with non-text modes here, otherwise stuff will break and it'll be really painful to fix.

```
GRUB_DEFAULT=0
#GRUB_HIDDEN_TIMEOUT=0
GRUB_HIDDEN_TIMEOUT_QUIET=true
GRUB_TIMEOUT=10
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="nofb vga=normal psmouse.synaptics_intertouch=1"
GRUB_GFXPAYLOAD_LINUX=text
GRUB_CMDLINE_LINUX=""
```

A big note:  You should realy include `psmouse.synaptics_intertouch=1` otherwise the touchpad will behave squirelly every now and then.

You should also edit the ELILO section of ```/etc/grub.d/10_linux``` so it looks like this, to prevent grub from trying to do video stuff.
```
  if [ "x$GRUB_GFXPAYLOAD_LINUX" = x ]; then
      echo "    #load_video" | sed "s/^/$submenu_indentation/"
  else
      if [ "x$GRUB_GFXPAYLOAD_LINUX" != xtext ]; then
          echo "        #load_video" | sed "s/^/$submenu_indentation/"
      fi
  fi
  if ([ "$ubuntu_recovery" = 0 ] || [ x$type != xrecovery ]) && \
     ([ "x$GRUB_GFXPAYLOAD_LINUX" != x ] || [ "$gfxpayload_dynamic" = 1 ]); then
      echo "    #gfxmode \$linux_gfx_mode" | sed "s/^/$submenu_indentation/"
      echo "    gfxmode text" | sed "s/^/$submenu_indentation/"
  fi
```

You'll also need to install an hwe kernel.  I'm not sure why, but before I did this, I had a hard as nails time getting the intel video working.

```apt-get install linux-headers-4.10.0-20-lowlatency linux-image-lowlatency-hwe-16.04-edge --install-recommends```

May want to theraputically run ```update-grub2```

```sudo apt-get --no-install-recommends install bumblebee primus```

```apt-get install gdm3```
Select gdm3 as your interface.  I don't know why lightdm is busted on these systems...  EDIT: Not sure why, now it's the other way around...

You may need to enter multi-user mode.  This will prevent a display manager from starting automatically. ```systemctl set-default multi-user.target```

Copy the xorg.conf seen below int your ```/etc/xorg.conf``` then reboot your system.

### Day-to-day use.

As a warning: You may need to actually turn the GPU on and off manually.

 ```
 tee /proc/acpi/bbswitch <<<OFF
 tee /proc/acpi/bbswitch <<<ON
 ```
 
 Unfortunately, in my experience, this doesn't seem to fix it all the time.

### Work-around!!!

Ok, so something's up with xorg.conf's getting overwritten, but it seems if you add them to copy-in on boot, everything works.

This is my current rc.local...

```
echo "disable" > /sys/firmware/acpi/interrupts/gpe6F
echo "rc.local" > /tmp/rclocal

cp /root/xorg.conf.nvidia3 /etc/X11/xorg.conf
cp /root/xorg.conf.nvidia3 /etc/xorg.conf

rfkill block bluetooth
sudo insmod /lib/modules/$(uname -r)/extra/clevo-xsm-wmi.ko poll_freq=20
exit 0
```


### Bonus commands

Monitor power usage: 

```watch upower -i /org/freedesktop/UPower/devices/battery_BAT0```


# Additional features, like that keyboard


Disable kernel verification
```
sudo ssh-keygen -t rsa
sudo apt-get install mokutil
sudo mokutil --disable-validation
```

For the keyboard, etc...

https://github.com/cnlohr/clevo_xsm_wmi




# Appendix: /etc/xorg.conf
Here's my xorg.conf -- copy this into /etc/X11/xorg.conf before booting gdm3.
```
Section "ServerLayout"
	Identifier     "X.org Configured"
	Screen      0  "Screen0" 0 0
	Screen      1  "Screen1" RightOf "Screen0"
	InputDevice    "Mouse0" "CorePointer"
	InputDevice    "Keyboard0" "CoreKeyboard"
EndSection

Section "Files"
	ModulePath   "/usr/lib/xorg/modules"
	FontPath     "/usr/share/fonts/X11/misc"
	FontPath     "/usr/share/fonts/X11/cyrillic"
	FontPath     "/usr/share/fonts/X11/100dpi/:unscaled"
	FontPath     "/usr/share/fonts/X11/75dpi/:unscaled"
	FontPath     "/usr/share/fonts/X11/Type1"
	FontPath     "/usr/share/fonts/X11/100dpi"
	FontPath     "/usr/share/fonts/X11/75dpi"
	FontPath     "built-ins"
EndSection

Section "Module"
	Load  "glx"
EndSection

Section "InputDevice"
	Identifier  "Keyboard0"
	Driver      "kbd"
EndSection

Section "InputDevice"
	Identifier  "Mouse0"
	Driver      "mouse"
	Option	    "Protocol" "auto"
	Option	    "Device" "/dev/input/mice"
	Option	    "ZAxisMapping" "4 5 6 7"
EndSection

Section "Monitor"
	Identifier   "Monitor0"
	VendorName   "Monitor Vendor"
	ModelName    "Monitor Model"
EndSection

Section "Monitor"
	Identifier   "Monitor1"
	VendorName   "Monitor Vendor"
	ModelName    "Monitor Model"
EndSection

Section "Device"
        ### Available Driver options are:-
        ### Values: <i>: integer, <f>: float, <bool>: "True"/"False",
        ### <string>: "String", <freq>: "<f> Hz/kHz/MHz",
        ### <percent>: "<f>%"
        ### [arg]: arg optional
        #Option     "Accel"              	# [<bool>]
        #Option     "AccelMethod"        	# <str>
        #Option     "Backlight"          	# <str>
        #Option     "CustomEDID"         	# <str>
        #Option     "DRI"                	# <str>
        #Option     "Present"            	# [<bool>]
        #Option     "ColorKey"           	# <i>
        #Option     "VideoKey"           	# <i>
        #Option     "Tiling"             	# [<bool>]
        #Option     "LinearFramebuffer"  	# [<bool>]
        #Option     "HWRotation"         	# [<bool>]
        #Option     "VSync"              	# [<bool>]
        #Option     "PageFlip"           	# [<bool>]
        #Option     "SwapbuffersWait"    	# [<bool>]
        #Option     "TripleBuffer"       	# [<bool>]
        #Option     "XvPreferOverlay"    	# [<bool>]
        #Option     "HotPlug"            	# [<bool>]
        #Option     "ReprobeOutputs"     	# [<bool>]
        #Option     "XvMC"               	# [<bool>]
        #Option     "ZaphodHeads"        	# <str>
        #Option     "VirtualHeads"       	# <i>
        #Option     "TearFree"           	# [<bool>]
        #Option     "PerCrtcPixmaps"     	# [<bool>]
        #Option     "FallbackDebug"      	# [<bool>]
        #Option     "DebugFlushBatches"  	# [<bool>]
        #Option     "DebugFlushCaches"   	# [<bool>]
        #Option     "DebugWait"          	# [<bool>]
        #Option     "BufferCache"        	# [<bool>]
	Identifier  "Card0"
	Driver      "intel"
	BusID       "PCI:0:2:0"
EndSection

Section "Device"
        ### Available Driver options are:-
        ### Values: <i>: integer, <f>: float, <bool>: "True"/"False",
        ### <string>: "String", <freq>: "<f> Hz/kHz/MHz",
        ### <percent>: "<f>%"
        ### [arg]: arg optional
        #Option     "ShadowFB"           	# [<bool>]
        #Option     "Rotate"             	# <str>
        #Option     "fbdev"              	# <str>
        #Option     "debug"              	# [<bool>]
	Identifier  "Card1"
	Driver      "fbdev"
	BusID       "PCI:1:0:0"
EndSection

Section "Screen"
	Identifier "Screen0"
	Device     "Card0"
	Monitor    "Monitor0"
	SubSection "Display"
		Viewport   0 0
		Depth     1
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     4
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     8
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     15
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     16
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     24
	EndSubSection
EndSection

Section "Screen"
	Identifier "Screen1"
	Device     "Card1"
	Monitor    "Monitor1"
	SubSection "Display"
		Viewport   0 0
		Depth     1
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     4
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     8
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     15
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     16
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     24
	EndSubSection
EndSection

```
