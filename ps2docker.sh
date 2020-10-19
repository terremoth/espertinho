#!/bin/env sh
docker run -it --mount "type=bind,src=/home/shared,dst=/homebrew/shared" --workdir /opt/shared --user "$(id -u):$(id -g)" -w /homebrew -v PS2SDK:/homebrew ps2dev/ps2dev sh
