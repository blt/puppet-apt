# Sets and removes apt keys.
#
# See apt-key (8) for more details.
#
# Parameters:
#
#  [*ensure*] -- sets the availabiity of the key (present|absent)
#  *source*   -- URI for key resource
#
define apt::key ($source, $ensure=present) {
  include apt # whence Exec['apt-get update']

  case $ensure {
    present: {
      exec { "${name} apt-key add":
        command => "wget -q ${source} -O- | apt-key add -",
        unless  => "apt-key list | grep ${name}",
        notify  => Exec['apt-get update'],
      }
    }
    absent:  {
      exec { "${name} apt-kget remove":
        command => "apt-key del ${name}",
        onlyif  => "apt-key list | grep ${name}",
        notify  => Exec['apt-get update'],
      }
    }
    default: {
      fail "(present|absent) not '${ensure}'"
    }
  }
}
