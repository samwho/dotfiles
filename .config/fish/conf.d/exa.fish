# https://the.exa.website
#
# exa is a modern replacement for ls. It uses colours for
# information by default, helping you distinguish between many
# types of files, such as whether you are the owner, or in the
# owning group. It also has extra features not present in the
# original ls, such as viewing the Git status for a directory, or
# recursing into directories with a tree view. exa is written in
# Rust, so it’s small, fast, and portable.
alias ll="exa -lF --git --time-style=long-iso"
