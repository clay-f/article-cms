### Test blog
> this is test blog

#### Install
##### require
* Postgresql, Elasticsearch, Ruby

* `git clone https://github.com/clay-f/blog.git` to local machine
* cd blog directory run `bundle install`
* `rake db:create`
* `rake db:migrate`
* `rake db:seed`
* `rails s`

#### Data model

* Uesr
* Catalog
* Article
* Comment
* Message
* MessageState

#### blog module

* user-article-comment
* user-message