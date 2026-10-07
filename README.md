# Virtual Space and Global Communication Research

This repository contains the source and generated output for the project documentation.
AsciiDoc and PlantUML files in `docs-src/` are the source of truth; generated HTML is
committed to `docs/`.

## Build locally

Install Ruby, Java 17, and Graphviz, then run:

```sh
bundle install
./scripts/build-docs.sh
```

The workflow rebuilds `docs/` when documentation sources change on `main` and commits
the generated output to the same branch. It can also be run manually from the Actions tab.
