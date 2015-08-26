getdate <-function(x,y){
  setwd("/Users/totomai/Documents/RProjects")
  library(RCurl)
  
  print("Make sure to pick dates that is not on a Market holiday.  Use format mm/dd/yy", quote = FALSE)
  baseURL <- paste("https://www.bpiassetmanagement.com/add-on/navpu/navpu.aspx?fund=8&from=",x,"&to=",y,sep ='', collapse = NULL)
  ##convert strDates to actual Dates
 # x <- as.Date(x,"%m/%d/%Y")
 # y <- as.Date(y,"%m/%d/%Y")
 
 ##start reading
 downloadfile<-getURL(baseURL)  #download URL since it is under https
 mem<-read.csv(text=downloadfile)  #store to mem
 datalines <- grep("NAVpUGridView_Label",mem[,1],value=TRUE)   #search relevant data
 extract <- gsub(".*>(.*)<.*",'\\1',datalines)  #extract values as string
 table <- matrix(extract, ncol=4, byrow=TRUE)  #reformat using matrix
  return (table)
}

#<span id=NAVpUGridView_Label4_9>08/10/2015</span>"   .*>(.*)<.*
##URL2<-htmlTreeParse(URL1)
