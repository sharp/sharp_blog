
### sharp_blog


A Ruby on Rails blogging app for the fashionable developer


### Quick Start


```

  brew install wkhtmltopdf

  git clone git@github.com:SharpV/sharp_blog.git

  cd sharp_blog

  cp config/settings.yml.sample config/settings.yml

  bundle install         

  bundle exec rake db:create

  bundle exec rake db:migrate
	
  rvmsudo rails s -p 80
```

You can access in local at http://yourdomain.dev


### About Admin

You can login only by social connection with github, and you could create oAuth application on github.com, 

then add your github username to config/settings.yml.

```
  github_username: 'your username'
```


### License

GPL(General Public License) - See LICENSE

