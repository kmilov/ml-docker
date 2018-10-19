# Up and run

```
$ docker build -t ml -f docker .
$ docker run -i -t -p 8888:8888 -v /host/folder/to/sahre:/root/shared ml /bin/bash
$ docker start -i ml # open a previous container
```
