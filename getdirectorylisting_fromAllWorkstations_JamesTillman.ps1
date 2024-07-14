$Workstationlist=get-adcomputer -filter * -searchbase 'OU=Workstations, DC=p1fs, DC=com' -SearchScope 2 | foreach {$_.Name} 
foreach($workstation in $Workstationlist){ 
get-service -ComputerName $workstation -Name wuauserv

}
