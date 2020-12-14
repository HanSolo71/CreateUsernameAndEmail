#Variables
$Names = @()
$Name = @()
$NameNoSpecialFirst = @()
$NameNoSpecialLast = @()
$NamesNoSpecial = @()
$NameNoSpecial = @()
$EmailAddress1 = @()
$EmailAddress2 = @()
$Username1
$Username2
$Domain = "Insert Domain"

#Import CSV Of Names
$Names = Import-Csv $NameCSV

#Create List of First Names and Last Names

ForEach ($Name in $Names) {


$NameNoSpecialFirst = $Name.First -replace '[^\p{L}\p{Nd}]'
$NameNoSpecialLast = $Name.Last -replace '[^\p{L}\p{Nd}]'
 
$NamesNoSpecial += [PSCustomObject]@{First=$NameNoSpecialFirst;Last=$NameNoSpecialLast}
}

#Build User Names

ForEach ($NameNoSpecial in $NamesNoSpecial) {

$EmailAddress1 += $NameNoSpecial.Last + $NameNoSpecial.First.Substring(0,1) + "@" + $Domain 
$Username1 += $NameNoSpecial.Last + $NameNoSpecial.First.Substring(0,1)

$EmailAddress2 += $NameNoSpecial.First.Substring(0,1) + $NameNoSpecial.Last + "@" + $Domain 
$Username2 += $NameNoSpecial.First.Substring(0,1) + $NameNoSpecial.Last
}
