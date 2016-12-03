# Docker Hugo

Docker image for hugo static page generator (https://gohugo.io).

## Environment Variables

* HUGO_ARGS - Any set of args that can be passed to hugo

## Executing

A directory is expected to be loaded in `/src`.

To generate your site

```
docker run --rm -v `pwd`:/src jkamenik/hugo
```

To serve the generated site.  Open it at http://localhost

```
docker run --rm -ti -p 80:80 -v `pwd`:/src jkamenik/hugo serve
```
