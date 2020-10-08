require 'rubygems'
require 'nokogiri'      
require 'open-uri'
PAGE_URL = "http://www2.assemblee-nationale.fr/deputes/liste/tableau"

page = Nokogiri::HTML(URI.open(PAGE_URL))

def get_deputes_urls 
    page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))
    urls = page.xpath('//tbody/tr/td[1]/a/@href')
    urls_depute = urls

    new_array = urls_depute.map {|string| "http://www2.assemblee-nationale.fr/" + string} 
    return new_array
    

end

def get_deputes_email(n)
    page = Nokogiri::HTML(URI.open(n))

    deputes_email = page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a/@href')
    mail_length = deputes_email.to_s.length
    deputes_email = deputes_email.to_s.slice!(7, mail_length)
    return deputes_email
end


def mail_list(deputes_urls)
    list=[] 
    deputes_urls.each do |n|
        list <<  get_deputes_email(n)   
       # puts get_deputes_email(n)
    end
    return list
end



def get_deputes_full_names
    page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))
    a = page.xpath('//tbody/tr/td[1]/a')

    full_names =[] 
    a.each do |a|
        full_names << a.text 
        end
    

    return full_names
end




def get_first_name(full_names)
    first_names =[]

    full_names.each do |full_name|
        first_names << full_name.split[1] 
    end

    return first_names
end




def get_last_name(full_names)
    last_names =[]

    full_names.each do |full_name|
        last_names <<  full_name.split[2] 
    end

    return last_names
end



def perform
    full_names = get_deputes_full_names
    first_names = get_first_name(full_names)
    last_names = get_last_name(full_names)
    deputes_urls = get_deputes_urls
    mail_list = mail_list(deputes_urls)
    

   a = Array.new(full_names.length) { Hash.new } #=> [{}, {}, {}, {}]
    i = 0

    while i < full_names.length do

        a[i]['first name'] = first_names[i] 
        a[i]['last name'] = last_names[i] 
        a[i]['email'] = mail_list[i] 

       i = i+1
    end
    

    

    

end


puts perform