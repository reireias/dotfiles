function Main(input) {
  let x = input.trim().split(' ').map(str => parseInt(str))
}

Main(require('fs').readFileSync('/dev/stdin', 'utf8'))
