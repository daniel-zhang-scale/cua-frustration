#!/bin/bash
# Build + checks for the CUA Frustration Gym paper (Scale AI template). Usage: ./build.sh
# Uses pdflatex + bibtex when available (e.g. MacTeX), otherwise tectonic.
set -e
cd "$(dirname "$0")"
export PATH=/Library/TeX/texbin:/opt/homebrew/bin:$PATH
GREP=/usr/bin/grep
if command -v pdflatex >/dev/null; then
  run() { pdflatex -interaction=nonstopmode -halt-on-error main.tex >/dev/null || { echo "pdflatex failed; see main.log"; $GREP -n -A3 "^!" main.log | head -40; exit 1; }; }
  run; bibtex main >/dev/null || true; run; run
elif command -v tectonic >/dev/null; then
  tectonic --keep-logs --keep-intermediates main.tex >/dev/null 2>tectonic.err || { echo "tectonic failed:"; tail -30 tectonic.err; exit 1; }
else
  echo "no LaTeX engine found (install MacTeX or tectonic)"; exit 1
fi
echo "== pages: $(pdfinfo main.pdf 2>/dev/null | $GREP Pages || python3 -c "import re;print('Pages:',len(re.findall(rb'/Type\s*/Page[^s]',open('main.pdf','rb').read())))")"
echo "== overfull hbox: $($GREP -c 'Overfull .hbox' main.log || true)   overfull vbox: $($GREP -c 'Overfull .vbox' main.log || true)"
echo "== undefined refs/citations: $($GREP -c 'undefined' main.log || true)   multiply defined: $($GREP -c 'multiply defined' main.log || true)"
echo "== bibtex warnings: $($GREP -c 'Warning--' main.blg 2>/dev/null || true)"
echo "== pending placeholders (\\tbd / \\todo / \\figbox): $($GREP -rhoE '\\(tbd|todo|figbox)[{]' sections appendix tables figures | wc -l | tr -d ' ')"
