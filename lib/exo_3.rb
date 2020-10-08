require 'rubygems'
require 'nokogiri'
require 'open-uri'    
require "pry"
require 'zlib'




doc = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))
       deputy_name = doc.xpath("//tbody/tr/td[1]/a")                      
       good = deputy_name.text
#puts good



def get_deputes_urls 
    pagedocurls = pagedocpute = urls

    new_array = urls_depute.map {|string| "http://www2.assemblee-nationale.fr/" + string} 
    puts new_array
end


