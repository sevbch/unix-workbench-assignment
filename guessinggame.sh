nb_of_files=0
for file in ./*
do
	if [[ -f $file ]]
	then
		let nb_of_files=$nb_of_files+1
	fi
done
over=0
error=0

function is_guess_ok {
# checking input validity
if [[ $# -eq 1 ]] && [[ $1 =~ [0-9] ]] && [[ ! $1 =~ [a-z]+ ]] && [[ $1 -ge 0 ]]
then
	if [[ $1 -eq $nb_of_files ]]
	then
		echo "Good guess, congratulations!"
		let over=1
	elif [[ $1 -gt $nb_of_files ]]
	then
		echo -n "Too high"
	else
		echo -n "Too low"
	fi
	let error=0
else
	echo "Error: please enter one positive integer"
	let error=1
fi
}

echo "How many files are there in the current directory?"
while [[ $over -eq 0 ]]
do
	read guess
	is_guess_ok $guess
	if [[ $over -eq 0 ]] && [[ $error -eq 0 ]]
	then
		echo ", try to guess again!"
	fi
done
