#!/bin/bash

##Designed to be run in a folder full of single gene alignments in fasta format with the suffix .fas.
##Please note that this has been tested only with single gene files output by splitSuperMatrices.r

##Recommended for use with amino acids
##Tested with amino acids. May work for nucleotides, but may need to change X's below to NNNNNNs.  
##This file assumes that taxa that were not sampled for any given gene are represented by X's, and things like gaps
##are represented by - or ?
##Output files will be names the same as fasta files in folder, but with the .dropped suffix.  

for FILE in *.fas
do
#Removes sequence warpping..does the same as nentferner.pl
sed -e 's/\(^>.*$\)/#\1#/' $FILE | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' >$FILE.nent

##Removed any sequence with Xs and the cooresponding fasta header. Makes the assumption that no real sequence has 7 Xs in 
##a row.  If your sequnces do, they may not be the greatest sequences.... Also assumes genes are at least 7 positions long.
tac $FILE.nent |sed '/XXXXXXX/I,+1 d' |tac > $FILE.dropped
done
##Clean-up
rm *.nent
