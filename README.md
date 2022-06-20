# Rust + Arduino - Blink onboard LED

> Youtube source: https://www.youtube.com/watch?v=ZPSqhb4KKNc&ab_channel=LowLevelLearning
> Rust source: https://docs.rust-embedded.org/book/

Install `gcc-avr`

Cargo new

Add dependencies

```toml
[dependencies]
panic-halt = "0.2.0"

[dependencies.arduino-hal]
git = "https://github.com/Rahix/avr-hal"
rev = "92d540c" # git commit
```

Create config file for define your builds. Example [avr-atmega328p.json](https://raw.githubusercontent.com/Rahix/avr-hal-template/main/avr-specs/avr-atmega328p.json)

`touch .cargo/config.toml` 

```
# .cargo/config.toml

[build]
target = "avr-atmega328p.json"

[unstable]
build-std = ["core"]

[profile.dev]
panic = "abort"

[profile.release]
panic = "abort"
```

Needs to set Rust Nightly - Builds won't work otherwise

```bash
rustup override set nightly-2021-01-07
```

Write your sample code

TODO: Add repo link

Install `avrdude`. Sends `elf` files to tty devices

```bash
cd target/avr-atmega328p/debug
avrdude -p m328p -c arduino -P /dev/<your tty device | ttyACM0> -b 115200 -U flash:w:<elf file name>
```

