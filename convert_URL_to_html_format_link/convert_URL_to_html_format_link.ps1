# クリップボードにURLが格納されていたら、それをHTML形式のリンクに変換する
# ・実行時はPowerShell V5 を指定のこと。Set-Clipboard の -AsHtml パラメーターが V5 でしか使えない
# ・生成するリンクが英語なのは、日本語の文字化け問題を解消できなかったから

# PowerShellのバージョンが不適切なら抜ける
if ( (Get-Host).Version.Major -ne 5 ) {
	Write-Host "This script requires powershell V5."
	exit
}

# クリップボード内容をテキスト形式で取得
$clipboard_text = Get-Clipboard -Format Text

# httpから始まる文字列ならURLと判断
if ( $clipboard_text -like "http*" )
{
	# HTMLタグでURLへのリンクを作り、Html形式でクリップボードに設定
	$html_link = "<a href=""" + $clipboard_text + """><b><u><i>HERE!</i></u></b></a>"
	Set-Clipboard -AsHtml $html_link

	# 生成内容をコンソールに出力
	Write-Host "Created Link:" $html_link
}
