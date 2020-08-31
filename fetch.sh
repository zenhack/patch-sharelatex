#!/usr/bin/env sh

set -euo pipefail
wget \
	https://app-index.sandstorm.io/packages/2b8bed9eaf25eba7953ea788daccd634 \
	-O sharelatex-old.spk
mkdir -p cdn-vendor/font-awesome/4.2.0/css/
mkdir -p cdn-vendor/font-awesome/4.2.0/fonts/
mkdir -p cdn-vendor/fonts.gstatic.com/s/opensans/v17
mkdir -p cdn-vendor/fonts.gstatic.com/s/ptserif/v11
(
	cd cdn-vendor/font-awesome/4.2.0/css/
	wget \
		'https://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'
)
(
	cd cdn-vendor/font-awesome/4.2.0/fonts
	wget \
		'https://netdna.bootstrapcdn.com/font-awesome/4.2.0/fonts/fontawesome-webfont.eot?v=4.2.0' \
		-O fontawesome-webfont.eot
	wget \
		'https://netdna.bootstrapcdn.com/font-awesome/4.2.0/fonts/fontawesome-webfont.woff?v=4.2.0' \
		-O fontawesome-webfont.woff
	wget \
		'https://netdna.bootstrapcdn.com/font-awesome/4.2.0/fonts/fontawesome-webfont.ttf?v=4.2.0' \
		-O fontawesome-webfont.ttf
	wget \
		'https://netdna.bootstrapcdn.com/font-awesome/4.2.0/fonts/fontawesome-webfont.svg?v=4.2.0#fontawesomeregular'  \
		-O fontawesome-webfont.svg
)
(
	cd cdn-vendor/fonts.gstatic.com/s/opensans/v17
  	wget https://fonts.gstatic.com/s/opensans/v17/mem5YaGs126MiZpBA-UN_r8OUuhs.ttf
	wget https://fonts.gstatic.com/s/opensans/v17/mem8YaGs126MiZpBA-UFVZ0e.ttf
	wget https://fonts.gstatic.com/s/opensans/v17/mem5YaGs126MiZpBA-UNirkOUuhs.ttf
	wget https://fonts.gstatic.com/s/opensans/v17/mem5YaGs126MiZpBA-UN7rgOUuhs.ttf
)
(
	cd cdn-vendor/fonts.gstatic.com/s/ptserif/v11
	wget https://fonts.gstatic.com/s/ptserif/v11/EJRVQgYoZZY2vCFuvAFWzro.ttf
  	wget https://fonts.gstatic.com/s/ptserif/v11/EJRSQgYoZZY2vCFuvAnt66qSVy4.ttf
)

