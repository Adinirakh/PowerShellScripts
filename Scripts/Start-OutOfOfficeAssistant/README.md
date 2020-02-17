# Der interaktive Abwesenheitsassistenten Assistent für die PowerShell

Das interaktive Skript hilft IT-Verantwortlichen beim setzen des
Abwesenheitsassistenten. Benötigt wird nur PowerShell Version 5+, ein
Exchange-Server und eine .txt Datei mit der gewünschten Nachricht. Vor der
ersten Nutzung müssen folgende Variablen im Skript angepasst werden:

**$outlookURI**: Hier muss die URI der Exchange PowerShell angegeben werden. Sollte
ein Loadbalancer genutzt werden, kann es sein, dass man direkt mit einem
Exchange-Server verbinden muss. Die Angabe muss im Format wie folgt aussehen:\
*http://Exchange/PowerShell*

**$MBXServer**: FQDN des genutzten Exchang-Server\
*Server.domain.tld*

Nach dem Ausführen des Skripts, bitte den Anweisungen auf dem Bildschirm folgen.
