#!/usr/bin/env bash

REPODIR=`git rev-parse --show-toplevel`

cd $REPODIR

# Settings
handlebars -n OC.Settings.Templates  settings/js/authtoken.handlebars -f settings/js/templates.js

# Contactsmenu
handlebars -n OC.ContactsMenu.Templates core/js/contactsmenu -f core/js/contactsmenu_templates.js

# Systemtags
handlebars -n OC.SystemTags.Templates core/js/systemtags/templates -f core/js/systemtags/templates.js

# Files app
handlebars -n OCA.Files.Templates apps/files/js/templates -f apps/files/js/templates.js

# Comments app
handlebars -n OCA.Comments.Templates apps/comments/js/templates -f apps/comments/js/templates.js


if [[ $(git diff --name-only) ]]; then
    echo "Please submit your compiled handlebars templates"
    echo
    git diff
    exit 1
fi


echo "All up to date! Carry on :D"
exit 0
