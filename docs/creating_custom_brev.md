# Creating a custom GPU instance using Brev
The goal of this guide is to walk through the steps to create a custom GPU instance on NVIDIA Brev using the Brev Launchable interface.

Note, Brev provides access to a wide variety of GPU instances on difference cloud environment. This provides flexibility on pricing and avaiablity, but it means that we cannot test this launchable on every combination of compute environment and cloud environment. As such, some tinkering may be required to get the instance to work on the specific configuration you select. If you want a tested environment that is tested to work, please follow the [Quickstart Instructions](../README.md#quick-start). 

> [!WARNING]  
> The Docker Compose YAML files in this repository are known not to work on GCP resources on Brev. We are investigating, but recommend using another cloud provider for now.

## Option 1 - Create a custom instance using the Brev Launchable Creator

1. Go to [Brev’s Launchable Creator](https://brev.nvidia.com/launchables/create) (requires account)  
2. When asked **How would you like to provide your code files?** select "I have code files in a GitHub repository". Enter the URL of this repository. 
3. When asked **What type of runtime environment do you need?** select "With container(s)"
4. Under **Choose a Container Configuration** select "Docker Compose" and click on the toggle to select "I have an existing docker-compose.yaml file".
5. Under **Upload Docker Compose** select "Provide GitHub/Gitlab URL" and provide a link to one of the Docker Compose YAML files in the [docker/brev](../docker/brev) directory. There is a README.md in that directory with instructions on which YAML to select. Note, you need to pass a link to the file in GitHub, not to the `raw.github.com` file (e.g. [docker-compose-nb-2412.yaml](https://github.com/clara-parabricks-workflows/single-cell-analysis-blueprint/blob/main/docker/brev/docker-compose-nb-2412.yaml)). Click "Validate".
6. On the next page, when asked **Do you want a Jupyter Notebook experience?** select "No, I don't want Jupyter (Not Recommended)". We will provide Jupyter in the Docker compose already.
7. In the section title **Do you need to expose services?** make sure that ports `8888`, `8787`, and `8786` are open. Name port 8888 `jupyter` so Brev can treat it as a jupyterlab based instance and provide an Open Notebook button.
8. Select your desired compute environment. Make sure you select sufficient disk size to download the datasets you want to work with. We recommend at least 128GB. Note, you will not be able to resize the instance once created.
9. Create a name for your launchable, and deploy.

> [!NOTE]
> Git is not installed by default in this container, but it can be installed using
> ```
> apt update
> apt install git -y
> ```

## Option 2 - Install rapids-singlecell manually in a rapids/notebook container

Another option to set up `rapids-singlecell` in a custom Brev instance is to start by [Creating a RAPIDS Brev Instance](https://docs.rapids.ai/deployment/stable/cloud/nvidia/brev/#option-1-setting-up-your-brev-gpu-instance) and then manually downloading the `single-cell-analysis-blueprint` repository and manually installing `rapids-singlecell`.

1. Follow the instructions for [Creating a RAPIDS Brev Instance](https://docs.rapids.ai/deployment/stable/cloud/nvidia/brev/#option-1-setting-up-your-brev-gpu-instance).  Launch the instance.
2. Download this repository into the instance.
3. Download the `rapids-singlecell` repository into the instance. Follow their [installation instructions](https://rapids-singlecell.readthedocs.io/en/latest/Installation.html). Make sure to select the correct version of rapids-singlecell that is comaptiable with your instance. You can check this by running `nvidia-smi` inside the instance. For example, if your CUDA version is 12.8, then you will want to install `rapids-singelcell` using `mamba env create -f conda/rsc_rapids_25.04.yml`
4. Activate the mamba environment and run the notebooks.

