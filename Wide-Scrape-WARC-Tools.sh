#!/bin/bash
trap "exit" INT
FILES=/volumes/lacie/warcs/*.warc.gz

for f in $FILES
do
    #echo "$f"
    DIR=${f: -54:46}
    echo $DIR
    mkdir $DIR
    
    filename=${f: -33}
    #echo $filename

    OUTPUT=$DIR"/"$filename"-filtered.warc"
    
    warcfilter -T response $f > $OUTPUT
    
    DIR2=$DIR"/html"
    
    mkdir $DIR2
    
    INDEX=$DIR/"index.html"
    
    warchtmlindex.py $OUTPUT > $INDEX
    
    cd $DIR
    
    python /users/ianmilligan1/desktop/research/warc/warc-tools-mandel/filesdump.py $OUTPUT
    
    cd ..
    
done