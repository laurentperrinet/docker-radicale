Radicale Dockerfile
===================

This repository contains **Dockerfile** of [Radicale][] for [Docker][]’s
[automated build][] published to the public [Docker Hub Registry][].

Base Docker Image
-----------------

-   [Official Fedora 21 image][]

Installation
------------

1.  Install [Docker][].
2.  Download [automated build][] from public [Docker Hub Registry][]:
    docker pull nott/radicale

Usage
-----

    docker run -d -p 5232:5232 nott/radicale

User database
-------------

This image's default configuration uses htpasswd file for storing user databases. Each user has access to his own data only. One can use username `anonymous` with an empty password by default.

You can create your own user database using `htpasswd` utility (it's a part of Apache2 distribution):

    htpasswd -s -c {/path/to/mydb.htpasswd} {user1}
    htpasswd -s {/path/to/mydb.htpasswd} {user2}
    htpasswd -s {/path/to/mydb.htpasswd} {user2}

Than you can run instance of Radicale:

    docker run -d -p 5232:5232 -v {/path/to/mydb.htpasswd}:/data/users nott/radicale

Attach volumes
--------------

Please attach persistant storage for collections directory:

    docker run -d -p 5232:5232 -v {collections-dir}:/data/collections nott/radicale

After few seconds, open http://{host}:5232/{userX}.

  [Radicale]: http://radicale.org/
  [Docker]: https://www.docker.com/
  [automated build]: https://registry.hub.docker.com/u/nott/radicale/
  [Docker Hub Registry]: https://registry.hub.docker.com/
  [Official Fedora 21 image]: https://github.com/fedora-cloud/docker-brew-fedora/

