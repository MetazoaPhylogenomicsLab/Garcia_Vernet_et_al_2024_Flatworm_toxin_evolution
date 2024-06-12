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
revigo.data <- rbind(c("GO:0002252","immune effector process",0.12049128778434351,2.474955192963155,0.9381668877380674,-0,"immune effector process"),
c("GO:0006897","endocytosis",0.6399968963991822,2.7825160557860937,0.926433761239397,0.00837384,"endocytosis"),
c("GO:0032507","maintenance of protein location in cell",0.09837517426945347,2.198596289982645,0.9642203608185995,0.21730984,"endocytosis"),
c("GO:0043277","apoptotic cell clearance",0.04228015281783391,2.332547047110046,0.930424966019909,0.65448197,"endocytosis"),
c("GO:0007155","cell adhesion",1.1091577223710762,2.1023729087095586,0.9931723986994324,0.01103187,"cell adhesion"),
c("GO:0007157","heterophilic cell-cell adhesion via plasma membrane cell adhesion molecules",0.05346514369385877,3.721246399047171,0.9019461821380551,-0,"heterophilic cell-cell adhesion via plasma membrane cell adhesion molecules"),
c("GO:0007160","cell-matrix adhesion",0.09295521064310296,2.657577319177794,0.9000875187458095,0.61339728,"heterophilic cell-cell adhesion via plasma membrane cell adhesion molecules"),
c("GO:0033627","cell adhesion mediated by integrin",0.04961029007329842,3.2924298239020637,0.9022067387853078,0.58796152,"heterophilic cell-cell adhesion via plasma membrane cell adhesion molecules"),
c("GO:0031648","protein destabilization",0.004853073388032819,5.136677139879544,0.9357167461708099,0.08572765,"protein destabilization"),
c("GO:0039663","membrane fusion involved in viral entry into host cell",0.0035812674620678956,2.431798275933005,0.9408173336393,-0,"membrane fusion involved in viral entry into host cell"),
c("GO:0048008","platelet-derived growth factor receptor signaling pathway",0.013797615452619462,5.008773924307505,0.8764772454206174,0.09665752,"platelet-derived growth factor receptor signaling pathway"),
c("GO:0001555","oocyte growth",0.00038203472582279684,2.5686362358410126,0.9659092996144499,0.38081878,"platelet-derived growth factor receptor signaling pathway"),
c("GO:0031103","axon regeneration",0.0033668350675738093,3.494850021680094,0.896912936510057,0.17645422,"platelet-derived growth factor receptor signaling pathway"),
c("GO:0042059","negative regulation of epidermal growth factor receptor signaling pathway",0.004416814378544851,2.844663962534938,0.8186100362918542,0.5220708,"platelet-derived growth factor receptor signaling pathway"),
c("GO:0043407","negative regulation of MAP kinase activity",0.00023907979616007285,3.721246399047171,0.8183929784494515,0.53538884,"platelet-derived growth factor receptor signaling pathway"),
c("GO:0043410","positive regulation of MAPK cascade",0.16273939898001163,2.496209316942819,0.7497028573190814,0.60128461,"platelet-derived growth factor receptor signaling pathway"),
c("GO:0050860","negative regulation of T cell receptor signaling pathway",0.004330548472713897,4.4089353929735005,0.818749987648172,0.10872367,"platelet-derived growth factor receptor signaling pathway"),
c("GO:0051898","negative regulation of phosphatidylinositol 3-kinase/protein kinase B signal transduction",0.016848963778868638,3.721246399047171,0.7969543864107844,0.52152119,"platelet-derived growth factor receptor signaling pathway"),
c("GO:0072344","rescue of stalled ribosome",0.05757633029174538,2.1830961606243395,0.9784224762439148,0.20665487,"platelet-derived growth factor receptor signaling pathway"),
c("GO:0098542","defense response to other organism",0.8128269416212488,2.1817741063860443,0.8796711427649291,0.3290232,"platelet-derived growth factor receptor signaling pathway"),
c("GO:1905941","positive regulation of gonad development",0.001252088004632134,5.318758762624412,0.8804217788671701,0,"positive regulation of gonad development"),
c("GO:0051894","positive regulation of focal adhesion assembly",0.003687251289231639,5.008773924307505,0.8861600031998836,0.26982319,"positive regulation of gonad development"),
c("GO:1903746","positive regulation of nematode pharyngeal pumping",3.6971102498980334E-05,5.136677139879544,0.8931300469048153,0.40846646,"positive regulation of gonad development"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap_BP_NEW_mucus.pdf", width=16, height=9 ) # width and height are in inches

library("viridis")

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
  fontsize.labels=c(10,15),
  lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
  bg.labels = "#CCCCCCAA",   # define background color of group labels
								 # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
  palette=col,
  position.legend = "none"
)

dev.off()

