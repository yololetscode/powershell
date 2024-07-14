
$Path = get-childitem -Path "C:\Users\james\Downloads\*"
$startDate = '12/01/2020'
$date = [Datetime]::ParseExact($startDate, 'MM/dd/yyyy', $null)



if ($Path.count -gt 0){
  foreach ($file in $Path) {
    
    if($file.LastAccessTime -le $date) {$file | remove-item -recurse -force}
}

}