$ComputerName = Read-Host "Computer Name?";
$cred=get-credential
$sess= New-PSSession -credential $cred -ComputerName $ComputerName
Enter-PSSession $sess


 dir -Path '\\$ComputerName\C$\Windows\softwaredistribution\*' | remove-item -Recurse -force -Confirm

 $stop = Stop-Service wuauserv, bits
 $start = Start-Service wuauserv, bits

 $stop.waitforExit()
 $start.waitforExit()

'wuauclt /reportnow
wuauclt /resetauthorization /detectnow
gpupdate /force' | cmd