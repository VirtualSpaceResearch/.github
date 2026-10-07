#!/usr/bin/env bash
set -euo pipefail

rm -rf docs
mkdir -p docs
bundle exec asciidoctor \
  -r asciidoctor-diagram \
  --destination-dir docs \
  docs-src/index.adoc
