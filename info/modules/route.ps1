write-host "Intranet IP segment acquisition"
$regex = [regex]"\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b"
$global:ipsub=@()
$global:temp=@()
$global:iproute=@()
$regex.Matches((route print)) | ForEach-Object{
		$iplist=$_.Value.Split(".")
		if([int]$iplist[0] -eq 10 -and [int]$iplist[1] -le 255 -and [int]$iplist[2] -le 255 -and [int]$iplist[3] -le 255){
			$ipsub += $_.Value
		}elseif([int]$iplist[0] -eq 192 -and [int]$iplist[1] -eq 168 -and [int]$iplist[2] -le 255 -and [int]$iplist[3] -le 255){
			$ipsub += $_.Value	
		}elseif(([int]$iplist[0] -eq 172) -and (([int]$iplist[1] -eq 16) -and ([int]$iplist[1] -le 31)) -and ([int]$iplist[2] -le 255) -and ([int]$iplist[3] -le 255)){
			$ipsub += $_.Value	
		}
	}
$ipsub=$ipsub | sort -Unique
foreach($ip in $ipsub){
	$ipx=$ip.Split(".")
	$tmp= $ipx[0] + "." + $ipx[1] + "." + $ipx[2]
	if($temp -notcontains $tmp){
		$temp += $tmp
		$iproute += $ip
	}
}
$iproute