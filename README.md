# Physec / Prosec Webapplikation

Dies ist das Installationspaket für die beiden Webapplikationen Physec und Prosec, etwickelt von der Forschung Burgenland
GmbH. Beide Projekte können mit dem selben Installationspaket eingerichtet werden.

## Physec

m PhySec-Projekt wurden innovative Ansätze entwickelt, um den wachsenden Bedrohungen durch Cyberangriffe für kleine und mittlere Unternehmen (KMU) zu begegnen. Der Schwerpunkt lag auf der Verbesserung der Cyber- und IT-Sicherheit durch den Einsatz moderner Technologien und die Anpassung an die digitale Landschaft. Eine umfassende webbasierte Plattform wurde entwickelt, um KMU praxisnahe Einblicke und wichtige Werkzeuge zum Schutz ihrer digitalen Ressourcen zu bieten. Im Laufe des Projekts wurden die Sicherheitsbedürfnisse kontinuierlich analysiert und praxisnahe Lösungen implementiert, um Schwachstellen, Datenlecks und potenzielle Cyberangriffe zu verhindern und so widerstandsfähigere IT-Systeme für KMU zu gewährleisten.

## Prosec

Im Innovationsprojekt ProSec wurde ein praxisorientierter Leitfaden zur Umsetzung der DSGVO entwickelt, der speziell auf die Bedürfnisse von kleinen und mittleren Unternehmen (KMU) zugeschnitten war. Das Projektziel war es, KMU trotz digitaler Transformation und der Einführung von Industrie 4.0-Technologien bei der erfolgreichen Erfüllung der DSGVO-Anforderungen zu unterstützen. Auf einer benutzerfreundlichen Web-Plattform wurden MUST-HAVES zu den Themen Datenschutz und Datensicherheit beschrieben. Die Projektergebnisse wurden kontinuierlich evaluiert, um praxisnahe Lösungen für KMU zu bieten und schwerwiegende Folgen wie hohe Geldstrafen und Datenpannen zu verhindern.

## Installation

### Voraussetzungen (Requirements)

- PHP >= 8.2
- composer >= 2.8  
  Die Installation erfolgt mit Hilfe von composer. Wenn Sie composer nicht installiert haben, gehen Sie auf https://getcomposer.org.
- Mysql oder MariaDB
  - Eine Datenbank samt Benutzer muss vor der Installation angelegt werden
- mysqli PHP Modul
- .htaccess muss im Webserver aktiviert werden
  In der Apache-config muss z. B. `AllowOverride all` stehen

### Installation der Webapp

Gehen Sie auf Ihrem Webserver in das Verzeichnis, in dem der Webspace als Unterverzeichnis liegt. Ersetzen Sie in
den nachfolgenden Zeilen `myprojectname` durch den Namen des Verzeichnisses, das den Webspace beinhalten soll. In
der Webserver-Konfiguration muss das Webroot also auf dieses Verzeichnis zeigen.

```
#> composer create-project fb-energytransition/physec myprojectname
#> cd myprojectname
#> composer letsgo
```
- Danach müssen einige Frage über die DB-Verbindung beantwortet werden

### Laden der Daten

Sie können an diesem Punkt mit der Installation aufhören, wenn Sie alle Fragen und Antwortmöglichkeiten in der Webapp
selbst anlegen wollen. Wollen Sie statt dessen die vorgefertigten Fragen von Physec oder Prosec laden, tippen Sie:

```
#> composer physec
```
oder
```
#> composer prosec
```

### Absicherung der Installation

Löschen Sie nach erfolgreicher Installation das Verzeichnis `install` in ihrem Webroot.

### Aufruf der Webapplikation

Sie können in den Admin-Bereich einloggen mit:

```
http://<ihre.web.adresse>/admin
```
Verwenden Sie dazu den user `admin` und das Passwort, dass sie beim Aufruf von `composer letsgo` vergeben haben.

Um in den Benutzer-Bereich zu kommen, tippen Sie:

```
http://<ihre.web.adresse>/user
```
Ersetzen Sie in beiden Fällen `<ihre.web.adresse>` durch die URL ihres Webspace.
