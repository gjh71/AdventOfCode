$data = Get-Content $PSScriptRoot\input.txt
# $data = Get-Content $PSScriptRoot\input-test.txt
$fieldsrequired=@("byr:", "iyr:", "eyr:","hgt:","hcl:","ecl:","pid:")

function checkPassport{
    param(
        $passport
    )
    $ok = $true
    foreach($field in $fieldsrequired){
        if($passport.indexof($field) -eq -1){
            $ok = $false
            break
        }
    }
    $ok
}

$okCnt = 0
$passport = ""
foreach ($row in $data) {
    if ($row -eq ""){
        if (checkPassport -passport $passport){
            $okCnt++
        }
        $passport = ""
    }
    else{
        $passport += $row
    }
}
if (checkPassport -passport $passport) {
    $okCnt++
}
$okCnt
