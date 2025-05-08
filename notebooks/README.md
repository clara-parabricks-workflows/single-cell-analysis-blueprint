# Detailed Overview of the Notebooks



### **Notebook 01_scRNA_analysis_preprocessing.ipynb: Basic Demo Workflow**

By the completion of this notebook, a user will be able to do the following:

- Load and Preprocess the data
    - Load a sparse matrix in h5ad format using Scanpy
    - Preprocess the data, implementing standard QC metrics to assess cell and gene quality per cell, as well as per gen

- QC cells visually to understand the data
    - Users will learn how to visually inspect 5 different plots that help reflect quality control metrics for single cell data to:
        - Identify stressed or dying cells undergoing apoptosis
        - Empty droplets or dead cells
        - Cells with abnormal gene counts
        - Low quality or overly dominant cells

- Filter unusual cells
    - Users will learn how to remove cells with an extreme number of genes expressed
    - Users will filter out cells with an unusual amount of mitochondrial content

- Remove unwanted sources of variation
    - Select most variable genes to better inform analysis and increase computational efficiency
    - Regress out additional technical variation that we observed in the visual plots (Note, this can actually remove biologically relevant information, and would need to be carefully considered with a more complex data set)
    - Standardize by using a z-score transformation

- Cluster and visualize data
    - Implement PCA to reduce computational complexity. We use the GPU-accelerated PCA implementation from cuML, which significantly speeds up computation compared to CPU-based methods.
    - Identify batch effects visually by generating a UMAP plot with graph-based clustering

- Batch Correction and analysis
    - Remove assay-specific batch effects using Harmony
    - Re-compute the k-nearest neighbors graph and visualize using the UMAP.
    - Perform graph-based clustering
    - Visualize using other methods (tSNE)

- Explore the biological information from the data
    - Differential expression analysis: Identifying marker genes for cell types
        - Implement logistic regression
        - Rank genes that distinguish cell types
    - Trajectory analysis
        - Implement a diffusion map to understand the progress of cell types

### **Notebook 02_scRNA_analysis_extended.ipynb - Decoupler-GPU: Accelerated Transcriptional Regulatory Analysis**

This is an overview of methods that can be used to investigate transcriptional regulation. Although the tutorial does not dive deeply into these models, the notebook is used to reflect a difference in speed that is benefitted by GPU.

### **Notebook 03_scRNA_analysis_with_pearson_residuals.ipynb - A different way to normalize with Pearson Residuals**

By the completion of this notebook, a user will be able to remove unwanted sources of variation using Pearson Residuals to normalize. This is a different approach to analysis from Notebook 01. After filtering, we introduce a normalization step toa address the potential issues in how we previously removed unwanted sources of variation.



### **Notebook 04_scRNA_analysis_dask_out_of_core.ipynb - Scale analysis to 11M cells easily and quickly leveraging Dask**

By the completion of this notebook, a user will be able to do the following:
- Create a local DASK cluster
- Load data directly into an AnnData object using a Dask array
- Filter cells and genes without additional computation
- Log normalize the data and identify highly variable genes
- Scale gene expression
- Compute PCA using GPU acceleration

### **Notebook 05_scRNA_analysis_multi_GPU.ipynb - Multi-GPU showcase using persist**

By the completion of this notebook, a user will be able to perform the same steps as Notebook 05, but with the following:
- Process massive single-cell datasets without exceeding memory limits
- Fully utilize all available GPUs, scaling performance across multiple devices
- Enable chunk-based execution, efficiently managing memory by loading only necessary data

### **Notebook 06_scRNA_analysis_90k_brain_example.ipynb - End to end example on Brain Cells**

By the completion of this noteobok, a user will be able to perform similar steps to Notebook 01 (end to end demo) but on brain cells.

### **Notebook 07_scRNA_analysis_1.3M_brain_example.ipynb - End to end example on 1M Brain Cells**

By the completion of this noteobok, a user will be able to perform similar steps to demo_gpu-seuratv3 but on 1M brain cells.

### **Notebook 08_spatial_analysis_autocorrelation.ipynb - Visualizing and investigating spatial transcriptomics data**

By the completion of this notebook, a user will be able to do the following:
- Compute spatial autocorrelation, which represents how gene expression levels are spatially distributed across tissue sections.
- Use Squidpy to compute a graph on the coordinates
- Compute two metrics using Moran's I (better for global structures) and Geary's C (better for local structures)
- Explore the results visually by plotting the expression of genes Mbp (myelin-associated) and Nrgn (neuronal marker)