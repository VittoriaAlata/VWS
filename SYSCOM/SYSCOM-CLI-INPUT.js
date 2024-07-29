function handleInput() {
    event.preventDefault(); // Previene il refresh della pagina
    var terminalInput = document.getElementById("terminalInput").value;
    if (terminalInput === "1") {
        loadScript("SYSCOM-CLI.js", downloadFiles);
    } else if (terminalInput === "2") {
        loadPage("./MANUALE-CLI"); // Sostituisci con l'URL della pagina che vuoi caricare
    } else {
        alert("Opzione non valida!");
    }
}

function loadScript(scriptName, callback) {
    var script = document.createElement("script");
    script.src = scriptName;
    script.onload = callback; // Chiama la funzione callback una volta che lo script è caricato
    document.head.appendChild(script);
}

function loadPage(url) {
    window.location.href = url; // Reindirizza il browser all'URL specificato
}
