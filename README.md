# hmm-pos-tagger
HMM-Based POS Tagger for Turkish 

For this application, METU-Sabanci Turkish Dependency Treebank is used (only the id:1stcol, token:2ndcol and POStag:4thcol). In order to extract the columns, you may run the following on commandline:
```
cut -f1,2,4 TREEBANK.conll > /PATH/TO/REPO/posdata.tsv
```
