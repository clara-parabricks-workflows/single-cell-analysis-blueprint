
- In **Compute**, remember the GPU requirements when picking an instance
- When adding the **Container**, use Docker Compose.  In most cases, please use the docker-compose file, **[docker/brev/docker-compose-nb-2412.yaml](brev/docker-compose-nb-2412.yaml)** as your base.  You *can* make edits, but will not be a recommended activity.  Instead use and install additional packages using the `requirements.txt` found in this repo as a base.  **Do not** Preinstall Jupyter.
- For **Files**, please clone this repo, or any repo of your choosing
- In **Ports**, please open ports **8888, 8787, and 8786**.  Name port 8888 `jupyter` so Brev can treat it as a jupyterlab based instance and provide an **Open Notebook** button
- Git is not installed in this container, but can be installed into the container when it is running using
```
apt update
apt install git -y
```

Of course, if all you want is to install additional packages, it is easiest to just use the [![ Click here to deploy the RAPIDS Singlecell Launchable.](https://brev-assets.s3.us-west-1.amazonaws.com/nv-lb-dark.svg)](https://nvda.ws/3DzqANc)  and install your additional software from there!