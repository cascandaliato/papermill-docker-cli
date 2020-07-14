#!/bin/bash

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
	papermill --help
	exit 0
fi

cd /notebooks

if [[ -f "apt-requirements.txt" ]]; then
    while read p; do
		apt-get install $p
	done <apt-requirements.txt
fi

if [[ -f "requirements.txt" ]]; then
    while read p; do
		python3 -m pip install $p
	done <requirements.txt
fi

if [[ -f "python-requirements.txt" ]]; then
    while read p; do
		python3 -m pip install $p
	done <python-requirements.txt
fi

papermill "$@"
