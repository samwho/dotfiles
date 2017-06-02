if [ -f $HOME/.cargo/env ]; then
        source $HOME/.cargo/env
fi

export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
