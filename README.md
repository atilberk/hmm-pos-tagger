# hmm-pos-tagger
HMM-Based POS Tagger for Turkish 

For this application, METU-Sabanci Turkish Dependency Treebank is used (only token:2ndcol and POStag:4thcol where the 2nd column is not "_"). In order to extract the columns, you may run the following on commandline:
```
cut -f2,4 TREEBANK.conll | grep -v -P "^_\t" > /PATH/TO/REPO/posdata.tsv
```
