
sharp_blog
=========

A Ruby on Rails blogging app for the fashionable developer


Quick Start
=========

```
  git clone git://github.com/liuqiang/sharp_blog.git

  cd sharp_blog

  bundle install         

  rake db:schema:load
	
	cp config/settings.yml.sample config/settings.yml
	
	rails s    # Start the server

```


About Admin
=========
You need connet to github, you can create application on github.com, 
then you can modify user model by adding your github username.

```
  def admin?
    self.github_username == 'SharpV'
  end
```


License
=========

GPL(General Public License) - See LICENSE

