# Allow for more modular bash configuration.
for file in ~/.bashrc.d/*
do
    source $file
done
