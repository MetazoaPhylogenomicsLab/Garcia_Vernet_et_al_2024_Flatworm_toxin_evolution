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
revigo.data <- rbind(c("GO:0005576","extracellular region",3.8687535442060237,27.387216143280263,0.9999475794416918,0,"extracellular region"),
c("GO:0005615","extracellular space",2.07853535653464,3,0.7407295333008167,5.301E-05,"extracellular space"),
c("GO:0071756","pentameric IgM immunoglobulin complex",0.001038631578544575,3.2596373105057563,0.5549857012788979,0.40738978,"extracellular space"),
c("GO:0009897","external side of plasma membrane",0.28853831290749204,5.698970004336019,0.9999550624879474,4.151E-05,"external side of plasma membrane"),
c("GO:0031838","haptoglobin-hemoglobin complex",0.011916930743300913,2.0132282657337552,0.9132752981124912,-0,"haptoglobin-hemoglobin complex"),
c("GO:1904724","tertiary granule lumen",0.00013666204980849672,2.0132282657337552,0.8823948274648072,2.254E-05,"tertiary granule lumen"),
c("GO:0035580","specific granule lumen",0.0001540554016023054,2.0132282657337552,0.8823946796171106,0.48502356,"tertiary granule lumen"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

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
  position.legend = "none"
)

dev.off()

