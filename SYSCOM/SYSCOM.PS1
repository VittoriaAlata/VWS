$OutputEncoding = [System.Text.Encoding]::UTF8

$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')

if (-not $isAdmin) {
    Start-Process pwsh.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

function CTRLPause {
    do {
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    } while ($key.VirtualKeyCode -eq 17) # 17 è il codice virtuale per CTRL
}

function ManutenzioneSOeDischi {
    Clear-Host
    Get-Content ".\Assets\SOeDischi.ANS"
    Write-Host "`n`nNUM.   COMANDO     (DESCRIZIONE COMANDO)"
    Write-Host "-------------------------------------------------------"
    Write-Host "1.  SFC            (Analizza integrità file di sistema)"
    Write-Host "2.  CHKDSK (f)     (Controlla disco e visualizza rapporto)"
    Write-Host "3.  CHKDSK (r)     (Individua settori danneggiati)"
    Write-Host "4.  DISM           (Manutenzione immagini di sistema)"
    Write-Host "5.  POWERCFG (e)   (Report energia del computer)"
    Write-Host "6.  POWERCFG (b)   (Report stato batteria)"
    Write-Host "7.  MdSched.exe    (Diagnostica memoria centrale)"
    Write-Host "8.  cleanmgr.exe   (Cancella file non necessari dal disco)"
    Write-Host "9.  dfrgui.exe     (Deframmenta e ottimizza unità)"
    Write-Host "10. recdisc.exe    (Strumento di riparazione del disco)"
    Write-Host "11. dxdiag.exe     (Strumento di diagnostica Direct X)"
    Write-Host "12. Win 11         (Strumenti Windows 11)"
    Write-Host "0.  Esci"
    Write-Host ""
    $MDeSO = Read-Host "Inserisci il numero per l'operazione"

    switch ($MDeSO) {
        "0" {

        }
        "" {

        }
        "1" { 
            Clear-Host
            sfc /scannow
            Wscript.Sleep 1     
            ManutenzioneSOeDischi
        }
        "2" {
            Clear-Host
            chkdsk /f
            Wscript.Sleep 1     
            ManutenzioneSOeDischi
        }
        "3" {
            Clear-Host
            chkdsk /r
            Wscript.Sleep 1     
            ManutenzioneSOeDischi
        }
        "4" {
            Clear-Host
            dism /online /cleanup-image /restorehealth /Loglevel:2
            Wscript.Sleep 1     
            ManutenzioneSOeDischi
        }
        "5" {
            Clear-Host
            powercfg /energy
            Wscript.Sleep 1     
            ManutenzioneSOeDischi
        }
        "6" {
            Clear-Host
            powercfg /batteryreport
            Wscript.Sleep 1     
            ManutenzioneSOeDischi
        }
        "7" {
            Invoke-Expression "$env:windir\System32\MdSched.exe"
            Wscript.Sleep 1     
            ManutenzioneSOeDischi
        }
        "8"{
            Invoke-Expression "$env:windir\System32\cleanmgr.exe"
            Wscript.Sleep 1     
            ManutenzioneSOeDischi
        }
        "9" {
            Invoke-Expression "$env:windir\System32\dfrgui.exe"
            Wscript.Sleep 1     
            ManutenzioneSOeDischi
        }
        "10" {
            Invoke-Expression "$env:windir\System32\recdisc.exe"
            Wscript.Sleep 1     
            ManutenzioneSOeDischi
        }
        "11" {
            Invoke-Expression "$env:windir\System32\dxdiag.exe"
            Wscript.Sleep 1     
            ManutenzioneSOeDischi
        }
        "12" {
            WINDOWS11
        }
        Default {
            Write-Host ""
            Write-Warning "Inserisci un'operazione valida e riprova"
        }
    }
}

function WINDOWS11 {
    Clear-Host
    Get-Content ".\Assets\WINDOWS11.ANS"
    Write-Host "`n`nNUM  COMANDO        (DESCRIZIONE COMANDO)"
    Write-Host "-------------------------------------------"
    Write-Host "1.  ISO Ufficiale    (Scarica Windows 11 ufficiale)"
    Write-Host "2.  TPM              (Compatibilità Windows 11)"
    Write-Host "3.  Guida            (Guida compatibilità Windows 11)"
    Write-Host "4.  Scarica software (Scarica versioni Windows)"
    Write-Host "5.  Scarica ISO      (Scarica ISO Windows 10/11)"
    Write-Host "0.  Esci"
    Write-Host ""
    $WIN11 = Read-Host "Inserisci il numero per l'operazione"
    

    switch ($WIN11) {
        "0" {

        }
        "" {

        }
        "1" {
            Start-Process https://www.microsoft.com/it-it/software-download/windows11
            Wscript.Sleep 1     
            WINDOWS11
        }
        "2" {
            Start-Process https://github.com/harsha2koo/W11x64.bat/blob/main/W11_x64-TPM.cmd
            Wscript.Sleep 1     
            WINDOWS11
        }
        "3" {
            Clear-Host
            Write-Host "1. Scarica il media creation tool dal sito della Microsoft mediante l'opzione 1"
            Write-Host "2. Scarica l'eseguibile TPM mediante l'opzione 2"
            Write-Host "3. Dopo aver scaricato i programmi crea l'immagine ISO di Windows 11"
            Write-Host "4. Montare per la prima volta la ISO premendoci sopra con il tasto destro e cliccando 'Monta'"
            Write-Host "5. Chiudere l'immagine montata e eseguire l'eseguibile TPM"
            Write-Host "6. Dopo l'avviso di corretta eliminazione del TPM rimontare la ISO"
            Write-Host "7. Premere su setup.exe e proseguire con l'istallazione guidata"
            pause
            Wscript.Sleep 1     
            WINDOWS11
        }
        "4" {
            Start-Process https://www.microsoft.com/it-it/software-download/
            Wscript.Sleep 1
            WINDOWS11
        }
        "5" {
            Start-Process https://uupdump.net
            Wscript.Sleep 1
            WINDOWS11
        }
        Default {
            Write-Host ""
            Write-Warning "Inserisci un'operazione valida e riprova"
        }
    }
    
}

function GestioneReteApplicazioni {
    Clear-Host
    Get-Content ".\Assets\RETEeAPP.ANS"
    Write-Host "`n`nNUM.   COMANDO      (DESCRIZIONE COMANDO)"
    Write-Host "-------------------------------------------"
    Write-Host "1.     WINGET       (Installa/aggiorna app)"
    Write-Host "2.     appwiz.cpl   (Disistalla o Modifica programma)"
    Write-Host "3.     taskmgr.exe  (Gestione attività)"
    Write-Host "4.     msconfig.exe (Config. di sistema)"
    Write-Host "5.     NETSH        (Risolve problemi connessione, pulisce winsock)"
    Write-Host "6.     flushdns     (Svuota cache, reimposta registro DNS)"
    Write-Host "7.     ICiRA        (Impostazioni condivisione in rete avanzate)"
    Write-Host "8.     net use      (Elimina connessioni dischi di rete attive)"
    Write-Host "9.     shrpubw.exe  (Creazione guidata cartella condivisa)"
    Write-Host "10.    Copilot      (Strumenti Copilot)"
    Write-Host "0.     Esci"
    Write-Host ""
    $GRA = Read-Host "Inserisci il numero per l'operazione"
    

    switch ($GRA) {
        "0" {

        }
        "" {

        }
        "1" {
            Clear-Host
            winget upgrade --all --include-unknown
            Wscript.Sleep 1     
            GestioneReteApplicazioni
        }
        "2" {
            Invoke-Expression "$env:windir\System32\appwiz.cpl"
            Wscript.Sleep 1     
            GestioneReteApplicazioni
        }
        "3" {
            Invoke-Expression "$env:windir\System32\taskmgr.exe"
            Wscript.Sleep 1     
            GestioneReteApplicazioni
        }
        "4" {
            Invoke-Expression "$env:windir\System32\msconfig.exe"
            Wscript.Sleep 1     
            GestioneReteApplicazioni
        }
        "5" {
            Clear-Host
            netsh winsock reset
            Wscript.Sleep 1     
            GestioneReteApplicazioni
        }
        "6" {
            Clear-Host
            ipconfig/flushdns
            Wscript.Sleep 1     
            GestioneReteApplicazioni
        }
        "7" {
            control.exe /name Microsoft.NetworkAndSharingCenter /page Advanced
            Wscript.Sleep 1     
            GestioneReteApplicazioni
        }
        "8" {
            Clear-Host
            net use * /delete
            Wscript.Sleep 1     
            GestioneReteApplicazioni
        }
        "9" {
            shrpubw.exe
            Wscript.Sleep 1     
            GestioneReteApplicazioni
        }
        "10" {
            COPILOT
        }
        Default {
            Write-Host ""
            Write-Warning "Inserisci un'operazione valida e riprova"
        }
    }
}

function COPILOT {
    Clear-Host
    Get-Content ".\Assets\COPILOT.ANS"
    Write-Host "`n`nNUM.   COMANDO              (DESCRIZIONE COMANDO)"
    Write-Host "--------------------------------------------------"
    Write-Host "1.     Avvia Copilot        (Avvia url di Copilot)"
    Write-Host "2.     Attiva Copilot       (Imposta IsUserEligible a 1)"
    Write-Host "3.     Disattiva Copilot    (Imposta IsUserEligible a 0)"
    Write-Host "4.     ViVe Tool            (Abilita funzionalità sperimentali di Windows)"
    Write-Host "0.     Esci"
    Write-Host ""
    $CPLT = Read-Host "Inserisci il numero per l'operazione"
    switch ($CPLT) {
        "0" {

        }
        "" {

        }
        "1" {
            Start-Process .\Assets\Copilot.url
            Wscript.Sleep 1     
            COPILOT
        }
        "2" {
            Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\Shell\Copilot\BingChat' -Name 'IsUserEligible' -value '1'
            Wscript.Sleep 1     
            COPILOT
        }
        "3" {
            Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\Shell\Copilot\BingChat' -Name 'IsUserEligible' -value '0'
            Wscript.Sleep 1     
            COPILOT
        }
        "4" {
            Start-Process https://github.com/thebookisclosed/ViVe
            Wscript.Sleep 1     
            COPILOT
        }
        Default {
            Write-Host ""
            Write-Warning "Inserisci un'operazione valida e riprova"
        }
    }
}

function SicurezzaProtezione {
    Clear-Host
    Get-Content ".\Assets\SECUREePROTEZIONE.ANS"
    Write-Host ""
    Write-Host ""
    Write-Host "NUM  C O M A N D O        ( D  E  S  C  R  I  Z  I  O  N  E       C  O  M  A  N  D  O  )"
    Write-Host "--------------------------------------------------------------------------------------------------------------"
    Write-Host " 1.  Micros. Defender (v) (Antimalware propretario di Windows. SCANSIONE VELOCE)"
    Write-Host " 2.  Micros. Defender (c) (Antimalware propretario di Windows. SCANSIONE COMPLETA)"
    Write-Host " 3.  wscui.cpl            (Sicurezza e manutenzione)"
    Write-Host " 4.  del temp e prefetch  (Elimina tutti i file temporanei e i file di prefetch)"
    Write-Host " 5.  Stato MD             (Visualizza lo Stato attuale di Microsoft Defender)"
    Write-Host " 6.  Crea Checkpoint      (Crea un nuovo punto di ripristino)"
    Write-Host " 7.  Elenca Checkpoint    (Elenca tutti i punti di ripristino)"
    Write-Host " 8.  Elimina Checkpoint   (Elimina tutti i punti di ripristino)"
    Write-Host " 9.  Attiva MD            (Attiva la protezione massima di Microsoft Defender)"
    Write-Host "10.  hotplug.dll          (Rimozione sicura dell`hardware)"
    Write-Host "11.  sigverif.exe         (Verifica firma file)"
    Write-Host "12.  MRT.exe              (Strumento di rimozione malware Microsoft Windows)"
    Write-Host "13.  SPP                  (Protezione Sistema)"
    Write-Host "14.  Imp. di Criptaggio   (Impostazioni di crittografia del dispositivo)"
    Write-Host " 0.  Esci"
    Write-Host ""
    $SeP = Read-Host "Inserisci il numero corrispondente all'operazione che vuoi eseguire"

    switch ($SeP) {
        "0" {

        }
        "" {

        }
        "1" {
            Wscript.Sleep 1
            SicurezzaProtezione
        }
        "2" {
            Wscript.Sleep 1
            SicurezzaProtezione
        }
        "3" {
            Wscript.Sleep 1
            SicurezzaProtezione
        }
        "4" {
            Wscript.Sleep 1
            SicurezzaProtezione
        }
        "5" {
            Wscript.Sleep 1
            SicurezzaProtezione
        }
        "6" {
            Wscript.Sleep 1
            SicurezzaProtezione
        }
        "7" {
            Wscript.Sleep 1
            SicurezzaProtezione
        }
        "8" {
            Wscript.Sleep 1
            SicurezzaProtezione
        }
        "9" {
            Wscript.Sleep 1
            SicurezzaProtezione
        }
        "10" {
            Wscript.Sleep 1     
            SicurezzaProtezione
        }
        "11" {
            Wscript.Sleep 1     
            SicurezzaProtezione
        }
        "12" {
            Wscript.Sleep 1     
            SicurezzaProtezione
        }
        "13" {
            Wscript.Sleep 1
            SicurezzaProtezione
        }
        "14" {
            Wscript.Sleep 1
            SicurezzaProtezione
        }
        Default {
            Write-Host ""
            Write-Warning "Inserisci un'operazione valida e riprova"
        }
    }
}

function Guida4_3 {
    Clear-Host
    Write-Host "`nTra poco sarai reinderizzato alla pagina di DEBUG..." -ForegroundColor Yellow
    Write-Host "`n`nHAI SELEZIONATO LA MODALITÀ 4:3"
    Write-Host "`n!                        ! WARNING / ATTENZIONE !                         !" -ForegroundColor Red
    Write-Host "`n! IMPOSTA LA MODALITÀ SCHERMO INTERO PRIMA DI PASSARE AL DEBUG" -ForegroundColor Red

    $4_3 = Read-Host "`nVuoi passare alla schermata di DEBUG per i monitor 4:3[S/N]"
    switch ($4_3) {
        "S" {
            Debug4_3
        }
        "N" {
        }
        Default {
            Write-Host ""
            Write-Warning "Inserisci un'operazione valida e riprova"
        }
    }
}

function Debug4_3 {
    Clear-Host
    Write-Host "`n      Schermata per capire la risoluzione massima supportata da SYSCOM     " -ForegroundColor Yellow
    Write-Host "`n`n"
    Write-Host "<<<--------------------DEVO-VEDERMI-IN-UNA-SOLA-RIGA-------------------->>>"
    Write-Host ""
    Write-Host "!                        ! WARNING / ATTENZIONE !                         !" -ForegroundColor Red
    Write-Host "`n! IMPOSTA LARGHEZZA SHELL PER VISUALIZZARE TUTTA LA LINEA IN UNA SOLA RIGA" -ForegroundColor Red
    Write-Host "`n`n"
    Write-Host "`nUtilizza le seguenti combinazioni di tasti"
    Write-Host "per regolare la dimensione del testo nel terminale:"
    Write-Host ""
    Write-Host ""
    Write-Host "CTRL + SCROLL: Zoom avanti e indietro"
    Write-Host "CTRL + +  : Aumenta la dimensione del testo (solo su Microsoft Terminal)"
    Write-Host "CTRL + -  : Diminuisce la dimensione del testo (solo su Microsoft Terminal)"
    Write-Host "`n`n"
    Write-Host "Quando hai impostato correttamente la larghezza batti un tasto" -ForegroundColor GREEN
    CTRLPause
}
function Guida16_9 {
    Clear-Host
    Write-Host "`nTra poco sarai reinderizzato alla pagina di DEBUG..." -ForegroundColor Yellow
    Write-Host "`n`nHAI SELEZIONATO LA MODALITÀ 16:9"
    Write-Host "`n!                        ! WARNING / ATTENZIONE !                         !" -ForegroundColor Red
    Write-Host "`n! IMPOSTA LA MODALITÀ SCHERMO INTERO PRIMA DI PASSARE AL DEBUG" -ForegroundColor Red

    $16_9 = Read-Host "`nVuoi passare alla schermata di DEBUG per i monitor 16:9[S/N]"
    switch ($16_9) {
        "S" {
            Debug16_9
        }
        "N" {
        }
        Default {
            Write-Host ""
            Write-Warning "Inserisci un'operazione valida e riprova"
        }
    }
}
function Debug16_9 {
    Clear-Host
    Write-Host "`n                            Schermata per capire la risoluzione massima supportata da SYSCOM                           " -ForegroundColor Yellow
    Write-Host "`n`n"
    Write-Host "<<<-----------------------------------------DEVO-VEDERMI-IN-UNA-SOLA-RIGA----------------------------------------->>>"
    Write-Host ""
    Write-Host "!                                              ! WARNING / ATTENZIONE !                                               !" -ForegroundColor Red
    Write-Host "`n! IMPOSTA LARGHEZZA SHELL PER VISUALIZZARE TUTTA LA LINEA IN UNA SOLA RIGA" -ForegroundColor Red
    Write-Host "`n`n"
    Write-Host "`nUtilizza le seguenti combinazioni di tasti"
    Write-Host "per regolare la dimensione del testo nel terminale:"
    Write-Host ""
    Write-Host ""
    Write-Host "CTRL + SCROLL: Zoom avanti e indietro"
    Write-Host "CTRL + +     : Aumenta la dimensione del testo (solo su Microsoft Terminal)"
    Write-Host "CTRL + -     : Diminuisce la dimensione del testo (solo su Microsoft Terminal)"
    Write-Host "`n`n"
    Write-Host "Quando hai impostato correttamente la larghezza premi un tasto" -ForegroundColor GREEN
    CTRLPause
}

function INFO {
    Clear-Host
    Write-Host "`n       Schermata per capire la versione attualmente in uso di SYSCOM       " -ForegroundColor Yellow
    Write-Host "`n`n"
    Write-Host "`nNome programma: SYSCOM"
    Write-Host "`nNome funzione: INFO"
    Write-Host "`nOra ultima scrittura: 20/05/2024 - 09:32"
    Write-Host "`nVersione: 0.0.2"
    Write-Host "`n! Per scaricare SYSCOM portable batti l'operazione 0.5 nel Menu Principale" -ForegroundColor Red
}

# Menu principale
do {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Get-Content ".\Assets\SYSCOM-ASCII"
    Write-Host ""
    Write-Host ""
    Write-Host "1. Manutenzione del Sistema Operativo e dei Dischi"
    Write-Host "2. Gestione di Rete e Applicazioni"
    Write-Host "3. Sicurezza e Protezione"
    Write-Host "0. Esci"
    Write-Host "0.1. Schermo Intero"
    Write-Host "0.2. Imposta la risoluzione su un Televisore a tubo catodico (4:3)" 
    Write-Host "0.3. Imposta la risoluzione su un Monitor di un computer (16:9)"
    Write-Host "0.4. Informazioni sulla versione di SYSCOM"
    Write-Host "0.5. Installa SYSCOM portable"
    Write-Host ""
    $choice =  Read-Host "Inserisci il numero per l'operazione"

    switch ($choice) {
        "1" { ManutenzioneSOeDischi }
        "2" { GestioneReteApplicazioni }
        "3" { SicurezzaProtezione }
        "0" { exit }
        "0.1" {
            Start-Process .\VISO\F11.vbs
        }
        "0.4" {
            INFO
        }
        "LICENZA" {
            Clear-Host
            Write-Host ""
            Get-Content ".\VISO\LICENZA"
            }
        "AUT" {
            Clear-Host
            Write-Host ""
            Get-Content ".\VISO\AUTRICE.ANS"
        }
        "0.0" {
            .\SYSCOM.PS1
            exit
        }
        "0.2" { Guida4_3 }
        "0.3" { Guida16_9 }
        "0.5" { ./PORTABLE.PS1}
        default { Write-Host "Operazione non valida. Riprova." }
    }

    Write-Host ""
    Write-Host "Premi un tasto per tornare al menu principale..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

} while ($true)
