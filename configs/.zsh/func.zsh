function vr() {
vim -c "bufdo %s/$1/$2/gc | update" $(ag "$1" -l)
}
