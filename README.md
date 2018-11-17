# hmm-pos-tagger
HMM-Based POS Tagger for Turkish 

For this application, METU-Sabanci Turkish Dependency Treebank is used (only token:2ndcol and POStag:4thcol where the 2nd column is not "_"). In order to extract the columns, you may run the following on commandline:
```
cut -f2,4 TREEBANK.conll | grep -v -P "^_\t" > /PATH/TO/REPO/posdata.tsv
```

Moreover, there was little bug in the dataset with the occurrences word "satın" and its POS tag. If you have the same bug, you may fix that running this command
```
sed -i 's/\tsatın/\tNoun/g' /PATH/TO/REPO/posdata.tsv 
```
