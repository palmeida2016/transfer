#!/bin/bash
#SBATCH --time=7-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --job-name=kirby
#SBATCH --partition=longq7-eng
#SBATCH --exclusive
#SBATCH --exclude=nodeeng[001-010]
#SBATCH --mem=1000000M
#SBATCH --hint=nomultithread

NAME=${PWD##*/}

if [[ -d ${PWD%/*/*}/results/$NAME ]] ; then
    	i=0
    	while [[ -d ${PWD%/*/*}/results/$NAME-$i ]] ; do
        	let i++
    	done
	NAME=$NAME-$i
fi

cp -rp $PWD ${PWD%/*/*}/results/$NAME
cd ${PWD%/*/*}/results/$NAME
./Allrun
