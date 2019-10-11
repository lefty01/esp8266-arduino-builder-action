FROM hexeo/arduino-builder

COPY entrypoint.sh /entrypoint.sh

RUN apk --no-cache add python3 && \
wget -q -O download1.tmp https://github.com/esp8266/Arduino/releases/download/2.5.2/esp8266-2.5.2.zip && \
unzip download1.tmp > /dev/null && \
rm download1.tmp && \
wget -q -O download2.tmp https://github.com/earlephilhower/esp-quick-toolchain/releases/download/2.5.0-3/x86_64-linux-gnu.xtensa-lx106-elf-20ed2b9c.tar.gz && \
tar -xvf download2.tmp > /dev/null && \
rm download2.tmp && \
mkdir -p packages/esp8266/hardware/esp8266 && \
mv esp8266-2.5.2 packages/esp8266/hardware/esp8266/2.5.2 && \
mkdir -p packages/esp8266/tools/xtensa-lx106-elf-gcc/ && \
mv xtensa-lx106-elf packages/esp8266/tools/xtensa-lx106-elf-gcc/2.5.0-3-20ed2b9

ENTRYPOINT ["/entrypoint.sh"]
