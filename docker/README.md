# Build Docker Image

Docker images are used by the CI and release script. Make sure to install necessary
requirements in it.

## To build

Replace the `myapp` with your app name.

```bash
docker build -t dgllib/myapp-ci-cpu:latest -f Dockerfile.ci_cpu .
```

```
docker build -t dgllib/myapp-ci-gpu:latest -f Dockerfile.ci_gpu .
```

## To push

```bash
docker push dgllib/myapp-ci-cpu:latest
```

```bash
docker push dgllib/myapp-ci-gpu:latest
```
