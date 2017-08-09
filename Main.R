getwd()
setwd("C:/RajuPC/7_Fantasy_Football/Raju")


ffadata <- read.csv("C:/RajuPC/7_Fantasy_Football/Raju/ffa_customrankings_modified.csv")




library(dplyr)











#****************Scraping************

library(XML)
wr = "http://www.footballdb.com/fantasy-football/index.html?pos=WR&yr=2016&wk=all&rules=1"
wr.table = readHTMLTable(wr, header=T, which=1,stringsAsFactors=F)
rb = "http://www.footballdb.com/fantasy-football/index.html?pos=RB&yr=2016&wk=all&rules=1"
rb.table = readHTMLTable(rb, header=T, which=1,stringsAsFactors=F)
qb = "http://www.footballdb.com/fantasy-football/index.html?pos=QB&yr=2016&wk=all&rules=1"
qb.table = readHTMLTable(qb, header=T, which=1,stringsAsFactors=F)
te = "http://www.footballdb.com/fantasy-football/index.html?pos=TE&yr=2016&wk=all&rules=1"
te.table = readHTMLTable(te, header=T, which=1,stringsAsFactors=F)
ki = "http://www.footballdb.com/fantasy-football/index.html?pos=K&yr=2016&wk=all&rules=1"
ki.table = readHTMLTable(ki, header=T, which=1,stringsAsFactors=F)
def = "http://www.footballdb.com/fantasy-football/index.html?pos=DST&yr=2016&wk=all&rules=1"
def.table = readHTMLTable(def, header=T, which=1,stringsAsFactors=F)

rb.table$team <- sub('.*,\\s*','', rb.table$Player)
rb.table$player <- sub('\\s*,.*','', rb.table$Player)
names(rb.table)[names(rb.table) == 'Pts*'] <- 'points'
rb.table <- rb.table[ c('team','player','points')]
rb.table[,"team"] = toupper(rb.table[,"team"])
rb.table$playerposition = "RB"

wr.table$team <- sub('.*,\\s*','', wr.table$Player)
wr.table$player <- sub('\\s*,.*','', wr.table$Player)
names(wr.table)[names(wr.table) == 'Pts*'] <- 'points'
wr.table <- wr.table[ c('team','player','points')]
wr.table[,"team"] = toupper(wr.table[,"team"])
wr.table$playerposition = "WR"

qb.table$team <- sub('.*,\\s*','', qb.table$Player)
qb.table$player <- sub('\\s*,.*','', qb.table$Player)
names(qb.table)[names(qb.table) == 'Pts*'] <- 'points'
qb.table <- qb.table[ c('team','player','points')]
qb.table[,"team"] = toupper(qb.table[,"team"])
qb.table$playerposition = "QB"

te.table$team <- sub('.*,\\s*','', te.table$Player)
te.table$player <- sub('\\s*,.*','', te.table$Player)
names(te.table)[names(te.table) == 'Pts*'] <- 'points'
te.table <- te.table[ c('team','player','points')]
te.table[,"team"] = toupper(te.table[,"team"])
te.table$playerposition = "TE"

ki.table$team <- sub('.*,\\s*','', ki.table$Player)
ki.table$player <- sub('\\s*,.*','', ki.table$Player)
names(ki.table)[names(ki.table) == 'Pts*'] <- 'points'
ki.table <- ki.table[ c('team','player','points')]
ki.table[,"team"] = toupper(ki.table[,"team"])
ki.table$playerposition = "K"

merged_scraped <- rbind(rb.table, wr.table, qb.table, te.table, ki.table)
names(merged_scraped)[names(merged_scraped) == 'points'] <- 'points2016'

merged_df1 <- merge(ffadata, merged_scraped, all.x = TRUE)



