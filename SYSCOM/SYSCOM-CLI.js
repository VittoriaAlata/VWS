function downloadFiles() {
    var files = [
      'https://github.com/VittoriaAlata/SYSCOM/releases/download/v0.0.4/SYSCOM.0.0.4.MSI', // Percorso al file SYSCOM.MSI
    ];
  
    files.forEach(function(file) {
      var a = document.createElement('a');
      a.href = file;
      a.download = file.substr(file.lastIndexOf('/') + 1);
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
    });
  }
  
  // Aggiungi questo attributo al tuo bottone HTML
  // onclick="downloadFiles()"
  