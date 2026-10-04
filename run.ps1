$ErrorActionPreference = 'Stop'
Push-Location $PSScriptRoot
try {
    & mvn -B package
    if ($LASTEXITCODE -ne 0) { throw 'Maven build failed.' }
    & java -jar target/redis-in-java.jar @args
} finally {
    Pop-Location
}
