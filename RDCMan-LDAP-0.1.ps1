$domain = $env:USERDNSDOMAIN
$domain_split = $domain -split "\."
$d1 = $domain_split[0]
$d2 = $domain_split[1]

$ldapsearcher = New-Object System.DirectoryServices.DirectorySearcher 
$ldapsearcher.SearchRoot = "LDAP://DC=$d1,DC=$d2"
$ldapsearcher.Filter = "(objectclass=computer)"
$Computers = $ldapsearcher.FindAll().path
$Computers = $Computers -replace "(LDAP://CN=)|(,DC=$d1,DC=$d2)"

$comp_obj = @()
foreach ($comp in $Computers) {
$split = $comp -split ","
$comp_name = $split[0]
$ou_path = $split[1..10]
$ou_path = $ou_path[-1..-10]
$ou_path = $ou_path -replace "(OU=)|(CN=)"
$ou_path = $ou_path -join " -> "
$comp_obj += [PSCustomObject]@{OU = $ou_path;Computer = $comp_name}
}
$comp_obj = $comp_obj | sort "OU"
$comp_obj | Out-GridView