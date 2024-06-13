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
revigo.data <- rbind(c("GO:0003774","cytoskeletal motor activity",0.3926027441124113,2.1739251972991736,1,-0,"cytoskeletal motor activity"),
c("GO:0004336","galactosylceramidase activity",0.0030401832394498433,2.1079053973095196,1,-0,"galactosylceramidase activity"),
c("GO:0015485","cholesterol binding",0.07750138892689426,2.769551078621726,0.9585593736937617,0,"cholesterol binding"),
c("GO:0030246","carbohydrate binding",1.0034689133835164,2.050609993355087,0.9523145693729269,0.04346965,"carbohydrate binding"),
c("GO:0050839","cell adhesion molecule binding",0.35693436526007666,2.3665315444204134,0.8311630176333563,0.03477123,"cell adhesion molecule binding"),
c("GO:0045296","cadherin binding",0.1230509176807522,2.1739251972991736,0.8336326370708376,0.36335199,"cell adhesion molecule binding"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_MucusMF_treemap.pdf", width=16, height=9 ) # width and height are in inches


library(viridis)
col=viridis(n=(length(unique(stuff$representative))))

# check the tmPlot command documentation for all possible parameters - there are a lot more
treemap(
  stuff,
  index = c("representative","description"),
  vSize = "value",
  type = "categorical",
  vColor = "representative",
  title = "Revigo TreeMap",
  inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
  lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
  bg.labels = "#CCCCCCAA",   # define background color of group labels
								 # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
  position.legend = "none",
  fontsize.labels=c(10,15),
  palette=col
)

dev.off()

