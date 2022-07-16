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
    # generate by the command gcc -v -x c -E /dev/null
    '-isystem','include',
    '-isystem','C:/tools/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/12.1.0/include',
    '-isystem','C:/tools/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/12.1.0/../../../../include',
    '-isystem','C:/tools/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/12.1.0/include-fixed',
]

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', ]

def FlagsForFile( filename, **kwargs ):
  return {
  'flags': flags,
  'do_cache': True
  }
