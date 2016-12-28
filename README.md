# Docker Image - Hugo - Debian

This is a Docker base image made to easy use the static site generator [Hugo](https://gohugo.io/) to write contents.
This image can't work as a stand-alone neither as a volume image for your web server.

Considering your hugo project follow the default directory structure:

```
├── archetypes
├── config.yaml
├── content
├── ...
├── public
├── static
└── themes
```

Based on this structure, you can easily launch instance in watch mode. Contents will be available on http://localhost:1313:

## Watch mode

```
docker run \
  --rm \
  --volume `pwd`:/srv \
  --env HOME=/srv \
  --user `id -u` \
  --tty -i \
  --publish 1313:1313 \
  manala/hugo-debian \
  hugo server --bind=0.0.0.0 --theme=XXXX --config=config.yaml --buildDrafts --watch --ignoreCache=true
```

## Building the site

If you just need to build your files, the following command will launch Hugo build process (builded files are in `static` directory).

```
docker run \
  --rm \
  --volume `pwd`:/srv \
  --env HOME=/home \
  --user `id -u` \
  --tty \
  manala/hugo-debian \
  bash -c "\
    hugo --theme=XXXX --config=config.yaml \
  "
```

## Embedded tools (Images optimization):

- optipng
- imagemagick
- libjpeg-turbo-progs

You can have a look on the [changelog](CHANGELOG.md) for further informations
