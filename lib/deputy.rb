require 'rubygems'
require 'nokogiri' 
require 'open-uri'

def get_deputy_list
  page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique#Z"))
  xpath_link = page.xpath('//a[contains(@href, "deputes/fiche/OMC")]')
  # puts xpath_link
  # deputy_list = []
  # xpath_link.each {|name| deputy_list << name.text}
  # # print deputy_list
  # deputy_array = []
  # deputy_list.each {|deputy| deputy_array << deputy.split(/ /)}
  # print deputy_array
  deputy_list = []
  xpath_link.each {|name| deputy_list << [name.text.split(" ")[1], name.text.split(" ")[2..-1].join(" ").capitalize]}
  return deputy_list
end
# get_deputy_list

def get_first_last_name
  final_array_of_hash = []
  get_deputy_list.length.times {|i| 
    deputyhash = {}
    deputyhash["firstname"] = get_deputy_list[i][0]
    deputyhash["lastname"] = get_deputy_list[i][1]
    final_array_of_hash << deputyhash
  }
  puts final_array_of_hash
end
get_first_last_name
  
# def get_deputy_email
#   page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036"))
#   first_last_name_email = []
#   email_list = page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
#   email_list.each {|email| puts email.text}
#   puts email.list.text.split(/./)
# end
# get_deputy_email

# def get_url_list
#   page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique#Z"))
  
# end
