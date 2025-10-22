param(
    [Parameter(Mandatory = $true)] [string]$Path,
    [switch]$Remove
)

Get-Content $Path | ForEach-Object {
    # Skip empty lines and comments
    if ($_ -match '^\s*$' -or $_ -match '^\s*#') {
        return
    }

    # Match key=value pairs
    if ($_ -match '^\s*([^=]+?)\s*=\s*(.*)\s*$') {
        $key = $matches[1].Trim()

        if ($Remove) {
            [System.Environment]::SetEnvironmentVariable($key, $null, "Process")
            Write-Host "Removed $key"
        } else {
            $value = $matches[2].Trim(' ', '"', "'")
            [System.Environment]::SetEnvironmentVariable($key, $value, "Process")
            Write-Host "Loaded $key"
        }
    } else {
        Write-Warning "Skipping invalid line: $_"
    }
}
