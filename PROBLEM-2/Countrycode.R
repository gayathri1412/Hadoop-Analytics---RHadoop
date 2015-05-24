Sys.setenv("HADOOP_PREFIX"="/home/ubuntu/Workspace/hadoop-1.1.0")
Sys.setenv("HADOOP_CMD"="/home/ubuntu/Workspace/hadoop-1.1.0/bin/hadoop")
Sys.setenv("HADOOP_STREAMING"="/home/ubuntu/Workspace/hadoop-1.1.0/contrib/streaming/hadoop-streaming-1.1.0.jar")

library(rmr2)
mydata=read.table("/home/ubuntu/Customer/Customer",sep=',',header=FALSE)
data1=mydata[,4]
## CustomerCountryCode-signature
customercountrycode=function(input, output = NULL)
{mapreduce(input = input,output = output,map = cc.map,reduce = cc.reduce,combine = TRUE)}

cc.map = function(., lines){keyval(unlist(strsplit(toString(lines),",")),1)}

cc.reduce = function(k, v){keyval(k,sum(v)) }

system("/home/ubuntu/Workspace/hadoop-1.1.0/bin/hadoop fs -rmr /customer/out")

hdfs.root = '/customer'
hdfs.data=to.dfs(keyval(1,data1))
hdfs.out=file.path(hdfs.root, 'out') 
out = customercountrycode(hdfs.data, hdfs.out)

## Get Results from HDFS
results = from.dfs(hdfs.out)

## Decompose the key and value columns
x <- results$key
y <- results$val

## Plot the values
barplot(y, main="Countrycode Frequency", xlab="Countrycode", ylab="Freq", names.arg=x)

## Sort the values and Plot them

result1=as.data.frame(results,stringAsFactors=F)
x=result1$key
y=results1$val
result2=result1[with(result1,order(-val,key)),]
x2=result2$key
y2=result2$val
barplot(y2, main="Sorted Countrycode Frequency", xlab="Countrycode", ylab="Freq", names.arg=x2, col="blue")