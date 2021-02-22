$input=Get-Content $PSScriptRoot\input.txt |ConvertFrom-Csv -Delimiter " "
$cntOk = 0
foreach($check in $input){
    $minmax=$check.times.split("-")
    $char1=$check.password.substring([int]$minmax[0]-1,1)
    $char2=$check.password.substring([int]$minmax[1]-1,1)
    $char = $check.char.substring(0,1)

    $ok=$char -eq $char1 -xor $char -eq $char2
    $msg = "{0} : {1} : {2}  {3}{4}" -f $check.times, $char, $check.password,$char1,$char2
    if ($ok){
        Write-Host($msg) -ForegroundColor Green
        $cntOk++
    }
    else{
        Write-Host($msg) -ForegroundColor Red
    }
}
$cntOk