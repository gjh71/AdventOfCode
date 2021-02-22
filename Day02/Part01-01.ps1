$input=Get-Content $PSScriptRoot\input.txt |ConvertFrom-Csv -Delimiter " "
$cntOk = 0
foreach($check in $input){
    $minmax=$check.times.split("-")
    $min=[int]$minmax[0]
    $max=[int]$minmax[1]
    $char = $check.char.substring(0,1)
    $occurrences = ($check.password.split($char)).length-1
    $ok=$occurrences -ge $min -and $occurrences -le $max
    $msg = "{0} : {1} : {2} found {3}" -f $check.times, $check.char.substring(0,1), $check.password, $occurrences
    if ($ok){
        Write-Host($msg) -ForegroundColor Green
        $cntOk++
    }
    else{
        Write-Host($msg) -ForegroundColor Red
    }
}
$cntOk