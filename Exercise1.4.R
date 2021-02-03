pubchem<- c(155, 157, 161, 165,  167, 175, 248, 361, 368, 372)
for (i in 1:10){
  s_file <-paste0("Saved",pubchem[1],".csv")
  filename <- paste0( "https://pubchem.ncbi.nlm.nih.gov/assay/pcget.cgi?query=download&record_type=datatable&actvty=all&response_type=save&aid=",pubchem[i])
  download.file(filename,s_file,mode="wb")
  