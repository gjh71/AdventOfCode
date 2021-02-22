$list=Get-Content $PSScriptRoot\input.txt
foreach($a1 in $list){
    foreach($a2 in $list){
        foreach($a3 in $list){
            if(([int]$a1+[int]$a2+[int]$a3) -eq 2020){
                Write-Host("{0} + {1} + {2}= {3}" -f $a1,$a2,$a3,([int]$a1*[int]$a2*[int]$a3))
            }
        }
    }
}