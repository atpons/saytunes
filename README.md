saytunes
==================

saytunes は、再生中の楽曲のアーティスト名とタイトルをiTunesから取得し、Mac OS Xに搭載されているsayコマンドを利用し喋らせるものです。

主な機能
-------
+ iTunes から楽曲のタイトル・アーティスト名を取得し、表示  
+ 取得した楽曲情報を「できるだけ忠実に」sayコマンドで喋らせる  

ファイルについて
-------
+ saytunes.rb (本体)
+ install.rb (say2.rb インストーラ)
+ rss.rb (はてなキーワードのAPIを叩きます)
+ yahoo_api.rb (Yahoo!関連のAPIを叩きます)
+ artist.scpt (AppleScript)
+ title.scpt (AppleScript)
+ play.scpt (AppleScript)

必要なもの
--------------
+ Yahoo! デベロッパーネットワーク アプリケーションID  
http://developer.yahoo.co.jp/ より各自が取得してください。   
取得後は、 yahoo_api.rb 内 appid を書き換えてください。  

+ say2.rb (任意)  
詳細は以下を。  

say コマンドに渡すまでにしていること
-------
+ タイトルを 「Yahoo! 日本語形態素解析API」 にかけます  
 この作業をすることにより、できるだけ正確な読み方を取得し、sayコマンドがしっかりとしたタイトルを喋ります。  

+ アーティスト名を 「Yahoo! キーフレーズ抽出API」 / 「はてなキーワード API」 にかけます  
 この作業をすることにより、できるだけ正確な読み方を取得し、sayコマンドがしっかりとしたアーティスト名を喋ります。なお、はてなキーワード APIで取得できなかったキーフレーズについては Yahoo! 日本語形態素解析API にかけ、読み方を取得します。

say コマンドについて
--------
saytunes では、「英語混じり日本語テキスト読み上げスクリプト for Mac OSX」 (say2.rb) を利用することができます。  
利用に際しては、同梱されております install.rb を起動し、当該 gist より clone ができます。  
なお、 clone 後 say2.rb 内にある SPEAKER_ENGLISH 内を存在するスピーカーに設定する必要があります。  
また、 say2.rb が存在しない場合については1つのスピーカーが発音します。  
  
「英語混じり日本語テキスト読み上げスクリプト for Mac OSX」  
http://yohasebe.com/wp/archives/2008  
https://gist.github.com/2011415  

動作環境
---------
+ Mac OS X (10.7.xで動作確認)  
+ iTunes (10.6.xで動作確認)  

参考文献
---------
+ RubyでYahoo!の形態素解析APIをつかってみました - きたけーのアウトプット  
 http://d.hatena.ne.jp/kitak/20111010/1318210401

+ テキスト解析 - Yahoo!デベロッパーネットワーク  
 http://developer.yahoo.co.jp/webapi/jlp/

ライセンスについて
---------
LICENSE.ja / LICENSE.en を参照してください。  
