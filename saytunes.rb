# coding: utf-8
require 'open-uri'
require "pp"
require "./rss.rb"
require "./yahoo_api.rb"
require 'rexml/document'

#iTunesから情報取得
artist = `osascript artist.scpt`
title = `osascript title.scpt`

case artist.to_s
when "Not received.\n"
  puts "Oops, failed to get artist information from iTunes."
  puts "If you do not have to play the song in iTunes, please play."
  exit()
else
end

case title.to_s
when "Not received.\n"
  puts "Oops, failed to get title information from iTunes."
  puts "If you do not have to play the song in iTunes, please play."
  exit()
else
end


#アーティスト情報のキーフレーズ解析結果格納
#タイトル情報の形態素解析 + 結果格納
begin
  artist_result = split_artist(artist);
  title_result = split(title);
rescue => err
  puts "Oops, failed to get information from Yahoo!."
  puts err
  exit()
end

#アーティスト情報のキーフレーズ取得結果格納
artist_keyword = []
artist_keyword_number = []
artist_result.each_with_index do |artist , i|
  k = artist.to_s.gsub("<Keyphrase>", "").gsub("</Keyphrase>", "")
  artist_keyword.push(k)
  artist_keyword_number.push(i)
end

#アーティスト取得結果のはてなキーワードor形態素解析
artist_result = []
llresult = []
artist_keyword.each_with_index do |artist , i|
  hatena_artist = hatena(artist)
  llresult.push(hatena_artist)
  emp = hatena_artist.empty?
  case emp
  when true
    non_hatena_keyword = artist_keyword[i]
    non_hatena_morphological = split(non_hatena_keyword);
    artist_result.push(non_hatena_morphological)
    artist_result.push(" ")
  when false
    artist_result.push(hatena_artist)
    artist_result.push(" ")
  end
end

#結果を表示(iTunesそのまま)
puts "再生中の楽曲を表示します。"
puts "アーティスト: " + artist
puts "タイトル: " + title

#sayコマンドに投げるための結合
artist_joined = artist_result.join
title_joined = title_result.join

#デバッグモード用
case ARGV[0].to_s
when "-debug"
  puts "[Debug mode (Saying Information)]"
  puts "= Keyphrase Analysis ="
  puts "Artist: " + artist_keyword.to_s
  puts "= Hatena Analysis ="
  puts "Artist: " + llresult.to_s
  puts "= All result="
  puts "Artist: " + artist_result.to_s
  puts "Title: " + title_result.to_s
else
end

#sayさせる
case system("ruby 2011415/say2.rb " + '"再生中の楽曲は、 ' + artist_joined + ' で、 ' + title_joined + ' です。"')
when true
  puts "== English + Japanese multi speak script by from https://gist.github.com/2011415 =="
when false
  puts "== Not found say2.rb and saying single speaker. =="
  system("say " + '"再生中の楽曲は、 ' + artist_joined + ' で、 ' + title_joined + ' です。"')
else
end

#再生処理
title = `osascript play.scpt`
