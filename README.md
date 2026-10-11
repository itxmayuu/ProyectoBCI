# Decodificación de Estímulos Visuales a partir de Señales EEG (BCI)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![MATLAB](https://img.shields.io/badge/Platform-MATLAB%20%7C%20Python-orange.svg)]()
[![Dataset](https://img.shields.io/badge/Dataset-MindBigData%202022-blue.svg)](https://mindbigdata.com/opendb/visualmnist.html)

Proyecto de investigación enfocado en la clasificación multiclase de estímulos visuales (dígitos MNIST manuscritos del 0 al 9) a partir de registros electroencefalográficos (EEG) no invasivos capturados con el dispositivo comercial **Interaxon Muse 2**.

---

## 👥 Autores
* **Maria Sepulveda** — *mysepulvedab@udistrital.edu.co*
* **Martin Gil** — *mfgilq@udistrital.edu.co*

*Universidad Distrital Francisco José de Caldas*  
*Facultad de Ingeniería*

---

## 📌 Descripción del Proyecto

Las Interfaces Cerebro-Computadora (BCI) buscan traducir la actividad electrofisiológica del cerebro en comandos computacionales. Este estudio aborda el problema de la **inseparabilidad lineal**, la alta estocasticidad y la baja relación señal-ruido en bioseñales cerebrales mediante un análisis comparativo de arquitecturas de redes neuronales:

1. **Perceptrón Multicapa (MLP):** Modelo base de aproximación global mediante hiperplanos sobre características espectrales (FFT).
2. **Red de Función de Base Radial (RBF):** Modelo de aproximación local mediante agrupamiento geométrico y campos receptivos gaussianos.
3. **Red Neuronal Convolucional (CNN):** Extracción jerárquica de características espaciotemporales sobre espectrogramas 2D.

### Corpus de Datos: MindBigData 2022 (Visual MNIST)
* **Hardware:** Diadema comercial Muse 2 (electrodos: `TP9`, `AF7`, `AF8`, `TP10`; frecuencia de muestreo $f_s = 256\text{ Hz}$).
* **Ventanas de tiempo:** Ensayos de 2 segundos ($512$ muestras por canal).
* **Variantes evaluadas:**
  * **Full:** ~72,000 ensayos (4 canales; alto ruido de parpadeo ocular en canales frontales).
  * **Cut2:** 11,387 ensayos depurados (solo canales temporales `TP9` y `TP10`, minimizando artefactos de parpadeo EOG).
  * **Cut3:** 1,186 ensayos restringidos (`TP9`, `AF7`, `TP10`), empleado para validación rápida de prototipos.

---

## 📂 Estructura del Repositorio

```text
ProyectoBCI/
│
├── .gitignore                   <- Reglas de exclusión para datos pesados y temporales
├── README.md                    <- Portada, autores, resumen y descripción del proyecto
├── LICENSE                      <- Licencia de código abierto MIT
│
├── data/                        <- Gestión local de datos (Ignorado en Git)
│   ├── raw/                     <- Archivos crudos (MindBigData .txt, fuentes externas)
│   └── processed/               <- Matrices procesadas (.mat)
│
├── src/                         <- Código fuente modular
│   ├── 01_eda/                  <- Análisis exploratorio de datos (EDA) y gráficos
│   ├── 02_preprocessing/        <- Filtrado (Butterworth 0.5-45 Hz), Z-Score y FFT
│   └── 03_models/               <- Entrenamiento, validación y evaluación de modelos (MLP)
│
├── results/                     <- Salidas generadas
│   ├── figures/                 <- Gráficos exportados (dispersiones, ERP, espectrogramas)
│   └── metrics/                 <- Matrices de confusión, tablas CSV y reportes
│
└── docs/                        <- Documentación, propuestas y artículos
    └── entrega_1/               <- Propuesta base y presentación del proyecto
