# quimbydogg-overlay
Personal overlay for packages not in official Gentoo repos or major overlays.  Might add ebuilds from other overlays if I only want one or a few packages from it for my systems.  Primarily put together to have mopidy-spotify w/ Search and Playlists easily installable on Gentoo systems.  Has expanded to also having the naga trinity testing branch of openrazer.  Learning how ebuilds and overlays work.  You probably don't want to use this unless you have no other option.

To add with layman:

# layman -o https://raw.githubusercontent.com/quimbydogg/quimbydogg-overlay/master/quimbydogg.xml -f -a quimbydogg

You can sync/update the overlay with:

# layman -S

There will be a warning when you sync overlays since this overlay is not part of the default overlay list used by layman.

If you try to emerge less (necessary for polychromatic) dev-nodejs will probably need added to your portage categories file if it hasn't been already:

# echo "dev-nodejs" >> /etc/portage/categories
