if [ -f $HOME/.cargo/env ]; then
        source $HOME/.cargo/env
fi

export RUST_SRC_PATH=("$HOME/.rustup/toolchains/stable-*/lib/rustlib/src/rust/src")
