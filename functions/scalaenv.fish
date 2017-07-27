function scalaenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    . (scalaenv "sh-$command" $argv|psub)
  case '*'
    command scalaenv "$command" $argv
  end
end
