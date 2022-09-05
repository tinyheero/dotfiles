let cmdline_map_start= '<LocalLeader>rf'
let cmdline_map_send= '<LocalLeader>d'

let cmdline_app = {}
let cmdline_app['sh'] = 'bash'

if executable('ipython')
  " Using ipython allows you to circumvent the 'indentation pasting' issues.
  let cmdline_app['python'] = 'ipython'
elseif executable('python3')
  let cmdline_app['python'] = 'python3'
else
  let cmdline_app['python'] = 'python'
endif
