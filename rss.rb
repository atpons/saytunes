# -*- encoding: UTF-8 -*-
require 'nokogiri'
require 'open-uri'
require 'cgi'

def hatena(keyword)
  word = CGI.escape(keyword)
  uri = 'http://d.hatena.ne.jp/keyword?word=' + word + '&mode=rss&ie=utf8'
  xml = Nokogiri::XML(open(uri).read)
  furigana = xml.xpath("//hatena:furigana").text
  hatenawords = furigana.to_s.gsub('"',"")
end
