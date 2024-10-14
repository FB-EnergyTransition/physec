# Physec / Prosec Webapplikation

Dies ist das Installationspaket für die beiden Webapplikationen Physec und Prosec, etwickelt von der Forschung Burgenland
GmbH. Beide Projekte können mit dem selben Installationspaket eingerichtet werden.

## Physec

Erklärung des Projektes Physec


## Prosec

Erklärung des Projektes Prosec

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
