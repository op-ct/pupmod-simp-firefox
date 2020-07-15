class mozilla::firefox (
) {

  assert_private()

  package { 'firefox':
    ensure => $package_ensure
  }
}
