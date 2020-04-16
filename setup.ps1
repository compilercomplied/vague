
# --- Utils ----------------------------------------------------------------------------------------
function debug([string] $data) { Write-Host $data; }


# --- Code -----------------------------------------------------------------------------------------
debug "Globally setting script directory as: $($PSScriptRoot)"
[System.Environment]::SetEnvironmentVariable('VAGUE_ROOTDIR', $PSScriptRoot, 'User')

$lockfile = [IO.Path]::Combine($PSScriptRoot, '.lock.json')
if (!(test-path $lockfile))  {
  debug "Creating empty valid json lockfile in $($lockfile)"
  @{ } | ConvertTo-Json > $lockfile
}