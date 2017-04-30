# WikiKonverter4WikiReader

Eine vorgepatchte OpenMoko Wikireader Entwicklungsumgebung um auf einem aktuellen Linux (getestet auf Ubuntu 17.04) einen Wikiexport (xml) für den WikiReader zu konvertieren.

## Installation

1. Alles runterladen oder clonen.
2. Terminal im Verzeichnis öffnen.
3. tar -xvjf wikireader.tar.bz2
4. chmod +x _install_packages.sh
5. chmod +x build.sh
6. ./_install_packages.sh

## Benutzung

1. Wikipedia Artikel https://de.wikipedia.org/wiki/Spezial:Exportieren exportieren.  
Beispielsweise alle Artikel einer Kategorie wie 'Kategorie:Linux'.
2. Exportierte Artikel als "wikipedia.xml" in das "source"-Verzeichnis legen.
3. Im Terminal "./build.sh wikipedia Linuxartikel" aufrufen.
4. Wenn alles durchlief müsste unter image/depedia ein Verzeichnis mit 6 Dateien existieren. Dieses auf die SD-Karte des WikiReaders kopieren.
5. Viel Spaß beim Lesen!

## Mögliche Probleme

1. Es wurden nicht alle 6 Dateien erstellt
  * Eventuell existieren in der XML doppelte Artikel als Links auf den jeweiligen Hauptartikel. Diese Links müssen mit einem Texteditor entfernt werden.
  * Parserfehler - Hier müssen die Artikel mit Artikeln, die ohne Probleme durchlaufen verglichen werden und besondere Formatierungen entfernt werden. Der Parser ist leider sehr pingelig... 
2. Debugging
  * Im build.sh-Script werden die meisten Meldungen über eine umgeleitete Ausgabe nach /dev/null versteckt. Einfach ">> /dev/null" in Zeile 18 entfernen um zu sehen, wo der Compiler Probleme hat.

## Änderungen am Entwicklungskit

1. preg\_replace zu preg\_place\_callback  
/wikireader/host-tools/offline-renderer/mediawiki-offline/includes/Sanitizer.php  
/wikireader/host-tools/offline-renderer/mediawiki-offline/extensions/Poem/Poem.php

2. Übersetzungsansatz für deutsche Wikis  
/translations/de/

3. Auskommentieren der Verarbeitung von japanischen Texten 
/wikireader/host-tools/offline-renderer/Article*.py

## Links und Quellen

https://github.com/wikireader/wikireader

## Lizenz

Die Lizenzen der einzelnen Pakete sind jeweils aus deren Quellcodes bzw. mitgelieferten Lizenzdateien zu entnehmen. Meine Scripte haben keine Lizenz und können frei kopiert/verändert werden.