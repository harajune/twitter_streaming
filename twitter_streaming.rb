# encoding: utf-8
#

require 'twitter'
require 'json'

basedir = File.dirname(__FILE__)

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = 'xxx'
  config.consumer_secret     = 'xxx'
  config.access_token        = 'xxx'
  config.access_token_secret = 'xxx'
end

open("#{basedir}/tweets/streaming_sample.tweets", "ab") do |file| 
  client.sample(:language=>'ja', :filter_level=>'low') do |object|
    file.puts(JSON.dump(object.attrs)) if object.is_a? Twitter::Tweet
  end
end
