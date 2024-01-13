inc_dir = include_directories('include')

asm_tests = {
  'simple': {
    'hello': {},
    'create-thread': { 'link_args': ['-lpthread'] },
  },
}

foreach suite, tests : asm_tests
  foreach name, opts : tests
    exe_name = suite + '-' + name
    exe_src = files(suite + '/' + name + '.c')
    exe_args = {
      'include_directories': inc_dir,
    }

    if 'c_args' in opts
      exe_args += { 'c_args': opts['c_args'] }
    endif

    if 'link_args' in opts
      exe_args += { 'link_args': opts['link_args'] }
    endif

    test_args = {
      'timeout': 30,
      'suite': [suite],
    }

    if 'should_fail' in opts
      test_args += { 'should_fail': opts['should_fail'] }
    endif

    exe = executable(exe_name, exe_src, kwargs: exe_args)
    test(name, exe, kwargs: test_args)
  endforeach
endforeach
