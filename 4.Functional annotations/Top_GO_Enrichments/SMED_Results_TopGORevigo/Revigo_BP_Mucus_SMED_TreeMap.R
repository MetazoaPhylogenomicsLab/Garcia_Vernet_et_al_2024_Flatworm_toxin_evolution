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
revigo.data <- rbind(c("GO:0006309","apoptotic DNA fragmentation",0.02755086558224015,2.106793246940152,0.8782235246445653,-0,"apoptotic DNA fragmentation"),
c("GO:1901136","carbohydrate derivative catabolic process",1.3658357633206637,2.050122295963125,0.9722156405545089,0.34975101,"apoptotic DNA fragmentation"),
c("GO:0006959","humoral immune response",0.0659958827008465,2.000869458712629,0.9875671703179664,-0,"humoral immune response"),
c("GO:0007155","cell adhesion",1.1091577223710762,2.032452023781138,0.9952568709959911,0.00829926,"cell adhesion"),
c("GO:0048546","digestive tract morphogenesis",0.01020895377005177,3.154901959985743,0.6673233379756709,-0,"digestive tract morphogenesis"),
c("GO:0001746","Bolwig's organ morphogenesis",0.00012816648866313183,2.3205721033878812,0.7071346730248287,0.35745279,"digestive tract morphogenesis"),
c("GO:0007112","male meiosis cytokinesis",0.002292208354936781,2.106793246940152,0.6967942653901984,0.49631286,"digestive tract morphogenesis"),
c("GO:0007413","axonal fasciculation",0.0035812674620678956,2.614393726401688,0.6377193784608154,0.60455784,"digestive tract morphogenesis"),
c("GO:0007420","brain development",0.20278896194707374,2.2204035087421756,0.6187307077769248,0.60781828,"digestive tract morphogenesis"),
c("GO:0007548","sex differentiation",0.05564150926096541,2.377785977033705,0.6948415054684116,0.36543899,"digestive tract morphogenesis"),
c("GO:0008045","motor neuron axon guidance",0.03866191425326704,2.614393726401688,0.5832665897966958,0.57371266,"digestive tract morphogenesis"),
c("GO:0030241","skeletal muscle myosin thick filament assembly",0.0014541966982932267,3.0809219076239263,0.6685232135420148,0.40016255,"digestive tract morphogenesis"),
c("GO:0035158","regulation of tube diameter, open tracheal system",0.0001626728509955135,2.3205721033878812,0.6573509129944407,0.33002545,"digestive tract morphogenesis"),
c("GO:0035987","endodermal cell differentiation",0.006610433126817685,2.3205721033878812,0.6652358551757663,0.5254781,"digestive tract morphogenesis"),
c("GO:0048149","behavioral response to ethanol",0.0015601805254569702,2.265200170411153,0.7746426141580827,0.30022199,"digestive tract morphogenesis"),
c("GO:0048803","imaginal disc-derived male genitalia morphogenesis",0.00026372719782605974,2.3205721033878812,0.675025281346656,0.54303745,"digestive tract morphogenesis"),
c("GO:0072499","photoreceptor cell axon guidance",0.0003524578438236125,2.9281179926938745,0.6536234560175257,0.4394068,"digestive tract morphogenesis"),
c("GO:0060279","positive regulation of ovulation",0.00027605089865905317,3.657577319177794,0.8652948324176459,0,"positive regulation of ovulation"),
c("GO:0002682","regulation of immune system process",0.5898492929695653,2.0565054840938974,0.9105108958826196,0.10710798,"positive regulation of ovulation"),
c("GO:0042327","positive regulation of phosphorylation",0.15015690042952534,2.0462403082667713,0.8170385625097684,0.44612998,"positive regulation of ovulation"),
c("GO:0042989","sequestering of actin monomers",0.01906722992880746,2.612610173661271,0.754366188941955,0.66995793,"positive regulation of ovulation"),
c("GO:0051495","positive regulation of cytoskeleton organization",0.08239872850956079,2.6439741428068775,0.8396177030101943,0.29144416,"positive regulation of ovulation"),
c("GO:1904059","regulation of locomotor rhythm",0.00043132952915477056,2.3205721033878812,0.8681695601586391,0.36095441,"positive regulation of ovulation"),
c("GO:1904800","negative regulation of neuron remodeling",9.858960666394757E-06,2.3205721033878812,0.932505110807787,0.06638869,"negative regulation of neuron remodeling"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_MucusBP_treemap.pdf", width=16, height=9 ) # width and height are in inches


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

