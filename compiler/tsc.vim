if exists("current_compiler")
  finish
endif
let current_compiler = "tsc"

CompilerSet makeprg=tsc\ --pretty\ false\ $*
CompilerSet errorformat=%f(%l\\\,%c):\ %m
