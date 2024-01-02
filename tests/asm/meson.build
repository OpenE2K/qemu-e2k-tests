inc_dir = include_directories('include')

asm_tests = {
  'aau': {
    'staa-1': {},
    'movab-1': { 'src': 'mova', 'c_args': ['-DOP=movab', '-DFMT=1'] },
    'movah-1': { 'src': 'mova', 'c_args': ['-DOP=movah', '-DFMT=2'] },
    'movaw-1': { 'src': 'mova', 'c_args': ['-DOP=movaw', '-DFMT=3'] },
    'movad-1': { 'src': 'mova', 'c_args': ['-DOP=movad', '-DFMT=4'] },
    'movab-fmt-0': { 'src': 'mova-fmt', 'c_args': ['-DOP=movab', '-DFMT=0'], 'should_fail': true },
    'movab-fmt-1': { 'src': 'mova-fmt', 'c_args': ['-DOP=movab', '-DFMT=1'] },
    'movab-fmt-2': { 'src': 'mova-fmt', 'c_args': ['-DOP=movab', '-DFMT=2'] },
    'movab-fmt-3': { 'src': 'mova-fmt', 'c_args': ['-DOP=movab', '-DFMT=3'] },
    'movab-fmt-4': { 'src': 'mova-fmt', 'c_args': ['-DOP=movab', '-DFMT=4'] },
    'movab-fmt-5': { 'src': 'mova-fmt', 'c_args': ['-DOP=movab', '-DFMT=5'] },
    'movah-fmt-0': { 'src': 'mova-fmt', 'c_args': ['-DOP=movah', '-DFMT=0'], 'should_fail': true },
    'movah-fmt-1': { 'src': 'mova-fmt', 'c_args': ['-DOP=movah', '-DFMT=1'], 'should_fail': true },
    'movah-fmt-2': { 'src': 'mova-fmt', 'c_args': ['-DOP=movah', '-DFMT=2'] },
    'movah-fmt-3': { 'src': 'mova-fmt', 'c_args': ['-DOP=movah', '-DFMT=3'] },
    'movah-fmt-4': { 'src': 'mova-fmt', 'c_args': ['-DOP=movah', '-DFMT=4'] },
    'movah-fmt-5': { 'src': 'mova-fmt', 'c_args': ['-DOP=movah', '-DFMT=5'] },
    'movaw-fmt-0': { 'src': 'mova-fmt', 'c_args': ['-DOP=movaw', '-DFMT=0'], 'should_fail': true },
    'movaw-fmt-1': { 'src': 'mova-fmt', 'c_args': ['-DOP=movaw', '-DFMT=1'], 'should_fail': true },
    'movaw-fmt-2': { 'src': 'mova-fmt', 'c_args': ['-DOP=movaw', '-DFMT=2'], 'should_fail': true },
    'movaw-fmt-3': { 'src': 'mova-fmt', 'c_args': ['-DOP=movaw', '-DFMT=3'] },
    'movaw-fmt-4': { 'src': 'mova-fmt', 'c_args': ['-DOP=movaw', '-DFMT=4'] },
    'movaw-fmt-5': { 'src': 'mova-fmt', 'c_args': ['-DOP=movaw', '-DFMT=5'] },
    'movad-fmt-0': { 'src': 'mova-fmt', 'c_args': ['-DOP=movad', '-DFMT=0'], 'should_fail': true },
    'movad-fmt-1': { 'src': 'mova-fmt', 'c_args': ['-DOP=movad', '-DFMT=1'], 'should_fail': true },
    'movad-fmt-2': { 'src': 'mova-fmt', 'c_args': ['-DOP=movad', '-DFMT=2'], 'should_fail': true },
    'movad-fmt-3': { 'src': 'mova-fmt', 'c_args': ['-DOP=movad', '-DFMT=3'], 'should_fail': true },
    'movad-fmt-4': { 'src': 'mova-fmt', 'c_args': ['-DOP=movad', '-DFMT=4'] },
    'movad-fmt-5': { 'src': 'mova-fmt', 'c_args': ['-DOP=movad', '-DFMT=5'] },
    'movah-unaligned-1': { 'src': 'mova-unaligned', 'c_args': ['-DOP=movah', '-DFMT=2', '-DMAX_VER=4'], 'should_fail': true },
    'movah-unaligned-2': { 'src': 'mova-unaligned', 'c_args': ['-DOP=movah', '-DFMT=2', '-DMIN_VER=5'] },
    'movaw-unaligned-1': { 'src': 'mova-unaligned', 'c_args': ['-DOP=movaw', '-DFMT=3', '-DMAX_VER=4'], 'should_fail': true },
    'movaw-unaligned-2': { 'src': 'mova-unaligned', 'c_args': ['-DOP=movaw', '-DFMT=3', '-DMIN_VER=5'] },
    'movad-unaligned-1': { 'src': 'mova-unaligned', 'c_args': ['-DOP=movad', '-DFMT=4', '-DMAX_VER=4'], 'should_fail': true },
    'movad-unaligned-2': { 'src': 'mova-unaligned', 'c_args': ['-DOP=movad', '-DFMT=4', '-DMIN_VER=5'] },
  },
  'base': {
    'same-reg-output-1': {},
    'exit-0': {},
    'exit-1': { 'should_fail': true },
    'template': {},
    'signal-1': {},
    'excp-1': {},
    'excp-2': {},
    'excp-3': {},
    'excp-4': {},
    'excp-5': {},
    'excp-6': {},
    'excp-7': {},
    'excp-8': {},
    'excp-9': {},
  },
  'win': {
    'setwd-1': {},
    'setwd-2': {},
    'setwd-invalidate-regs-1': {},
    'setwd-invalidate-regs-2': {},
    'setwd-psize-1': {},
    'setwd-psize-2': { 'should_fail': true },
    'setbn-invalidate-regs-1': {},
    'setbn-invalidate-regs-2': { 'should_fail': true },
    'setbp-invalidate-regs-1': {},
    'setbp-invalidate-regs-2': { 'should_fail': true },
    'dbl-1': {},
    'out-of-bounds-1': { 'should_fail': true },
    'out-of-bounds-2': { 'should_fail': true },
    'out-of-bounds-3': { 'should_fail': true },
    'br-1': {},
  },
  'ct': {
    'ibranch-1': {},
    'ct-1': {},
    'call-1': {},
    'call-2': { 'should_fail': true },
    'call-invalidate-pregs-1': {},
    'call-invalidate-pregs-2': { 'should_fail': true },
    'call-reset-ctpr-1': { 'should_fail': true },
    'call-reset-ctpr-2': { 'should_fail': true },
    'call-reset-ctpr-3': { 'should_fail': true },
    'ret-reset-ctpr-1': { 'should_fail': true },
    'ret-reset-ctpr-2': { 'should_fail': true },
    'ret-reset-ctpr-3': { 'should_fail': true },
  },
  'decode': {
    'ales25-1': {},
    'lit-1': {},
    'store-load-group-1': {},
    'store-load-group-2': { 'should_fail': true },
    'store-load-group-3': { 'should_fail': true },
    'unaligned-1': { 'should_fail': true },
    'unaligned-2': { 'should_fail': true },
    'unaligned-3': { 'should_fail': true },
    'unaligned-4': { 'should_fail': true },
  },
  'plu': {
    'andp-1': {},
    'andp-2': {},
    'andp-3': { 'should_fail': true },
    'andp-4': { 'should_fail': true },
    'andp-5': { 'should_fail': true },
    'andp-6': { 'should_fail': true },
    'andp-7': { 'should_fail': true },
    'andp-8': { 'should_fail': true },
    'andp-9': { 'should_fail': true },
    'andp-10': { 'should_fail': true },
    'landp-1': { 'src': 'andp-1' },
    'landp-2': { 'src': 'andp-2', 'c_args': ['-DOP=landp'] },
    'landp-3': { 'src': 'andp-3', 'c_args': ['-DOP=landp'], 'should_fail': true },
    'landp-4': { 'src': 'andp-4', 'c_args': ['-DOP=landp'], 'should_fail': true },
    'landp-5': { 'src': 'andp-5', 'c_args': ['-DOP=landp'], 'should_fail': true },
    'landp-6': { 'src': 'andp-6', 'c_args': ['-DOP=landp'], 'should_fail': true },
    'landp-7': { 'src': 'andp-7', 'c_args': ['-DOP=landp'], 'should_fail': true },
    'landp-8': { 'src': 'andp-8', 'c_args': ['-DOP=landp'], 'should_fail': true },
    'landp-9': { 'src': 'andp-9', 'c_args': ['-DOP=landp'] },
    'landp-10': { 'src': 'andp-10', 'c_args': ['-DOP=landp'], 'should_fail': true },
    'movep-1': {},
    'cascading-1': {},
    'cascading-2': {},
    'clp-arg-1': {},
  },
  'int': {
    'basic-1': {},
    'bitrev-1': {},
    'getfd-1': {},
    'insfd-1': {},
    'sxt-1': {},
    'cmpd-1': {},
    'rwd-rrd-1': {},
    'rwd-alc-rrd-1': {},
  },
  'sm': {
    'dbl-1': {},
    'gettagd-1': {},
    'gettagd-2': { 'should_fail': true },
    'insfd-1': {},
    'insfd-2': { 'should_fail': true },
    'ldd-1': { 'should_fail': true },
    'merged-1': {},
    'merged-2': { 'should_fail': true },
    'merged-3': { 'should_fail': true },
    'merged-4': { 'should_fail': true },
    'merged-5': {},
    'movtd-ct-1': {},
    'movtd-ct-2': {},
    'puttagd-1': {},
    'puttagd-2': { 'should_fail': true },
    'puttagd-3': { 'should_fail': true },
    'puttags-1': {},
    'puttags-2': { 'should_fail': true },
    'qual-1': {},
    'qual-2': { 'should_fail': true },
    'qual-3': { 'should_fail': true },
    'qual-4': {},
    'qual-call-1': { 'should_fail': true },
    'qual-ct-1': { 'should_fail': true },
    'qual-ibranch-1': { 'should_fail': true },
    'std-1': {},
    'udivs-1': { 'should_fail': true },
  },
  'lsr': {
    'lsr-1': {},
    'lsr-2': {},
    'lsr-3': {},
    'rwd-lsr-delay-1': {},
    'rwd-lsr-delay-2': { 'should_fail': true },
    'strmd-1': {},
  },
  'loop': {
    'loop-1': {},
  },
  'dam': {
    'dam-1': {},
    'dam-2': {},
  },
  'syscall': {
    'get-ps-size-1': {},
    'get-pcs-size-1': {},
    'get-pcs-offset-1': {},
    'read-ps-ex-1': {},
    'read-ps-ex-unaligned-1': { 'should_fail': true },
    'write-ps-ex-1': {},
    'zero-wsz-1': {},
    'invalid-sdisp-1': { 'should_fail': true },
    'invalid-nr-1': {},
    'invalid-nr-hi-1': {},
    'invalid-arg-1': {},
    'invalid-arg-hi-1': {},
  },
}

foreach suite, tests : asm_tests
  foreach name, opts : tests
    if 'src' in opts
      name_src = opts['src']
    else
      name_src = name
    endif

    exe_name = suite + '-' + name
    exe_src = files(suite + '/' + name_src + '.S')
    exe_args = {
      'link_args': ['-nostdlib'],
      'include_directories': inc_dir,
    }

    if 'c_args' in opts
      exe_args += { 'c_args': opts['c_args'] }
    endif

    test_args = {
      'timeout': 20,
      'suite': [suite],
    }

    if 'should_fail' in opts
      test_args += { 'should_fail': opts['should_fail'] }
    endif

    exe = executable(exe_name, exe_src, kwargs: exe_args)
    test(name, exe, kwargs: test_args)
  endforeach
endforeach
