require_relative '../lib/mairie'
require 'rubygems'
require 'nokogiri'      
require 'open-uri'

describe "the crypto method" do
    it "should return an array of hashes" do
      expect(perform.class).to eq("Array")
    end
end
