
write-host $env:VAGUE_ROOTDIR
$ahkscripts = [IO.Path]::Combine($env:VAGUE_ROOTDIR, "ahk")

Get-ChildItem $ahkscripts -Filter *.ahk | Foreach-Object { 
  $absfile=[IO.Path]::Combine($ahkscripts, $_) 
  autohotkey.exe $absfile
}