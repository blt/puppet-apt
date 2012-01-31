# A control module for Debian's apt.
#
# Being able to trigger apt specific functionality from Puppet is commonly
# useful. This module provides:
#
#  * apt::source -- Defines or removes apt source lists.
#  * apt::key -- Sets and removes apt package signing keys.
#  * apt::preference -- Defines apt pinning preferences.
#
# Please see the individual modules for more details.
#
class apt {
  # When a new source is added apt-get update (or similar) has to be run to
  # update the package index. Rather than force the user to cobble this together
  # I've made sure that the file below will force this to be done. _Only_
  # executes if invoked by a notification.
  exec { 'apt-get update':
    refreshonly => true,
  }
}
