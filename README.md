## Welcome to ModulaRails

I've never been keen on the Rails way of organising files by type as opposed to resource/feature/behaviour.  It's obviously not a huge issue, but as your app gets larger, it becomes harder to find related files.

This is an attempt to get away from the Rails standard of grouping all models together, all controllers together, etc.  In your average Rails project each file _type_ is already distinguished either by the name ("_controller.rb" or "_helper.rb") or by the extension ("haml", "coffee").  When you're working on a particular feature, you're much more likely to want files related to that feature to be grouped together.

This is the likely app directory structure of a Rails app with User and Project resources:

         -- app
            |-- assets
            |   |-- javascripts
            |   |   |-- projects.js.coffee
            |   |   `-- users.js.coffee
            |   `-- stylesheets
            |       |-- projects.css.scss
            |       `-- users.css.scss
            |-- controllers
            |   |-- projects_controller.rb
            |   `-- users_controller.rb
            |-- helpers
            |   |-- projects_helper.rb
            |   `-- users_helper.rb
            |-- models
            |   |-- project.rb
            |   `-- user.rb
            `-- views
                |-- projects
                |   |-- _form.html.erb
                |   |-- edit.html.erb
                |   |-- index.html.erb
                |   |-- new.html.erb
                |   `-- show.html.erb
                `-- users
                    |-- _form.html.erb
                    |-- edit.html.erb
                    |-- index.html.erb
                    |-- new.html.erb
                    `-- show.html.erb

There's at least 6 different folders that each resource has pieces in.  This is one way we could make the structure more meaningful:

         -- app
            |-- projects
            |   `-- assets
            |   |   |-- projects.css.scss
            |   |   `-- projects.js.coffee
            |   |-- views
            |   |   |-- _form.html.erb
            |   |   |-- edit.html.erb
            |   |   |-- index.html.erb
            |   |   |-- new.html.erb
            |   |   `-- show.html.erb
            |   |-- project.rb
            |   |-- projects_controller.rb
            |   `-- projects_helper.rb
            `-- users
                `-- assets
                |   |-- users.css.scss
                |   `-- users.js.coffee
                |-- views
                |   |-- _form.html.erb
                |   |-- edit.html.erb
                |   |-- index.html.erb
                |   |-- new.html.erb
                |   `-- show.html.erb
                |-- user.rb
                |-- users_controller.rb
                `-- users_helper.rb

### So how does it work?

There's surprisingly not a lot to it.  All of the interesting stuff happens in [d67c03b5](https://github.com/tjmcewan/modularails/commit/d67c03b58d36ce99c320ca5594ba89c4dad36414).  An initializer sets a few non-standard paths & tells the controllers where to find our view using a slightly altered resolver pattern.  Rails autoloads all the .rb files, so those all work without any other changes.  It's pretty impressive that Rails is this flexible.

### TODO

- relationships
- namespacing
- application level stuff
- delete app/models, app/controllers, etc. :scream:


Please let me know if you have any comments or know of any pitfalls.

Thanks!
