KDIR := /lib/modules/$(shell uname -r)/build
INCLUDES := -I$(PWD)/inc
EXTRA_CFLAGS += $(INCLUDES)

obj-y += tuners/
obj-y += dvb-core/
obj-y += dvb-frontends/
obj-y += dvb-usb/

all:
	make -C $(KDIR) M=$(PWD) modules
	@mkdir bin
	@mv tuners/si2157.ko ./bin/
	@mv tuners/av201x.ko ./bin/
	@mv dvb-usb/dvb-usb.ko ./bin/
	@mv dvb-usb/dvb-usb-tbs5520se.ko ./bin/
	@mv dvb-frontends/dvb-pll.ko ./bin/
	@mv dvb-frontends/si2183.ko ./bin/
	@mv dvb-core/dvb-core.ko ./bin/
clean:
	make -C $(KDIR) M=$(PWD) clean