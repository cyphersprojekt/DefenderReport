$txt = ".\DefenderReport.txt"
$content = 
@"
EQUIPO/USUARIO: $(whoami)
!!!Actualizando base de datos de virus: $(Update-MpSignature)
Realizando escaneo completo del equipo: $(Start-MpScan -ScanType FullScan)
Fecha de inicio del último scan: $(Get-MpComputerStatus | Select-Object -ExpandProperty FullScanStartTime)
Fecha de finalización del último scan: $(Get-MpComputerStatus | Select-Object -ExpandProperty FullScanEndTime)
Detalle de las amenazas encontradas:
$(Get-MpThreatDetection)
Removiendo amenazas
$(Remove-MpThreat)
"@

Add-Content -LiteralPath $txt -Value $content