# Takes a network prefix and your DNS server of choice as parameters
param ($network, $server)

# Check if chosen DNS server is online
if (-not (Test-Connection -ComputerName $server -Count 1 -Quiet)) {
    Write-Host "($server) is not reachable"
    Exit
}

# Make a list of IP addresses based on network prefix
$ip = 0..255 | ForEach-Object {
    "$network.$_"
}

# Resolves DNS names
$ip | ForEach-Object {
    Resolve-DnsName -Name $_ -Server $server -ErrorAction Ignore
}
