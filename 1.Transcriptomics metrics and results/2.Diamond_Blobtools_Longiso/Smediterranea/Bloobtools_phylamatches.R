

# Load the package required to read JSON files.
install.packages("rjson") # Optional.
library("rjson")
# Give the input file name to the function.
setwd("/home/raquelgv/Escritorio/Raquel/Toxins/DGE/Schmidtea_med/5.Blobtools/BlobDir")
a<-getwd()
a
myData <- fromJSON(file="bestsum_superkingdom.json")
print(myData)

###sacando tabla con resultados por superkingdom

str(myData)
a <- table(myData$values)
print(a)


tablita=matrix(0,ncol=2,nrow=6) #genero una matriz para guardar los resultados

for (i in 1:length(myData$values)){
  tablita[myData$values[i]+1,2]=tablita[myData$values[i]+1,2]+1
}

for (i in 1:6){
  tablita[i,1]=myData$keys[i]
}

write.table(tablita, "Match_superkingdom_SCHMIDTEA.txt")

###sacando tabla con resultados por filo

myData1 <- fromJSON(file="bestsum_phylum.json")
print(myData1)

a1 <- table(myData1$values)
print(a1)

tablita2=matrix(0,ncol=2,nrow=75) #genero una matriz para guardar los resultados

for (i in 1:length(myData1$values)){
  tablita2[myData1$values[i]+1,2]=tablita2[myData1$values[i]+1,2]+1
}
for (i in 1:75){
  tablita2[i,1]=myData1$keys[i]
}

print(tablita2)

tablita2[1,2]

write.table(tablita2, "Match_phyla_SCHMIDTEA.txt")
