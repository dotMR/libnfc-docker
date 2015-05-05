FROM       ubuntu:14.04
MAINTAINER dotMR

RUN apt-get update
RUN apt-get -y install wget zip gcc autoconf automake libtool pkg-config make usbutils
RUN wget https://github.com/nfc-tools/libnfc/archive/libnfc-1.7.1.tar.gz
RUN tar -xvzf libnfc-1.7.1.tar.gz

RUN sh -c "echo /usr/local/lib > /etc/ld.so.conf.d/usr-local-lib.conf"
RUN ldconfig

RUN mkdir -p .etc/nfc/devices.d

WORKDIR libnfc-libnfc-1.7.1

RUN autoreconf -vis
RUN ./configure --with-drivers=pn532_uart --enable-debug --prefix=/usr --sysconfdir=/etc
RUN make clean
RUN make
RUN make install

RUN mkdir /etc/nfc
# RUN mkdir /etc/nfc/devices.d
# RUN sudo nano /etc/nfc/devices.d/pn532_via_uart2usb.conf
# RUN echo "name = 'PN532'\nconnstring = pn532_uart:/dev/ttyUSB0\nallow_intrusive_scan = true\nlog_level = 3" >> /etc/nfc/devices.d/pn532_via_uart2usb.conf

# RUN echo "allow_autoscan = true" >> /etc/nfc/libnfc.conf
RUN echo "device.name = 'PN532'\ndevice.connstring = pn532_uart:/dev/ttyUSB0" >> /etc/nfc/libnfc.conf
# RUN cp libnfc.conf.sample /etc/nfc/libnfc.conf
