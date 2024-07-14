$computer = Read-Host ("Computer Name? ")
get-adcomputer $computer | get-computerinfo | select-object -Property osuptime