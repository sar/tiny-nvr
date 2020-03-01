# TinyNVR
## Containerized RTSP stream recorder with time segmentation and cleanup helpers.
----

### Deployment

Rolling your own image can be performed using the `build.sh` script with parameters read on execution.

To create a downstream container, use the `compose.yaml` file.

```bash
$ docker-compose -f ./compose.yaml up --no-start
$ docker ps -a | head -n 2
$ read -p 'Set container id: ' container_id
$ docker-compose start ${container_id}
$ docker-compose logs -f ${container_id}
```

```
docker run \
       -v $(pwd):/usr/data/recordings \
       -e TZ=America/Chicago \
       hpaolini/tiny-nvr \
       rtsp://username:password@address:port//Streaming/Channels/2 \
       my_camera
```

### Environment Variables

| ENV                | Default       | Description |
| :----------------- | :----         | :------ |
| TZ                 | _Europe/Rome_ | timezone data |
| DIR_NAME_FORCE     | _false_       | use the folder name you pass as parameter during `docker run` even if it exists, otherwise it generates a new folder name |
| HOUSEKEEP_ENABLED  | _true_        | cron job to delete old recordings |
| HOUSEKEEP_DAYS     | _3_           | delete files older than this number of days, if HOUSEKEEP_ENABLED is enabled|
| VIDEO_SEGMENT_TIME | _900_         | seconds of each recording[^1] |
| VIDEO_FORMAT       | _mp4_           | save output as MKV or MP4 file |

* * * 

### License

This project is a fork of [Github/hpaolini/tinynvr]() repository created under MIT license.