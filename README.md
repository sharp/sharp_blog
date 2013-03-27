
sharp_blog
=========

A Ruby on Rails blogging app for the fashionable developer


Quick Start
=========

```
  git clone git@github.com:SharpV/sharp_blog.git

  cd sharp_blog

  cp config/settings.yml.sample config/settings.yml

  bundle install         

  rake db:schema:load
	
  rails s    

```


About Admin
=========
You need login by social connection to github, you can create oAuth application on github.com, 
then you can modify user model by adding your github username.

```
  def admin?
    self.github_username == 'SharpV'
  end
```


License
=========

GPL(General Public License) - See LICENSE

