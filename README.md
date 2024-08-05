# deface_gpu_docker
Docker environment for deface
https://github.com/ORB-HD/deface

## Usage
### Docker build

```shell
make build
```

### Docker run and use deface

- Store your video to the video directory.

- Docker run

```shell
make run
```
- After entering the shell, execute deface

```shell
deface <your-video-name>
```

Then anonymized video is generated in the video directory.

