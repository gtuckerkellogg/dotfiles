cat "links.prop" | while read line
do
#    local src dst dir
    src=$(eval echo "$line" | cut -d '=' -f 1)
    dst=$(eval echo "$line" | cut -d '=' -f 2)
    dir=$(dirname "$dst")
    echo "src=$src"
    echo "dst=$dst"
done

