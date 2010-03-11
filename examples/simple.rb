#!/usr/bin/env ruby

$LOAD_PATH << File.dirname(__FILE__) + '/../lib/'
require 'mongo'

mdb = c = hash = nil

EM.run do
  mdb = Mongo.connect(:host => '127.0.0.1', :port => 27017)
  EM.next_tick do
    c = Mongo::Collection.new("testdb.test3", mdb)
    hash = c.insert(Hash.new)
    puts hash.inspect
  end
  EM.next_tick do
    found = c.find(:_id => hash[:_id]) do |res|
      puts res.inspect
    end
  end
end
