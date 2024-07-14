$path = "Insert a path to folder or file for permissions you want to copy"
$setpermpath = "set a path you want to copy permissions to. can include '*' as wild card for recurse"
$acl = get-acl $path
get-childitem $setpermpath -recurse | set-acl -aclobject $acl    # recurse will apply permissions to all files and subfolders. Great way to restore permissions for something that is broken. 