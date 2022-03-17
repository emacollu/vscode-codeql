### creazione del DB

Prima di eseguire la query, bisogna creare il database da analizzare.
Perciò, creare un file .env e al suo interno inserire la variabile
```
SOURCE_JAVA_PRJ=<path_progetto_java>
```
e poi eseguire lo script `createdb.sh`

### analisi del DB

Dopo aver generato il database è possibile eseguire una query di codeql l'anciando lo scritp `analizedb.sh <file_ql_da eseguire>`.
Verrà generato un file di risultato nella cartella `results_analysis` 