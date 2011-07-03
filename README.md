# TunnelVission!

## What is it?

Simple tool which lets you create definitions of ssh tunnels your project will need.

Then you by issuing one command you can open all of them and carry on with your work.

### Scratching an itch:

I find myself working remotely and/or changing machines more often than I could imagine.

Because at my day job I'm working only on a part of a big system I need to maintain connectivity of my development environment with other services by using SSH tunnels.

At worst I need 4 tunnels for my dev setup to be usable. *sigh*

So far I've been maintaining a set of different shell scripts which helped me establish SSH tunnels to different servers and such.

TunnelVision solves that problem.


### Inspired by

- [takeup by Maxim Chernyak](https://github.com/maxim/takeup)
- [foreman by David Dollar](https://github.com/ddollar/foreman)


# Installation

`gem install tunnel_vision`

# Usage

- `tunnelvision` - shows simple help
- `tunnelvision generate` - generates example `tunnels.yaml` file
- `tunnelvision start` - opens all tunnels defined in `tunnels.yaml`
- `tunnelvision status` - shows information about opened tunnels
- `tunnelvision stop` - closes all opened tunnels defined by `tunnels.yaml`

### Requirements

- `ruby 1.8.7` (probably works with 1.9.2)
- OpenSSL support enabled in Ruby (OSX comes with that, Linux needs ruby-openssl package)
- `net-ssh` gem (gets installed with TunnelVission)

## Important!

You need to set up ssh-key based authentication before using TunnelVision. While it's possible to use passwords straight from `tunnels.yaml` it's horribly insecure!

You should always use ssh keys anyway.

### Bugs?

Yeah, plenty.

This gem was created in few hours, so it has few things which can explode. I will hunt them down.

## Todo

- colors

# Licence

TunnelVision is a product of Łukasz Korecki (lukasz@coffeesounds.com)

Licenced under MIT Licence
