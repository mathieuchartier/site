#!/bin/sh
set -e
printf "Building..."
rm -rf public/*
hugo.exe -D

hugo.exe server