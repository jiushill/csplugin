$data=Get-WmiObject -Class Win32_UserAccount | Select-Object Name,SID
foreach($n in $data){
	$username=$n.Name
	$sid=$n.SID  -split "-"
	$sid=[Convert]::ToString($sid[-1],16)
	$number=$sid.Length%2
	if($number -eq 1){
		$rid="0"+$sid
		$rid=[System.String]::Join("",$rid[-2..-1]+$rid[0..1])
	}
	write-host "Name:"$username "Sid:"$sid "Rid:"$rid
}