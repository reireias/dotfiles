#!/usr/bin/env zsh

zplug list

if ! zplug check; then
    zplug install
    if [ -e ~/.zcompdump ]; then
        rm ~/.zcompdump
    fi
    if [ -e ~/.zplug/zcompdump ]; then
        rm ~/.zplug/zcompdump; \
    fi
fi
