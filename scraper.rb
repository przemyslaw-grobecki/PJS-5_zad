require 'open-uri'
require 'net/http'
require 'nokogiri'

html = URI.open(
    "https://www.amazon.it/gp/bestsellers/?ref_=nav_cs_bestsellers",
    ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE,
    'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',
    'sec-ch-ua' => '"Not_A Brand";v="99", "Google Chrome";v="109", "Chromium";v="109"',
    'accept-language' => 'pl-PL,pl;q=0.9,en-US;q=0.8,en;q=0.7'
)
doc = Nokogiri::HTML(html)
productCards = doc.css('div.p13n-sc-uncoverable-faceout')
puts "In todays bestseller list we can find: \n"
#puts productCards
productCards.each do |card|
    puts "Product with title: %s" %[card.css('div.p13n-sc-truncate-desktop-type2.p13n-sc-line-clamp-4').text]
    puts "For the price of: %s" %[card.css('span._cDEzb_p13n-sc-price_3mJ9Z').text]
end


