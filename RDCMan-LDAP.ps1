$domain = $env:USERDNSDOMAIN
$domain_split = $domain -split "\."
$d1 = $domain_split[0]
$d2 = $domain_split[1]

$path_save = "$env:USERPROFILE\desktop"
$rdg = '<RDCMan programVersion="2.92" schemaVersion="3">
  <file>
    <credentialsProfiles />
    <properties>
      <expanded>True</expanded>
      <name>$domain</name>
    </properties>'

$ldapsearcher = New-Object System.DirectoryServices.DirectorySearcher 
$ldapsearcher.SearchRoot = "LDAP://DC=$d1,DC=$d2"
$ldapsearcher.Filter = "(objectclass=computer)"
$Computers = $ldapsearcher.FindAll().path
$Computers = $Computers -replace "(LDAP://CN=)|(,DC=$d1,DC=$d2)"

$comp_collections = New-Object System.Collections.Generic.List[System.Object]
foreach ($comp in $Computers) {
$split = $comp -split ","
$comp_name = $split[0]
$ou_path = $split[1..10]
$ou_path = $ou_path[-1..-10]
$ou_path = $ou_path -replace "(OU=)|(CN=)"
$ou_path = $ou_path -join " - "
$comp_collections.Add([PSCustomObject]@{OU = $ou_path; Computer = $comp_name})
}
$comp_collections = $comp_collections | sort "OU"

$OU_count = $comp_collections | select -ExpandProperty "OU" | select -Unique
$comp_collections_new = New-Object System.Collections.Generic.List[System.Object]
foreach ($ou in $OU_count) {
$comp_collections_new.Add([PSCustomObject]@{OU = $ou; Computers = $null})
}

foreach ($comp in $comp_collections) {
$comp_name = $comp.Computer
$comp_ou = $comp.OU
($comp_collections_new | Where {$_.ou -like $comp_ou}).Computers += "$comp_name, "
}

foreach ($coll in $comp_collections_new) {
$group_name = $coll.ou
$rdg += "
    <group>
      <properties>
        <expanded>True</expanded>
        <name>$group_name</name>
      </properties>"
$server_list = $coll.Computers -replace ", \z"
$server_list = $server_list -split ", "
foreach ($server_name in $server_list) {
$rdg += "
      <server>
        <properties>
          <name>$server_name</name>
        </properties>
      </server>"
}
$rdg += "
    </group>"
}

$rdg += "
  </file>
  <connected />
  <favorites />
  <recentlyUsed />
</RDCMan>"

$rdg > "$path_save\$domain.rdg"