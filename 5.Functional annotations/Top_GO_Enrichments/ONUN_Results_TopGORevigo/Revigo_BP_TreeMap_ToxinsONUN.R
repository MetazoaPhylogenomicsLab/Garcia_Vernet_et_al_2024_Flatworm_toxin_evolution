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
revigo.data <- rbind(c("GO:0003094","glomerular filtration",0.0019545389521127606,4.769551078621726,0.9133555722714299,-0,"glomerular filtration"),
c("GO:0007586","digestion",0.043717096334960945,4.455931955649724,0.9026933838967477,0.32736819,"glomerular filtration"),
c("GO:0016042","lipid catabolic process",1.4093137798594644,4.4089353929735005,0.9965807269124407,0.04619971,"lipid catabolic process"),
c("GO:0016339","calcium-dependent cell-cell adhesion via plasma membrane cell adhesion molecules",0.05202573543656513,6.431798275933005,0.9967811052455765,0,"calcium-dependent cell-cell adhesion via plasma membrane cell adhesion molecules"),
c("GO:0032222","regulation of synaptic transmission, cholinergic",0.011843076500506701,2.106793246940152,0.9032962846333278,0.09158571,"regulation of synaptic transmission, cholinergic"),
c("GO:0002694","regulation of leukocyte activation",0.20037844606414024,2.0366844886138886,0.9145652003633956,0.13496579,"regulation of synaptic transmission, cholinergic"),
c("GO:1904892","regulation of receptor signaling pathway via STAT",0.021719290348067646,2.047207556955908,0.8798461264273989,0.43080636,"regulation of synaptic transmission, cholinergic"),
c("GO:0035006","melanization defense response",0.004059427054388041,6.026872146400302,0.6515110230198482,0.00596319,"melanization defense response"),
c("GO:0002281","macrophage activation involved in immune response",0.008392440267268536,2.047207556955908,0.623323459732483,0.65355641,"melanization defense response"),
c("GO:0007218","neuropeptide signaling pathway",0.15917784943927654,4.920818753952375,0.7973431820093421,0.17319237,"melanization defense response"),
c("GO:0019731","antibacterial humoral response",0.013432833907962858,4.214670164989233,0.6358861704098994,0.69320218,"melanization defense response"),
c("GO:0031640","killing of cells of another organism",0.05684676720243216,5.161150909262744,0.835854183448495,0.49878638,"melanization defense response"),
c("GO:0032094","response to food",0.0032460627994104732,3.886056647693163,0.8345284690198448,0.35261851,"melanization defense response"),
c("GO:0035010","encapsulation of foreign target",0.0005299191358187181,5.958607314841775,0.7977294124645006,0.41511491,"melanization defense response"),
c("GO:0045087","innate immune response",0.2587114515870314,4.236572006437063,0.5809115747002523,0.65309225,"melanization defense response"),
c("GO:0048143","astrocyte activation",0.002306996795936373,2.106793246940152,0.6897857173319332,0.42375386,"melanization defense response"),
c("GO:0050482","arachidonic acid secretion",0.03491304445987043,2.6020599913279625,1,-0,"arachidonic acid secretion"),
c("GO:0060267","positive regulation of respiratory burst",0.00065808562448185,4.769551078621726,0.9057550370941205,-0,"positive regulation of respiratory burst"),
c("GO:0050729","positive regulation of inflammatory response",0.013491987671961225,2.7166987712964503,0.8816292024432701,0.27828965,"positive regulation of respiratory burst"),
c("GO:0050810","regulation of steroid biosynthetic process",0.015404626041241808,2.2403321553103694,0.9192838628154085,0.15281666,"positive regulation of respiratory burst"),
c("GO:0051341","regulation of oxidoreductase activity",0.00037710524548959944,2.1897674820049158,0.8657775249128371,0.58627056,"positive regulation of respiratory burst"),
c("GO:0051354","negative regulation of oxidoreductase activity",7.887168533115806E-05,2.011887159731648,0.871153279101562,0.61567863,"positive regulation of respiratory burst"),
c("GO:1903818","positive regulation of voltage-gated potassium channel activity",3.204162216578296E-05,2.496209316942819,0.8494046522427307,0.21573977,"positive regulation of respiratory burst"),
c("GO:2000296","negative regulation of hydrogen peroxide catabolic process",2.21826614993882E-05,2.011887159731648,0.9356311527781497,0.11612686,"positive regulation of respiratory burst"),
c("GO:0097168","mesenchymal stem cell proliferation",0.00024400927649327026,2.011887159731648,0.9974811499575621,0.00514472,"mesenchymal stem cell proliferation"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap_BP_Toxins.pdf", width=16, height=9 ) # width and height are in inches

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
  fontsize.labels=c(10,15),
  palette=col,
  position.legend = "none"
)

dev.off()

