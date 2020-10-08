
require 'rubygems'
require 'nokogiri'
require 'open-uri'    
require 'dotenv'# Appelle la gem Dotenv
require "pry"


doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   



# puts doc.class   # => Nokogiri::HTML::Document



array_name = doc.css("tbody tr.cmc-table-row td.cmc-table__cell.cmc-table__cell--sortable.cmc-table__cell--left.cmc-table__cell--sort-by__symbol div")
puts array_name.text


array_price = doc.css("tbody tr.cmc-table-row td.cmc-table__cell.cmc-table__cell--sortable.cmc-table__cell--right.cmc-table__cell--sort-by__price a.cmc-link")
puts array2.text
	


=begin


array1 = doc.css("tbody tr.cmc-table-row")
puts array1.text



html body div#__next div.sc-1mezg3x-0.fHFmDM.cmc-app-wrapper.cmc-app-wrapper--env-prod.cmc-theme--day div.container.cmc-main-section div.cmc-main-section__content div.sc-1cmdcze-0.eqFKwQ.cmc-view-all-coins div.vmm4qx-0.dSjGWZ.cmc-table-listing.cmc-table-listing--is-tab-selected div.sc-1yv6u5n-0.lhHvmy.cmc-table--sort-by__rank.cmc-table div.cmc-table__table-wrapper-outer div table tbody tr.cmc-table-row td.cmc-table__cell.cmc-table__cell--sortable.cmc-table__cell--left.cmc-table__cell--sort-by__symbol div



=end