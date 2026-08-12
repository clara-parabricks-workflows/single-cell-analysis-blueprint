#/bin/bash

# Install uv
git clone https://github.com/clara-parabricks-workflows/single-cell-analysis-blueprint.git

curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"
uv --version

# Install all additional libraries
cd /notebooks/single-cell-analysis-blueprint
mamba install -c conda-forge -c rapidsai compilers -y
uv pip install --system -r requirements.txt

set -m

# Set missing env vars, start the primary process, and put it in the background
export CONDA_PREFIX=/opt/conda
jupyter-lab --notebook-dir=/notebooks/single-cell-analysis-blueprint --ip=0.0.0.0 --no-browser --NotebookApp.token='' --NotebookApp.allow_origin='*' --allow-root
