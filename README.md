Generally, when phylogenetic supermatrices are published they are published as a single data matrix with gene partitions described either in a nexus file or as a seperate file. However, sometimes it can be useful to do single-gene analyses with previously published datasets so I developed this script. 

This is an R script that splits a phylogenetic data matrix into partitions (e.g. by gene). For specific details see
comments in scripts. It requires BioStrings.

To use, a phylip alignment and gene list in PartitionFinder format is needed. You must modify the name of the alignment file in the code before running it. This could be modified to accept an input argument so code doesn't have to be modified, but it currently does not because I usually run this in RStudio rather than as an Rscript command.

See bash file in the repository dropping taxa that were not sampled for any given gene.
