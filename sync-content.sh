#!/bin/bash
# Syncs wiki content from the main Wiki vault into Quartz's content directory.
# Run this before building Quartz.

WIKI_DIR="${WIKI_SOURCE:-../Wiki/wiki}"

if [ ! -d "$WIKI_DIR" ]; then
  echo "Error: Wiki directory not found at $WIKI_DIR"
  echo "Set WIKI_SOURCE env var to point to your wiki/ folder."
  exit 1
fi

# Clean old content and copy fresh
rm -rf content/*
cp -r "$WIKI_DIR"/* content/

echo "Synced content from $WIKI_DIR"
