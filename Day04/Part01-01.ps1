$data = Get-Content $PSScriptRoot\input.txt
# $data = Get-Content $PSScriptRoot\input-test.txt
$fieldsrequired=@("byr:", "iyr:", "eyr:","hgt:","hcl:","ecl:","pid:")

function checkField{
    param(
        $fieldvalue
    )
    $splitvalues = $fieldvalue.split(":")
    $vl = $splitvalues[1]
    $rv = $false
    switch ($splitvalues[0])
    {
        'byr' { $rv = ($vl -ge "1920" -and $vl -le "2002") }
        'iyr' { $rv = ($vl -ge "2010" -and $vl -le "2020") }
        'eyr' { $rv = ($vl -ge "2020" -and $vl -le "2030") }
        'hgt' { 
            if ($vl.substring)

         }
        'hcl' {  }
        'ecl' { $rv = ($vl -in ("amb", "blu", "brn", "gry", "grn", "hzl", "oth")) }
        'pid' {  }
        'cid' { $rv = $true }
    }
    $rv
}

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
