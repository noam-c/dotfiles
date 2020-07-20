function vims
  Ag -l $argv[1] | xargs -o vim +/$argv[1]
end
