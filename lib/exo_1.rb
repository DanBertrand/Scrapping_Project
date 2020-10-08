
require 'rubygems'
require 'nokogiri'
require 'open-uri'    
require "pry"
require 'zlib'


doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))


name_currency = doc.xpath("/html/body/div[1]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[2]/div/a")

price_currency = doc.css("tbody tr.cmc-table-row td.cmc-table__cell.cmc-table__cell--sortable.cmc-table__cell--right.cmc-table__cell--sort-by__price a.cmc-link")
	

name_array=[]
price_array=[]


name_currency.each do |name_currency|
    name_array << name_currency.text 
    end
    
price_currency.each do |price_currency|
    price_array << price_currency.text 
    end


new_hash = Hash[*name_array.zip(price_array).flatten]

	
good_hash = new_hash.map { |k, v| { k => v } }



puts good_hash







