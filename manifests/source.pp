# Defines a new apt source list.
#
# See sources.list (5) for more details.
#
# Parameters:
#  [*ensure*] -- set availability (absent|present)
#   *source*  -- provides source list contents
#
define apt::source($ensure=file, $source) {
  include apt # whence Exec['apt-get update']

  # Nothing fancy here.
  file { "/etc/apt/sources.list.d/${name}.list":
    ensure => $ensure,
    content => template('apt/sources.list.d.erb'),
    notify => Exec['apt-get update'],
  }
}
