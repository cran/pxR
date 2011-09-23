pkgname <- "pxR"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('pxR')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("as.array.px")
### * as.array.px

flush(stderr()); flush(stdout())

### Name: as.array.px
### Title: Extraction of data from px objects into arrays
### Aliases: as.array.px
### Keywords: manip

### ** Examples

my.px     <- read.px( system.file( "extdata", "example.px", package = "pxR"))
my.array  <- as.array( my.px )
my.array2  <- as.array( my.px ,use.codes=TRUE)
my.array3  <- as.array( my.px ,use.codes=c('municipios'))




cleanEx()
nameEx("as.data.frame.px")
### * as.data.frame.px

flush(stderr()); flush(stdout())

### Name: as.data.frame.px
### Title: Extraction of data from px into data.frame objects
### Aliases: as.data.frame.px as.data.frame
### Keywords: manip

### ** Examples

my.px.object <- read.px( system.file( "extdata", "example.px", package = "pxR") )
my.px.data   <- as.data.frame( my.px.object )



cleanEx()
nameEx("as.px.array")
### * as.px.array

flush(stderr()); flush(stdout())

### Name: as.px
### Title: Convert an array into an object of the class px
### Aliases: as.px as.px.array
### Keywords: manip

### ** Examples


my.px.object  <- read.px( system.file( "extdata", "example.px", package = "pxR") )
my.data       <- as.array( my.px.object )
my.px.object2 <- as.px( my.data )
my.px.object3 <- as.px( my.data, skeleton.px = my.px.object ) 

### export data checks
sum(my.data - as.array( my.px.object2) )
sum(my.data - as.array( my.px.object3) )

### Checks writing for missing data
oo  <- read.px(  system.file( "extdata", "example2.px", package = "pxR"))
aa  <-  as.array(oo)
aa[ sample( 1:length(aa), 5 ) ] <- NA
write.px( as.px(aa), file = 'tmp01.px' )

### append and modify keys
write.px(as.px.array(aa,skeleton.px=oo),file='tmp02.px')
write.px(as.px.array(aa,
             list.keys= list(MATRIX='xxx', CONTENTS='new data',
                             NEWKEY='an other key',
                             UNITS='people', TITLE='My Title') 
                     ),file='tmp03.px')




cleanEx()
nameEx("read.px")
### * read.px

flush(stderr()); flush(stdout())

### Name: read.px
### Title: Reads a PC-Axis file
### Aliases: read.px
### Keywords: manip

### ** Examples


my.px.object <- read.px(system.file("extdata", "example.px",
                        package = "pxR") )
my.px.data   <-  as.data.frame( my.px.object ) 




cleanEx()
nameEx("summary")
### * summary

flush(stderr()); flush(stdout())

### Name: summary.px
### Title: summary.px
### Aliases: summary.px summary
### Keywords: manip

### ** Examples

my.px.object <- read.px( system.file( "extdata", "example.px", package = "pxR") )
summary( my.px.object )



cleanEx()
nameEx("write.px")
### * write.px

flush(stderr()); flush(stdout())

### Name: write.px
### Title: Write a PC-Axis file
### Aliases: write.px
### Keywords: manip

### ** Examples



opx1 <- read.px(  system.file( "extdata", "example.px", package = "pxR")  )  
write.px ( opx1, file = 'opx.px')  #  write a   copy
opx2 <- read.px  ('opx.px')        #  read  the copy

### are de same data ?
as.array(opx1)-> a1
as.array(opx2)-> a2
sum(a1-a2)





### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
