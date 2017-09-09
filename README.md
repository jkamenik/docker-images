# docker-images

A collection of my public docker images that get pushed to Dockerhub.

## Build

```
$ docker login
$ git clone git@github.com:jkamenik/docker-images.git
$ cd docker-images
$ build.sh
```

This will build any non-existing images and push them to Dockerhub.