#!/bin/sh
export CLASSPATH=./bin/:~/code/10gen/appserver/build/
for i in ~/code/10gen/appserver/include/*.jar; do
  export CLASSPATH=${CLASSPATH}:${i}
done
export ED_HOME=~/code/10gen/appserver

#javac -d bin src/mongo/ruby/Mongo.java
#java mongo.ruby.Mongo
jruby mongo.rb