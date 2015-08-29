#########################################################################################################################
#This script was written by Nathan Whelan.  

# THIS SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
# THE CONTRIBUTORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF 
# OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE 
# SOFTWARE.
##########################################################################################################################
##########################################################################################################################
# I created this script because most datasets from phylogenomic studies only have supermatrices and then the start and 
# stop position of genes. In order to partition datasets for model testing or other uses I needed individual gene alignments.
# If this could be useful for you then please feel free to give it a try.
##########################################################################################################################



library(Biostrings)
setwd("~/postDoc/Scripts/test/") ##Change as needed
rm(list = ls())

##The file name should be a supermatrix in phylip format. Must modify variable names as needed
sequenceData<-unmasked(read.AAMultipleAlignment("Dataset1_FullData.phy",format="phylip"))

##Gene list should be in PartitionFinder format (i.e. GENE_NAME = startPostition-stopPosition;)
##Semicolon at end of each line in gene list is not necessary
table<-read.table("DataSet1_GeneList_FullData.txt")
list<-data.frame(do.call('rbind', strsplit(as.character(table$V3),split="-",fixed=TRUE)))
list$X2<-gsub(";","",list$X2)

startVar<-as.data.frame(list$X1)
endVar<-as.data.frame(list$X2)
numberRows<-as.integer(nrow(startVar))

#This for loop will go through and split a supermatrix as specified by gene list
#A single alignment in fasta format will be created for each gene/partition
for(n in 1:numberRows){
subset <- AAStringSet(sequenceData, start=as.integer(as.vector(startVar[n,1])), end=as.integer(as.vector(endVar[n,1])))
LINE1=toString(n)
NAME=paste(LINE1,".fas",sep="",collapse=NULL)
write.XStringSet(x=subset, filepath = NAME, format="fasta") #This will give a unique name
print(n)
print(subset)
}


