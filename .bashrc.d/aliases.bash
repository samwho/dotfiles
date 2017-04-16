# Allow for more modular bash configuration.
for file in ~/.bashrc.d/aliases.d/*.bash; do source $file; done
