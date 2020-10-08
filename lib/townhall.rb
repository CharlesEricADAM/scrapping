require 'rubygems'
require 'nokogiri' 
require 'open-uri'

def get_townhall_email
page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/95/avernes.html"))
emails = []
cities = []
townhall_emails = page.xpath(
  '/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]',
)
# puts townhall_emails
cities_names = page.xpath(
  '/html/body/div[1]/main/section[1]/div/div/div/h1',
)
# puts cities_names

townhall_emails.each {|mail| emails.push mail.text}
# puts emails
cities_names.each {|city| cities.push city.text}
# puts cities
townhash = Hash[cities.zip(emails)]
# puts townhash
result = townhash.map {|k, v| {k => v}}
# print result
end
get_townhall_email

def get_townhall_urls
  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  
  # 1. create array with names of the cities
  array_xpath = page.xpath('//a[contains(@href, "/95/")]')
  cities_list = []
  array_xpath.each {|email_link| cities_list.push email_link.text}
  # print cities_list

  # 2. Create urls with names of the cities
  cities_url_list = []
  cities_list.each {|city| cities_url_list.push "https://www.annuaire-des-mairies.com/95/" + "#{city.downcase.capitalize.gsub(' ', '-')}" +".html"}
  # puts cities_url_list
  
  # 3. Retrieve emails
  all_emails = []
  cities_url_list.each {|url| all_emails << Nokogiri::HTML(URI.open(url)).xpath(
  '/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text}
  # puts all_emails
 
  # 4. .map pour mettre dans des hash dans un array
  townmailhash = Hash[cities_list.zip(all_emails)]
  final_result = townmailhash.map {|k, v| {k => v}}
  puts final_result

end
get_townhall_urls