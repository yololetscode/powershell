## list of names can be ordered from oldes hire date to most recent. This will ensure your output for pass expirations closely matches soonest to be expiring to last to be expiring
$list = get-content "C:\Users\james\OneDrive\Documents\listofnames.txt"
ForEach ($entry in $list) {$user = net user $entry; $user | select-string -pattern "Password expires","User name"}