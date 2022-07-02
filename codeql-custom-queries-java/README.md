### creazione del DB

Prima di eseguire la query, bisogna creare il database da analizzare.
Perciò, creare un file .env e al suo interno inserire la variabile
```
SOURCE_JAVA_PRJ=<path_progetto_java>
```
e poi eseguire lo script:

```
cratedb.sh -d [db_directory] -s [path_source_code] -c [compile_command]
```

### analisi del DB

Dopo aver generato il database è possibile eseguire una query di codeql l'anciando lo scritp:
```
runquery.sh -d [db_directory] -r [result_directory] com_inj.ql 
```

Verranno generati due file di risultato nella cartella `results_analysis`: il risultato dell'analisi in formato `.bqrs` e il file `.json` decodificato.
