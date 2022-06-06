import os
import ycm_core

flags = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-DNDEBUG',
    '-xc++',
    '-std=c++17',
    # generate by the commmand gcc -v -x c -E /dev/null
    '-isystem','include',
]

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', ]

def FlagsForFile( filename, **kwargs ):
  return {
  'flags': flags,
  'do_cache': True
  }
