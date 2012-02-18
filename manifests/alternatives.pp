# Sets and removes Debian alternatives.
#
# See update-alternatives (8) for more details.
#
# Parameters:
#
#  [*ensure*] -- sets the availability of the alternative (present|absent)
#
define apt::alternatives ($ensure=present, $link="/usr/bin/${name}", $path, $priority='400') {
  case $ensure {
    present : {
      exec { "update-alternatives --install ${link} ${name} ${path} ${priority}":
        creates => $link,
      }
    }
    absent : {
      exec { "update-alternatives --remove ${name} ${path}":
        onlyif => "test -f ${link}",
      }
    }
    default : {
      fail "(present|absent) not '${ensure}'"
    }
  }
}
