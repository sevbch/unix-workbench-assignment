all: guessinggame.sh README.md
guessinggame.sh:
	touch guessinggame.sh
README.md: guessinggame.sh
	echo "# Guessing Game project" > README.md
	date +%D >> README.md
	date +%T >> README.md
	echo -n "Number of lines in \`guessinggame.sh\`: " >> README.md
	wc -l guessinggame.sh | tr ' ' '\n' | grep "[0-9]" >> README.md
clean:
	rm README.md
