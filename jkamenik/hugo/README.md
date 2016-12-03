# Docker Hugo

Docker image for hugo static page generator (https://gohugo.io).

## Tags and Docker file links

* `0.15`, `latest` ([jkamenik/hugo/0.15/Dockerfile](https://github.com/jkamenik/docker-images/blob/master/jkamenik/hugo/0.15/Dockerfile]))

## Environment Variables

* HUGO_ARGS - Any set of args that can be passed to hugo.  These will completely override the default arguments.

## Executing

A directory is expected to be loaded in `/src`.

To generate your site to `/src/public`

```
docker run --rm -v `pwd`:/src jkamenik/hugo
```

To serve the generated site.  Open it at http://localhost

```
docker run --rm -ti -p 80:80 -v `pwd`:/src jkamenik/hugo serve
```
