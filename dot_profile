# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


export EDITOR=vim
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DESKTOP_DIR=$HOME/Desktop
export XDG_DOWNLOAD_DIR=$HOME/Downloads
export XDG_DOCUMENTS_DIR=$HOME/Documents
export XDG_MUSIC_DIR=$HOME/Music
export XDG_PICTURES_DIR=$HOME/Pictures
export XDG_VIDEOS_DIR=$HOME/Videos
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export GO111MODULE=on
# Ubuntu make installation of Ubuntu Make binary symlink
PATH=$HOME/.cargo/bin:$HOME/bin:$HOME/.anyenv/bin:$HOME/.local/share/umake/bin:/usr/local/go/bin:/usr/local/gradle/bin:$HOME/.pyenv/bin:/usr/local/gatling/bin:$PATH
export WINEARCH=win32


# BEGIN_DOCKER_CONFIG
export DOCKER_HOST=unix:///run/user/1000/docker.sock
# END_DOCKER_CONFIG



if [ -e "$HOME/.local_profile" ] ; then
		source $HOME/.local_profile
fi
