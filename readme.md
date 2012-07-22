# Locations extension for Refinery CMS.

http://github.com/craigambrose/refinerycms-locations

This extension allows you to present a set of marker locations on a google map. Each of these locations displays
some preview information when clicked on, and also a "more detail" link which leads to a unique page for each
location which contains custom html and an image gallery.

The refinerycms-page-images extension is used to provide the admin functionality for attaching a set of images
to each location.

The refinerycms-jquery_gallery extension is used to display the image gallery (using the jQuery gallery view
widget).

## How to build this extension as a gem

    cd vendor/extensions/locations
    gem build refinerycms-locations.gemspec
    gem install refinerycms-locations.gem

    # Sign up for a http://rubygems.org/ account and publish the gem
    gem push refinerycms-locations.gem

## Licence

This code us available under the MIT licence. See attached licence file for full details.
    
## Credits

Craig Ambrose
http://github.com/craigambrose
