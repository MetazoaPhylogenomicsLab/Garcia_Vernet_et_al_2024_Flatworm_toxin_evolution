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
revigo.data <- rbind(c("GO:0005576","extracellular region",3.8687535442060237,2.9546770212133424,0.9999333642083995,3.421E-05,"extracellular region"),
c("GO:0005604","basement membrane",0.08395770910871446,2.001740661576301,0.879721063011544,3.655E-05,"basement membrane"),
c("GO:0016459","myosin complex",0.1716177173849682,2.4934949675951277,0.9835749746276968,3.926E-05,"myosin complex"),
c("GO:0032982","myosin filament",0.041388722975638725,3.9208187539523753,0.9999503598656427,0,"myosin filament"),
c("GO:0045177","apical part of cell",0.24570842649750918,2.3151546383555877,0.9999444346484301,4.079E-05,"apical part of cell"),
c("GO:0097482","muscle cell postsynaptic specialization",0.00019381163427386808,2.321481620959886,0.9023808056311488,0.06577436,"muscle cell postsynaptic specialization"),
c("GO:0016324","apical plasma membrane",0.21645280878032302,2.0931264652779293,0.707137973631551,0.60045081,"muscle cell postsynaptic specialization"),
c("GO:0031528","microvillus membrane",0.00916629639533717,2.321481620959886,0.7291570794946601,0.4043766,"muscle cell postsynaptic specialization"),
c("GO:0036062","presynaptic periactive zone",0.00012175346255666071,2.321481620959886,0.6935196086449338,0.33461169,"muscle cell postsynaptic specialization"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

library(viridis)
col=viridis(n=(length(unique(stuff$representative))))

# by default, outputs to a PDF file
pdf( file="revigo_treemap_CC_SMED_MUCUS.pdf", width=16, height=9 ) # width and height are in inches

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

