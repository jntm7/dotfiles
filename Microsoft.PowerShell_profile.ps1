function gh {
    Set-Location "$env:USERPROFILE\Documents\GitHub"
}

$fzfUserShell = Join-Path $env:USERPROFILE '.fzf\shell'
if (Test-Path $fzfUserShell) {
    & (Join-Path $fzfUserShell 'key-bindings.ps1')        # Ctrl-R / Ctrl-T
    & (Join-Path $fzfUserShell 'completion.ps1')          # tab completion
} else {
    $fzfCmd = Get-Command fzf -ErrorAction SilentlyContinue
    if ($fzfCmd) {
        $fzfDir = Split-Path $fzfCmd.Source -Parent
        # candidate locations: <fzfDir>\shell or <fzfDir>\..\shell
        $c1 = Join-Path $fzfDir 'shell'
        $c2 = Resolve-Path (Join-Path $fzfDir '..\shell') -ErrorAction SilentlyContinue
        foreach ($c in @($c1, $c2)) {
            if ($c -and (Test-Path $c)) {
                & (Join-Path $c 'key-bindings.ps1')
                & (Join-Path $c 'completion.ps1')
                break
            }
        }
    }
}

if (Get-Command zoxide -ErrorAction SilentlyContinue) { 
	$zinit = (& zoxide init powershell) -join "`n" 
	if ($zinit) { 
		Invoke-Expression $zinit 
	} 
} else { Write-Verbose 'zoxide not found; skipping zoxide init' }

oh-my-posh init pwsh --config "kushal" | Invoke-Expression

