# Currently trying this out on the .ca Top-Level Domain in the extracted WARC directories.
# File formats thanks to Andy Jackson's "Formats Over Time: Exploring UK Web History" (http://arxiv.org/abs/1210.1714) as well as random explorations.
# Once this works, going to swap out /ca/ and 'ca' in regex to grab it.
# Any comments appreciated.

i=1
find -E . -regex '.+\.ca/.+(\.gif|\.jpg|\.tif|\.jpeg|\.tiff|\.png|\.jp2|\.j2k|\.bmp|\.pict|\.wmf|\.emf|\.ico|\.xbm)' | while read filename; do
    newname=$i.${filename##*.}
    cp "$filename" /volumes/the-big-one/images-all-formats/ca/"$newname"
    i=$((i+1))
done
