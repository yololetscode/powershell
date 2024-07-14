$OldName = Read-Host "Computer Name You Wish to Change?";
$NewName = Read-Host "Enter New Computer Name";
rename-computer -computername "$OldName" -NewName "$NewName" -DomainCredential $cred -force 