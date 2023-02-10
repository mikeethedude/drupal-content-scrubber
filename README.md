# drupal-content-scrubber
Want all of the content gone? This will remove it.

## Usage

- Either copy the content_scrubber.sh code into your local repository or use clone this repository somewhere locally.
- The script takes one argument and that is the drush sql:query command and how to run it. Ex: `./content_scrubber "lando drush sql:query"` or `./content_scrubber "terminus remote:drush site.env -- sql:query"`

This will delete some standard tables and some other specific tables. It doesn't clear field tables or anything else so if you really want that it will have to be edited to include the other tables you want.
