@rem 作成人月日:20210104 作者:川島 祥 初版 batファイルのログ出力機能,ネットワークドライブ追加処理
@rem batファイルで時刻付きのログファイル出力
@echo off

@rem ### 変数宣言 Start ###
set current_date=%date%&rem 現在の年月日取得
set yyyy=%current_date:~0,4%&rem 現在の年
set mm=%current_date:~5,2%&rem 現在の月
set dd=%current_date:~8,2%&rem 現在の日
set current_time=%time: =0%&rem 現在の時刻取得
set hh=%current_time:~0,2%&rem 現在の時
set mn=%current_time:~3,2%&rem 現在の分
set ss=%current_time:~6,2%&rem 現在の秒
set log_path=""&rem ログのディレクトリ
set log_file_name=time_%yyyy%-%mm%-%dd%_%hh%-%mn%-%ss%_log.txt&rem ログファイル名

@rem ### ユーザ設定 ###
@rem IPアドレス、ssh port番号,ログインユーザ、パスワード、ドライブ番号
set ip_addr=127.0.0.1
set port_num=2221
set login_user=reki
set login_pass=a278354
set drive_str=p:

@rem ### 変数宣言 End   ###

@rem ### 説明書き ###
@rem 	%0：batファイルに元から設定されている環境変数。「"C:\Users\xxx\Desktop\test.bat"」のように格納されている。
@rem 	~：%0から"(ダブルコート)を取り除く
@rem 	d：%~0からドライブ名のみを取得する。「C:」のように値を取得できる。
@rem 	p：%~0からドライブ名を除いたパスを取得する。「\Users\xxx\Desktop\」のように値を取得できる。
set log_path=%~dp0
set logPathFile=%log_path%%log_file_name%

@rem echo ログファイルパス+名=%log_path%%log_file_name% >> %log_path%%log_file_name%
log_timeLine | echo net use %drive_str% \\sshfs\%login_user%@%ip_addr%!%port_num%\\/ %login_pass% /user:%login_user% >> %logPathFile%

pause
exit
