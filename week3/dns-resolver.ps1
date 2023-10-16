# Takes a network prefix and your DNS server of choice as parameters
param ($NetworkPrefix, $DnsServer)

# Check if chosen DNS server is online
if (-not (Test-Connection -ComputerName $DnsServer -Count 1 -Quiet)) {
    Write-Host "($DnsServer) is not reachable"
    Exit
}

# Make a list of IP addresses based on network prefix
$ipRange = 0..255 | ForEach-Object {
    "$NetworkPrefix.$_"
}

# Resolves DNS names
$ipRange | ForEach-Object {
    Resolve-DnsName -Name $_ -Server $DnsServer -ErrorAction Ignore
}
