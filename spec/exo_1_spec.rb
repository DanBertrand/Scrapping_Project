require_relative '../lib/dark_trader'
require 'rubygems'
require 'nokogiri'      
require 'open-uri'
PAGE_URL = "https://coinmarketcap.com/all/views/all/"

page = Nokogiri::HTML(open(PAGE_URL).read)

describe "the crypto method" 

    it "should return an array of hashes" do
      expect(crypto.class).to eq("Array")
    end

    