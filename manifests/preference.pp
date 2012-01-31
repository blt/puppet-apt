# Defines a resource to set apt pinning preferences.
#
# See apt_preferences (5) for more details and an explanation of why this might
# interest you.
#
# Parameters:
#
#  [*ensure*] -- sets the availability of the preference (present|absent)
#  [*package*] -- sets package name in preference (see manpage)
#  [*priority*] -- sets priority value of package (see manpage)
#  [*release*] -- sets target release for package (see manpage)
#
define apt::preference($ensure=file, $package=$name, $priority='-1', $release='*') {
  # Note: some of the aptitude 0.6 series will not pull versions out of
  # /etc/apt/preferences.d. Use apt-get. Check for difficulties with `apt-cache
  # policy`
  file { "/etc/apt/preferences.d/${name}":
    ensure => $ensure,
    content => template('apt/preferences.d.erb'),
  }
}
