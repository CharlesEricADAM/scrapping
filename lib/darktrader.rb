require 'rubygems'
require 'nokogiri' 
require 'open-uri'

def crypto_scrapper
page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

#stock emails links into a array
#all_emails_links = page.xpath('/mettre_ici_le_XPath')
#XPath Bitcoin
#//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/a
array_list = []
array_value = []

crypto_list = page.xpath(
  '//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/a',
  '//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[2]/td[2]/div/a',
  '//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[3]/td[2]/div/a'
)
crypto_value = page.xpath(
  '//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[5]/a',
  '//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[2]/td[5]/a',
  '//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[3]/td[5]/a'
)

crypto_list.each do |name|
  # puts name.text
  array_list << name.text
  end
# print array_list
  
crypto_value.each do |val|
# puts val.text
  array_value << val.text.delete('$'',').to_f
  end
# print array_value

cryptohash = Hash[array_list.zip(array_value)]
final_result = cryptohash.map {|k, v| {k => v}}
print final_result

# cryptohash.each {|handle| final_kv_list << (handle)}
# print final_kv_list

end
crypto_scrapper