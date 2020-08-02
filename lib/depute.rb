#!/usr/bin/env ruby


require 'rubygems'
require 'nokogiri'
require 'open-uri'


#Récupération de l'URL
def depute_url
  page = Nokogiri::HTML(open("https://www.voxpublic.org/"))
  return page
end

#Récupération des mails
def depute_mail
  page = depute_url
  mail = page.xpath ('//*[contains(text(), "@assemblee-nationale.fr")]')
  mail_array = [] 
  mail.each do |mails|
    mail_array << { "emails" => mails.text } 
  end
  return mail_array
end

#Prénoms & noms
def names
  page = depute_url
  names_array = []
    names = page.xpath('//*[@class="titre_normal"]').each do |the_name| 

      names_array << { "first_name" => the_name.text.split(" ")[1], "last_name" => the_name.text.split(" ")[2]}
    end

    return names_array
  end

  #Assemblages de tous les infos
def names_mails
  mail_array = depute_mail
  names_array = names
  a = []

  names_array.each_with_index do |x, y|
    a << {x => (mail_array) [y]}
  end
  
  puts a
  return a
end

names_mails