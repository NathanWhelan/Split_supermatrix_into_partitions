This is an R script that splits a phylogenetic data matrix into partitions (e.g. by gene). For specific details see
comments in scripts. It requires BioStrings.

To use, a phylip alignment and gene list in PartitionFinder format is needed. You must modify the name of the alignment file in the code before running it. This could be modified to accept an input argument so code doesn't have to be modified, but it currently does not because I usually run this in RStudio rather than as an Rscript command.
