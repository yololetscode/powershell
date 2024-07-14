
$Path = get-childitem -Path "C:\Users\james\Downloads\*" ## sets path to folder that has the child items you want to cull
$setDate = '12/30/2020'  ## set the date this starts as a string but gets converted to date time i next line
$date = [Datetime]::ParseExact($setDate, 'MM/dd/yyyy', $null) ## calls a static method to convert a date string to a datetime object



if ($Path.count -gt 10){        #calls count method to count all objects stored in $Path array
  foreach ($file in $Path) {    #will iterate through each object in #path array and run script against each one
    
    if($file.LastWriteTime -le $date) {$file | remove-item -recurse -force}
}

}