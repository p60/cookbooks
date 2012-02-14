maintainer       "Peer Intel"
maintainer_email "jstaten@peerintel.com"
license          "MIT"
description      "Create a site for a unicorn application"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1.0"
recipe           "unicorn_site", "Create an nginx site definition for unicorn"
