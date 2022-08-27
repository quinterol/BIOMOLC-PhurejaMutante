# Análisis de Mutantes Sólidos de Solanum Tuberosum Gr. Phureja
___

[![DOI](https://zenodo.org/badge/525475132.svg)](https://zenodo.org/badge/latestdoi/525475132)
[![opensource](https://badges.frapsoft.com/os/v1/open-source.png?v=103)](#)
[![GitHub issues](https://img.shields.io/github/issues/quinterol/BIOMOLC-PhurejaMutante)](https://github.com/quinterol/BIOMOLC-PhurejaMutante/issues)
![Contributions welcome](https://img.shields.io/badge/contributions-welcome-blue.svg)
[![GitHub license](https://img.shields.io/github/license/quinterol/BIOMOLC-PhurejaMutante)](https://github.com/quinterol/BIOMOLC-PhurejaMutante/blob/main/LICENSE)

![Image Link](https://github.com/quinterol/BIOMOLC-PhurejaMutante/blob/main/docs/banner.png)

## Instalación
- Las dependencias necesarias para hacer uso del pipeline.

    ```sh
    make install
    ```
## Uso
El uso se explica a mas detalle en la documentación pero al hacer uso de **make** se puede acceder a todas las opciones.

- Limpieza y Filtrado

    ```sh
    make trim
    ```
- DEA: Análisis de Expresión Diferencial

    ```sh
    make dea
    ```
- SNPs: Llamado de variantes

    ```sh
    make snp
    ```