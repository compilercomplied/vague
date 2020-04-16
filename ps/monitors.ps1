$cfgfile = [IO.Path]::Combine($env:VAGUE_ROOTDIR, 'ps','config.ps1')
. $cfgfile

$monitorCfgLength = $CONFIG['monitorcfgs'].length -1


$lock = Get-Content $CONFIG['lockfile'] | ConvertFrom-Json -AsHashtable

$newMonitorCfgIndex = 0;
if ( -Not ($lock.Contains("currentmonitorcfg")) ) {
  write-host "no existing var; initializing as 0"
  $lock.Add("currentmonitorcfg", 0)

} elseif ( -Not ($lock.currentmonitorcfg -ge $monitorCfgLength) ) {

  write-host "found var with value $($lock.currentmonitorcfg)"
  $newMonitorCfgIndex = $lock.currentmonitorcfg +1

} else { 
  write-host "found var with value $($lock.currentmonitorcfg)" 
}

$targetMonitorConfig = [IO.Path]::Combine($env:VAGUE_ROOTDIR, 'config', 'multimonitortool', $CONFIG['monitorcfgs'][$newMonitorCfgIndex])
write-host "using config: $($targetMonitorConfig)" 

multimonitortool.exe /loadconfig $targetMonitorConfig

$lock.currentmonitorcfg = $newMonitorCfgIndex
convertto-json $lock > $CONFIG['lockfile'] 