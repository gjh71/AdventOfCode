$list=Get-Content $PSScriptRoot\input.txt
$list.Length
foreach($a1 in $list){
    foreach($a2 in $list){
        if(([int]$a1+[int]$a2) -eq 2020){
            Write-Host("{0} + {1} = {2}" -f $a1,$a2,([int]$a1*[int]$a2))
        }
    }
}