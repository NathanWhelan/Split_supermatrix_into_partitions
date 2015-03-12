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
setwd("~/") ##Change as needed
rm(list = ls())

##The file name should be a suprmatrix in fasta format. Must modify as needed
sequenceData <- read.AAStringSet("FASTA_MATRIX", format="fasta")

###This could be in one table and split. This was how I had my start and stop positions fomratted, but may not be easiest for you.
startVar<-read.table("nosenkoNonRiboStart.txt") #single column with start positions
endVar<-read.table("nosenkoNonRiboEnd.txt") #singel column with end positions
nrow(startVar) 
numberRows<-as.integer(nrow(startVar))

#This for loop will go through and split a supermatrix as specified by the start and stop rows files
#A single alignment in fasta format will be created for each gene or partition
for(n in 1:numberRows){
subset <- AAStringSet(sequenceData, start=startVar[n,], end=endVar[n,])
LINE1=toString(n)
NAME=paste(LINE1,".fas",sep="",collapse=NULL)
write.XStringSet(x=subset, filepath = NAME, format="fasta") #This will give a unique name
print(n)
print(subset)
}

