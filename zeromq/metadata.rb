maintainer       "Peer Intel"
maintainer_email "jstaten@peerintel.com"
license          "MIT"
description      "Installs ZeroMQ"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "2.1.11"
recipe           "zeromq", "Installs ZeroMQ from source"

depends          "build-essential"
