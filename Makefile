.PHONY: all clean

all: demo.pdf

std-names.toml: extract.sh
	git submodule init
	git submodule update
	bash extract.sh

listings-rust.sty: std-names.toml listings-rust.sty.tpl
	tera -f listings-rust.sty.tpl --toml std-names.toml > listings-rust.sty

demo.pdf: listings-rust.sty demo.tex demo-example.rs demo-identifiers.rs
	latexmk -pdf demo.tex

clean:
	latexmk -C demo.tex
	rm -f std-names.toml listings-rust.sty demo.pdf
