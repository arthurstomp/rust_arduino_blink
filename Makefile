build:
	rustup override set nightly-2021-01-07
	cargo build

clean:
	cargo clean

burn: target/avr-atmega328p/debug/rust_arduino_blink.elf
	sudo avrdude -p m328p -c arduino -P /dev/ttyACM0 -b 115200 -U flash:w:target/avr-atmega328p/debug/rust_arduino_blink.elf
