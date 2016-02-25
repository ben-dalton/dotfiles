#Dotfiles

My dotfiles for use with [Homesick](https://github.com/technicalpickles/homesick)

To get started, install homesick first:

    gem install homesick

Next, you use the homesick command to clone a castle:

    homesick clone git://github.com/ben-dalton/dotfiles.git

Alternatively, if it's on github, there's a slightly shorter way:

    homesick clone ben-dalton/dotfiles

With the castle cloned, you can now link its contents into your home dir:

    homesick symlink dotfiles

You can remove symlinks anytime when you don't need them anymore

    homesick unlink dotfiles
