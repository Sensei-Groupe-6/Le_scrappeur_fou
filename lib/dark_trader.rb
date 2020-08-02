#!/usr/bin/env ruby


require 'rubygems'
require 'nokogiri'
require 'open-uri'


#Recupération URL
def get_page
  page = Nokogiri::HTML(open("https://coinmarketcap.com"))
  return page
end

#Recupération des noms
def scrap_symbols
  page = get_page
  symbols = page.xpath ('//*[@class="text-left col-symbol"]')
  symbols_array = [] 
  symbols.each do |symbol|
    symbols_array << symbol.text #.text pour avoir les infos en string
  end
  return symbols_array
end

# Recupération des prix
def scrap_prices
  page = get_page
  prices = page.xpath('//*[@class="price"]')
  prices_array = []
  prices.each do |price|
    prices_array << price.text[1..-1].to_f 
  end
  return prices_array
end

# Assemblage des données
def s_p_array
  symbols_array = scrap_symbols
  prices_array = scrap_prices
  a = []
  symbols_array.each_with_index do |x, y| 
    a << {x => (prices_array) [y]} 
  end
  puts a
  return a
end

s_p_array