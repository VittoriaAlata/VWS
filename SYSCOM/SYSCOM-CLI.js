function downloadFiles() {
    var files = [
      'https://vittoriaalata.github.io/VWS/SYSCOM/SYSCOM.0.0.4.MSI', // Percorso al file SYSCOM.MSI
      'https://vittoriaalata.github.io/VWS/SYSCOM/CERT.SYSCOM.v0.0.4.pdf' // Percorso al file CERT.SYSCOM.v0.0.4.pdf
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
  