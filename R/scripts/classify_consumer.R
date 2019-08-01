# Load the required functions and packages
source('create_model_input.R')
library('e1071')
library("optparse")
library('rkafka')
library('rjson')
library('stringi')

# Load features
features <- readRDS('features.rds')

# Load the model
model <- readRDS('svm.rds')

consumer=rkafka.createConsumer("10.0.100.22:2181","tap")

while(1)
{
  tweet=rkafka.read(consumer)
  #print(tweet)
  if (tweet != "") {
    tweetObj=fromJSON(tweet)
    tweetText=stri_enc_toascii(tweetObj$text)
    print(tweetText)
    # Transform raw Text into input suitable for our model
    input_data <- create_model_input(features, tweetText)
    # Make prediction
    prediction=predict(model, newdata=input_data)
    predictionValue=as.String(prediction)
    print("Prediction")
    print(predictionValue)

    data <- c(
      tweetObj$id,
      tweetObj$text,
      tweetObj$created_at,
      tweetObj$timestamp_ms,
      tweetObj$source,
      tweetObj$retweet_count,
      tweetObj$retweeted,
      tweetObj$geo,
      tweetObj$text,
      tweetObj$user$screen_name,
      tweetObj$user$name,
      tweetObj$user$id,
      predictionValue
    )

    write.table(
      matrix(data, nrow=1), "tweet.csv",
      TRUE, TRUE, ",", "\n", "NA", ".", FALSE, FALSE, "escape", "UTF-8"
    )
  }
}
rkafka.closeConsumer(consumer)

