# Docker file to create image for radipop

FROM jupyter/datascience-notebook:04f7f60d34a6


LABEL version="0.0.3"
LABEL description="Docker instance for radipop"
LABEL maintainer="csin@cemm.oeaw.ac.at"

USER root
RUN apt-get update

# for data manipulation
RUN pip install openpyxl

# for pretty figures
RUN pip install matplotlib==3.1.1 palettable
COPY fonts /usr/share/fonts/truetype/
RUN fc-cache -fv
RUN rm /home/jovyan/.cache/matplotlib -rf

# for image analysis
RUN pip install pyradiomics==3.0.1
RUN pip install combat==0.3.0
RUN pip install scikit-learn==0.22.2.post1 numba==0.48.0
RUN pip install holoviews==1.14.3
RUN pip install llvmlite --ignore-installed
RUN pip install umap-learn==0.4.5 
RUN pip install umap-learn[plot]

RUN sudo apt-get install -y plastimatch
RUN pip install --upgrade nbconvert
RUN pip install pynrrd==0.4.2

# cox
RUN pip install lifelines==0.27.1

# for tables (pandas problem)
RUN pip install zentables==0.2.3
