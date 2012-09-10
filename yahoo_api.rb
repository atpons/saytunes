# coding: utf-8
require 'rexml/document'
require 'open-uri'

def split(text)
  appid = "アプリID"
  filter = '1|2|3|4|5|6|7|8|9|10|11|12'
  uri = 'http://jlp.yahooapis.jp/MAService/V1/parse'
  result = []
  body = open("#{uri}?appid=#{appid}&results=ma&filter=#{URI.escape(filter)}&sentence="+URI.encode(text))
  doc = REXML::Document.new(body).elements['ResultSet/ma_result/word_list/']
  doc.elements.each('word/reading') do |item|
    result.push(item.text)
    result.push(" ")
  end
  return result
end

def split_artist(text)
  appid = "アプリID"
  uri = 'http://jlp.yahooapis.jp/KeyphraseService/V1/extract'
  result = []
  body = open("#{uri}?appid=#{appid}&sentence="+URI.encode(text))
  doc = REXML::Document.new(body).elements['ResultSet/']
  doc.elements.each('Result/Keyphrase') do |item|
  end
end
