$Computer = Read-Host ("Enter Computer Name")
$status = Get-Service -Name Audiosrv -ComputerName $Computer | Sort-Object Status

write-host ("`nThe current status is:") $status