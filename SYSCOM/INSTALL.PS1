# URL del file SYSCOM.PS1 online
$remoteFileUrl = "https://vittoriaalata.github.io/VWS/SYSCOM/SYSCOM.PS1"
# Percorso del file SYSCOM.PS1 locale
$localFilePath = ".\SYSCOM.PS1"
# Percorso della cartella di installazione del programma
$installFolder = ".\"

try {
    # Ottieni l'header del file remoto
    $versionResponse = Invoke-WebRequest -Uri $remoteFileUrl -Method Head -ErrorAction Stop

    # Ottieni la data di ultima modifica del file remoto
    if ($versionResponse.StatusCode -eq 200 -and $versionResponse.Headers["Last-Modified"]) {
        $onlineLastModified = [DateTime]::Parse($versionResponse.Headers["Last-Modified"])

        # Controlla se il file locale esiste
        if (Test-Path $localFilePath) {
            # Ottieni la data di ultima modifica del file locale
            $localLastModified = (Get-Item $localFilePath).LastWriteTime

            # Mostra a video le date di comparazione
            Write-Output "Data di ultima modifica del file locale: $localLastModified"
            Write-Output "Data di ultima modifica del file remoto: $onlineLastModified"

            # Confronta le date
            if ($localLastModified -ge $onlineLastModified) {
                Write-Output "Il file locale è aggiornato."
                Pause
                exit
            } else {
                Write-Output "Una nuova versione del programma è disponibile. Aggiornamento in corso..."
                Pause
                # Rimuovi la vecchia installazione
                Remove-Item -Path $installFolder -Recurse -Force
            }
        } else {
            Write-Output "Il file locale non esiste. Procedendo con l'installazione..."
        }

        # URL per scaricare il file zip del programma
        $url = "https://vittoriaalata.github.io/VWS/SYSCOM/SYSCOM.zip"
        $outputFile = ".\SYSCOM.zip"

        # Scarica il file zip
        Invoke-WebRequest -Uri $url -OutFile $outputFile -ErrorAction Stop

        # Decomprimi il file zip nella cartella specificata
        Expand-Archive -Path $outputFile -DestinationPath $installFolder -Force

        # Rimuovi il file zip dopo l'estrazione
        Remove-Item $outputFile

        Write-Output "Installazione completata."
    } else {
        Write-Output "Non è stato possibile ottenere la data di ultima modifica del file online."
    }
}
catch {
    Write-Output "Si è verificato un errore durante l'installazione: $_"
}
