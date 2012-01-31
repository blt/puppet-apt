# Puppet control module for Debian APT

This module provides several resources to managing APT related tasks. Available
are:

* apt::preference -- Sets an [apt pin](http://manpages.debian.net/cgi-bin/man.cgi?query=apt_preferences&sektion=5&apropos=0&manpath=Debian+Sid&locale=en) for packages.
* apt::source -- Sets a [source list](http://manpages.debian.net/cgi-bin/man.cgi?query=sources.list&sektion=5&apropos=0&manpath=Debian+Sid&locale=en) value.
* apt::key -- Sets an [apt package key](http://manpages.debian.net/cgi-bin/man.cgi?query=apt-key).

Each resource is well-documented. Please review the source if you have any
questions and take out an issue if you've a question unanswered by meditation.
