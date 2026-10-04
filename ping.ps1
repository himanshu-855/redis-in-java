param([string]$Server = 'localhost', [int]$Port = 6379)
$client = [System.Net.Sockets.TcpClient]::new($Server, $Port)
try {
    $stream = $client.GetStream()
    $stream.ReadTimeout = 3000
    $command = [Text.Encoding]::ASCII.GetBytes("*1`r`n`$4`r`nPING`r`n")
    $stream.Write($command, 0, $command.Length)
    $buffer = [byte[]]::new(1024)
    $length = $stream.Read($buffer, 0, $buffer.Length)
    Write-Output ([Text.Encoding]::ASCII.GetString($buffer, 0, $length).Trim())
} finally {
    $client.Dispose()
}
