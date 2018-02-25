# README

Inspired by socialization gem I have created the same functionality using my very own code

in this application I have created User and Post so User can mention another user in a post using the Post model

```
creator   = User.create(name: 'Post creator')
mentioned = User.create(name: 'Mention me')
post      = post.create(title: 'whatever', user: creator)
post.mention!(creator, mentioned)
# And now a mention is created
```

taggable will work in the same way but you tag another person in a post without specifying the tagger

* Ruby version
    2.4.1

* System dependencies

* Configuration
    - postgresql database is needed

* Database creation
    ```
    rake db:create
    ```

* Database initialization
    ```
    rake db:migrate
    ```

* How to run the test suite
    ```
    rspec
    ```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
    - I have tested this app only over rails console

* ...
