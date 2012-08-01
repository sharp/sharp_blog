
sharp_blog
=========

A Ruby on Rails blogging app for the fashionable developer


Quick Start
=========

  git clone git://github.com/liuqiang/sharp_blog.git

  cd sharp_blog

  bundle install         # Install all the required gems

  # Next step needs libxml2 and libxslt1 and their headers
  # On Debian-based systems: apt-get install libxml2-dev libxslt1-dev
  # On Mac OS X: no action required

  rake db:migrate
	
	cp config/settings.yml.sample config/settings.yml
	
	rails s    # Start the server


License
=========

GPL(General Public License) - See LICENSE

