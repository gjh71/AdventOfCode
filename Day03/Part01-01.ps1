$forest=Get-Content $PSScriptRoot\input.txt
$xpos=0
$treecnt=0
$forest[0]
$width=$forest[0].length
$depth=$forest.length
for ($ypos = 1; $ypos -lt $depth; $ypos++) {
    $xpos=($xpos+3)%$width
    $char = $forest[$ypos].Substring($xpos,1)
    if ($char -eq "#"){
        $treecnt++
    }
    $msg = "{0}  ==  {1}  ({2},{3})  TreeCount: {4}" -f $forest[$ypos], $char, $ypos, $xpos, $treecnt
    Write-Host($msg)
}

