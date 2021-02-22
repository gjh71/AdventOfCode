$forest = Get-Content $PSScriptRoot\input.txt
# $forest = Get-Content $PSScriptRoot\input-test.txt

function findTrees{
    param(
        $right,
        $down
    )
    $xpos = 0
    $treecnt = 0
    $width = $forest[0].length
    $depth = $forest.length
    for ($ypos = $down; $ypos -lt $depth; $ypos+=$down) {
        $xpos = ($xpos + $right) % $width
        $char = $forest[$ypos].Substring($xpos, 1)
        if ($char -eq "#") {
            $treecnt++
        }
        # $msg = "{0}  ==  {1}  ({2},{3})  TreeCount: {4}" -f $forest[$ypos], $char, $ypos, $xpos, $treecnt
        # Write-Host($msg)
    }
    Write-Host("Right: {0}, Down: {1}, Resulted in {2} trees" -f $right, $down, $treecnt)
    $treecnt
}

$result = (findTrees -right 1 -down 1) 
$result *= (findTrees -right 3 -down 1)
$result *= (findTrees -right 5 -down 1)
$result *= (findTrees -right 7 -down 1)
$result *= (findTrees -right 1 -down 2)
$result
