#!/usr/bin/env bats

@test "first run" {
  repository=$(pwd)
  temporaryDirectory=$(mktemp -d)
  expected=$temporaryDirectory/expected
  cp -r ./tests/first-run/expected/. $expected
  mkdir -p $expected/plugins/dreck
  cp -r ./dreck $expected/plugins
  mkdir -p $expected/plugins/terser
  cp -r . $expected/plugins/terser
  actual=$temporaryDirectory/actual
  cp -r ./tests/first-run/input/. $actual
  mkdir -p $actual/plugins/dreck
  cp -r ./dreck $actual/plugins
  mkdir -p $actual/plugins/terser
  cp -r . $actual/plugins/terser
  cd $actual

  make --file ./plugins/dreck/makefile

  rm -r $actual/plugins/terser/node_modules $actual/plugins/terser/npm-install-marker
  cd $repository
  diff --brief --recursive $actual $expected
  rm -rf $temporaryDirectory
}
