# Dockerfile para RStudio Server
FROM rocker/rstudio:latest

# Instalar paquetes adicionales del sistema
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    htop \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Instalar paquetes de R comúnmente usados para ML/Data Science
RUN R -e "install.packages(c(\
    'tidyverse', \
    'tidymodels', \
    'modeltime', \
    'xgboost', \
    'here', \
    'nanoparquet', \
    'tktime' \
), repos='https://cran.rstudio.com/')"

# Instalar paquetes de Python para integración
RUN pip3 install --break-system-packages \
    pandas \
    numpy \
    matplotlib \
    seaborn \
    scikit-learn \
    mlflow

# Crear usuario rstudio con configuración personalizada
RUN usermod -aG sudo rstudio && \
    echo "rstudio:rstudio" | chpasswd

# Configurar RStudio Server - Solo configuración básica
RUN echo "www-port=8787" >> /etc/rstudio/rserver.conf

# Configurar directorio de trabajo
WORKDIR /home/rstudio

# Exponer puerto
EXPOSE 8787

# Comando por defecto
CMD ["/init"]