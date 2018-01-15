### CMS

#### Install
##### require
* Postgresql, Elasticsearch, Ruby

* `git clone https://github.com/clay-f/blog.git` to local machine
* cd blog directory run `bundle install`
* `rake db:create`
* `rake db:migrate`
* `rake db:seed`
* `rails s`
* Open browser go to `http://localhost:3000`

#### Data model
* Uesr
* Catalog
* Article
* Comment
* Message
* MessageState

### todo
* try add send message between users
* update index page
* add suggest post on show page
* add ajax
