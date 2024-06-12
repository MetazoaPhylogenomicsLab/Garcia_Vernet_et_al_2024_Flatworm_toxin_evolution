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
revigo.data <- rbind(c("GO:0000139","Golgi membrane",0.7833344456795933,2.6903698325741012,0.9198076478643767,0.05760697,"Golgi membrane"),
c("GO:0031090","organelle membrane",5.857698230415298,2.015922966097169,0.9145687401237861,0.21287673,"Golgi membrane"),
c("GO:0005576","extracellular region",3.8687535442060237,2.8664610916297826,0.9998966287222096,5.301E-05,"extracellular region"),
c("GO:0005615","extracellular space",2.07853535653464,4.443697499232712,0.9999045240686951,0,"extracellular space"),
c("GO:0008305","integrin complex",0.04870138502266429,3.721246399047171,0.8751510751588806,3.284E-05,"integrin complex"),
c("GO:0032587","ruffle membrane",0.040394817158849655,3.3010299956639813,0.8762801430602362,0.18897042,"integrin complex"),
c("GO:0062023","collagen-containing extracellular matrix",0.3197519250837527,2.673664139071249,0.9027944161565001,0.2006365,"integrin complex"),
c("GO:0009986","cell surface",0.6578761991908514,2.1487416512809245,0.9999163416114089,4.245E-05,"cell surface"),
c("GO:0016020","membrane",49.2542153160787,3.6989700043360187,0.9998584134687742,9.537E-05,"membrane"));

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

