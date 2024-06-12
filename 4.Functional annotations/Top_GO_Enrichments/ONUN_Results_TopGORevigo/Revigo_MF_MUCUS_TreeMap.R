# A treemap R script produced by the Revigo server at http://revigo.irb.hr/
# If you found Revigo useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from Revigo. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency","value","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0004252","serine-type endopeptidase activity",0.881063286237177,3.2924298239020637,0.887374890333121,-0,"serine-type endopeptidase activity"),
c("GO:0004725","protein tyrosine phosphatase activity",0.23540908293216292,2.8827287043442356,0.8888893952308227,0.35398885,"serine-type endopeptidase activity"),
c("GO:0061791","GTPase motor activity",6.6524797362141E-06,2.3555614105321614,0.9473368404075032,0.1099649,"serine-type endopeptidase activity"),
c("GO:0005044","scavenger receptor activity",0.031337614544059214,6.958607314841775,0.9964605651829932,0,"scavenger receptor activity"),
c("GO:0005178","integrin binding",0.09852765987982164,2.8096683018297086,0.6618658376942006,0.03861428,"integrin binding"),
c("GO:0005125","cytokine activity",0.1907620739291847,2.462180904926726,0.6370522680831952,0.66852573,"integrin binding"),
c("GO:0030246","carbohydrate binding",1.0034689133835164,3.795880017344075,0.9710441480037224,-0,"carbohydrate binding"),
c("GO:0061134","peptidase regulator activity",0.29360719315780925,2.1073489661226996,0.8626497472133732,-0,"peptidase regulator activity"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more

library("viridis")

col=viridis(n=(length(unique(stuff$representative))))

treemap(
  stuff,
  index = c("representative","description"),
  vSize = "value",
  type = "categorical",
  vColor = "representative",
  title = "Revigo TreeMap",
  inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
  fontsize.labels=c(10,15),
  lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
  bg.labels = "#CCCCCCAA",   # define background color of group labels
								 # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
  position.legend = "none",
  palette=col
)

dev.off()

