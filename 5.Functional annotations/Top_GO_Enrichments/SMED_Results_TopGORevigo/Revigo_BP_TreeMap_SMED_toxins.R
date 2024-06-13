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
revigo.data <- rbind(c("GO:0006935","chemotaxis",0.49931938665039544,5.508638306165727,0.881642133755262,0,"chemotaxis"),
c("GO:0007218","neuropeptide signaling pathway",0.15917784943927654,3.3979400086720375,0.7773303614210113,0.24416798,"chemotaxis"),
c("GO:0030431","sleep",0.010738872905870488,2.207608310501746,1,-0,"sleep"),
c("GO:0032222","regulation of synaptic transmission, cholinergic",0.011843076500506701,2.619788758288394,0.893611316069833,0.08579993,"regulation of synaptic transmission, cholinergic"),
c("GO:1903818","positive regulation of voltage-gated potassium channel activity",3.204162216578296E-05,2.886056647693163,0.9110612128859171,-0,"positive regulation of voltage-gated potassium channel activity"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap_TOXINS_SMED_BP.pdf", width=16, height=9 ) # width and height are in inches


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

