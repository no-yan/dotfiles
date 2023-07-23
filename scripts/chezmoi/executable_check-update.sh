#!/bin/bash
LOGFILE=~/scripts/chezmoi/check-update.log
TMPFILE=~/scripts/chezmoi/check-update.tmp

export PATH=$PATH:/opt/homebrew/bin
chezmoi git pull -- --autostash --rebase && chezmoi diff > $TMPFILE 2>&1

# If the log file exists, and its content is identical to the temp file, do nothing
if [ -f "$LOGFILE" ] && cmp -s "$LOGFILE" "$TMPFILE"; then
  rm $TMPFILE
else
  # Otherwise, update the log file with the new output
  mv $TMPFILE $LOGFILE
fi
