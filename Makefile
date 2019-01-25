all: main

main: target main.tex
	xelatex -output-directory=./target main.tex
	xelatex -output-directory=./target main.tex

target:
	mkdir -p ./target

clean:
	rm -rf ./target