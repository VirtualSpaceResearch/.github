#!/usr/bin/env bash
set -euo pipefail

rm -rf docs
mkdir -p docs
bundle exec asciidoctor \
  -r asciidoctor-diagram \
  --failure-level WARN \
  --destination-dir docs \
  docs-src/index.adoc
rm -rf docs/.asciidoctor
