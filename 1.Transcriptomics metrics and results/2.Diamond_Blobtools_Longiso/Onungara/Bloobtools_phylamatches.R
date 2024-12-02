

# Load the package required to read JSON files.
install.packages("rjson") # Optional.
library("rjson")
install.packages("dplyr")
library("dplyr")
# Give the input file name to the function.
setwd("/home/raquelgv/Escritorio/Raquel/Toxins/DGE/Obama_nungara/5.Blobtools/BlobDir")
a<-getwd()
a
myData <- fromJSON(file="bestsum_superkingdom.json")
myData_Dataframe <- as.data.frame(myData)
# Print the result.
print(myData)


###sacando tabla con resultados por superkingdom

str(myData)
levels(myData$values)
a <- table(myData$values)
print(a)


tablita=matrix(0,ncol=2,nrow=6) #genero una matriz para guardar los resultados
for (i in 1:6){
  tablita[i,1]=myData$keys[i]
}

for (i in 1:length(myData$values)){
  tablita[myData$values[i]+1,2]=tablita[myData$values[i]+1,2]+1
}

write.table(tablita, "Match_superkingdom_OBAMA.txt")

###sacando tabla con resultados por filo

myData1 <- fromJSON(file="bestsum_phylum.json")
print(myData1)

a1 <- table(myData1$values)
print(a1)

tablita2=matrix(0,ncol=2,nrow=74) #genero una matriz para guardar los resultados

for (i in 1:length(myData1$values)){
  tablita2[myData1$values[i]+1,2]=tablita2[myData1$values[i]+1,2]+1
}

print(tablita2)
for (i in 1:74){
  tablita2[i,1]=myData1$keys[i]
}

write.table(tablita2, "Match_phyla_OBAMA.txt")
