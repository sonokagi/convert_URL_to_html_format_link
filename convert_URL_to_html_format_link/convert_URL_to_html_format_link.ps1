# �N���b�v�{�[�h��URL���i�[����Ă�����A�����HTML�`���̃����N�ɕϊ�����
# �E���s����PowerShell V5 ���w��̂��ƁBSet-Clipboard �� -AsHtml �p�����[�^�[�� V5 �ł����g���Ȃ�
# �E�������郊���N���p��Ȃ̂́A���{��̕����������������ł��Ȃ���������

# PowerShell�̃o�[�W�������s�K�؂Ȃ甲����
if ( (Get-Host).Version.Major -ne 5 ) {
	Write-Host "This script requires powershell V5."
	exit
}

# �N���b�v�{�[�h���e���e�L�X�g�`���Ŏ擾
$clipboard_text = Get-Clipboard -Format Text

# http����n�܂镶����Ȃ�URL�Ɣ��f
if ( $clipboard_text -like "http*" )
{
	# HTML�^�O��URL�ւ̃����N�����AHtml�`���ŃN���b�v�{�[�h�ɐݒ�
	$html_link = "<a href=""" + $clipboard_text + """><b><u><i>HERE!</i></u></b></a>"
	Set-Clipboard -AsHtml $html_link

	# �������e���R���\�[���ɏo��
	Write-Host "Created Link:" $html_link
}
