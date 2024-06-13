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
revigo.data <- rbind(c("GO:0003697","single-stranded DNA binding",0.40260363864918647,2.721246399047171,0.9555022604730772,0.03778613,"single-stranded DNA binding"),
c("GO:0003823","antigen binding",0.051474670705579297,3.638272163982407,0.9602105124599719,0.03216791,"antigen binding"),
c("GO:0005125","cytokine activity",0.1907620739291847,7.920818753952375,0.5421152910973571,0,"cytokine activity"),
c("GO:0005139","interleukin-7 receptor binding",0.001241796217426632,3.275724130399211,0.7720190113847231,0.50199541,"cytokine activity"),
c("GO:0016608","growth hormone-releasing hormone activity",0.0020290063195453007,2.0132282657337552,0.6222049386451902,0.62688147,"cytokine activity"),
c("GO:0034987","immunoglobulin receptor binding",0.006872011567509165,4.769551078621726,0.7573891232265356,0.55619135,"cytokine activity"),
c("GO:0099106","ion channel regulator activity",0.11105871420960357,2.3124710387853655,0.764227843150247,0.52729305,"cytokine activity"),
c("GO:0005534","galactose binding",0.00029270910839342037,5.017728766960432,0.9621201345390101,0.02341699,"galactose binding"),
c("GO:0019862","IgA binding",0.0001840519393685901,4.769551078621726,0.9696006087638326,0.0228589,"IgA binding"),
c("GO:0031210","phosphatidylcholine binding",0.03645780644769867,3.537602002101044,0.954089287389333,0.06347982,"phosphatidylcholine binding"),
c("GO:0042834","peptidoglycan binding",0.04667158033603272,4.161150909262744,0.9604166993430906,0.03194174,"peptidoglycan binding"),
c("GO:0047498","calcium-dependent phospholipase A2 activity",0.025518912268117287,2.6055483191737836,1,-0,"calcium-dependent phospholipase A2 activity"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap_MF_Toxins.pdf", width=16, height=9 ) # width and height are in inches

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

