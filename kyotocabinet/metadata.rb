maintainer       "Peer Intel"
maintainer_email "jstaten@peerintel.com"
license          "MIT"
description      "Installs Kyoto Cabinet"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "1.2.70"
recipe           "kyotocabinet", "Installs Kyoto Cabinet from source"

depends          "build-essential"
