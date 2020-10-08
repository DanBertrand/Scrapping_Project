require 'rubygems'
require 'nokogiri'      
require 'open-uri'
PAGE_URL = "https://www.annuaire-des-mairies.com/val-d-oise.html"

page = Nokogiri::HTML(URI.open(PAGE_URL))
    

def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(URI.open(townhall_url))

    townhall_email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
    townhall_email = townhall_email.text
    return townhall_email
end


def get_townhall_urls 
    page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
    townhall_urls = page.xpath('//p/a[@class="lientxt"]/@href')
    urls_mairie = townhall_urls

    new_array = urls_mairie.map {|string| "http://annuaire-des-mairies.com" + string.to_s.reverse.chop.reverse } 
    return new_array

end


def get_townhall_name
    page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
    
    town_hall = page.xpath('//p/a[@class="lientxt"]')
    town_hall_name_text = [] 
    
    town_hall.each do |name|  
        town_hall_name_text << name.text
    end

    return town_hall_name_text

end


array_url=[]

get_townhall_urls.each do |n|
  array_url << n  
end

puts array_url


array_adress=[]
array_adress = town_hall_name_text

puts get_townhall_urls 


	

