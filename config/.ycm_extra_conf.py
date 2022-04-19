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
  '-std=c++20',
  # generate by the commmand gcc -v -x c -E /dev/null
  '-isystem','C:/tools/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/11.2.0/include',
  '-isystem','C:/tools/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/11.2.0/../../../../include',
  '-isystem','C:/tools/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/11.2.0/include-fixed',
  '-isystem','C:/tools/msys64/mingw64/include/c++/11.2.0',
  '-isystem','C:/tools/msys64/mingw64/include/c++/11.2.0/x86_64-w64-mingw32',
  '-isystem','C:/tools/msys64/mingw64/include/c++/11.2.0/backward',
  '-isystem','C:/tools/msys64/mingw64/lib/clang/14.0.0/include',
  '-isystem','C:/tools/msys64/mingw64/include',
  '-isystem','include',
  ]

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', ]

def FlagsForFile( filename, **kwargs ):
  return {
  'flags': flags,
  'do_cache': True
  }
