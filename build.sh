#!/bin/bash
export BD="$(dirname "$(readlink -f "$0")")"
export GTMP="$BD/cache"; [ ! -d "$GTMP" ] && mkdir "$GTMP"
export WORKDIR="$BD/workdir" GCOMM="gearlock"
export GRLOAD="$BD/gearload"; [ ! -d "$GRLOAD" ] && mkdir "$GRLOAD"
chmod +x "$BD"/source
"$BD"/source
