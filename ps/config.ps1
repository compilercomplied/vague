$CONFIG = @{

  lockfile = [IO.Path]::Combine($env:VAGUE_ROOTDIR, '.lock.json')

  monitorcfgs = 'dual.cfg','single.cfg'

}