#!/bin/sh
# Builds HTML, PDF and DOCX from docs/index.adoc using only containers defined in containers/.
set -eu
cd "$(dirname "$0")"
mkdir -p build
docker build -t vsr-plantuml containers/plantuml
docker build -t vsr-asciidoc containers/asciidoc
RUN="docker run --rm -e HOME=/tmp -u $(id -u):$(id -g) -v $PWD:/work -w /work"
$RUN vsr-plantuml -tpng -o /work/docs/diagrams docs/diagrams/*.puml
$RUN vsr-asciidoc asciidoctor -o build/index.html docs/index.adoc
$RUN vsr-asciidoc asciidoctor-pdf -o build/index.pdf docs/index.adoc
$RUN vsr-asciidoc sh -c 'asciidoctor -b docbook -o build/index.xml docs/index.adoc && pandoc -f docbook -t docx --resource-path=docs -o build/index.docx build/index.xml'
