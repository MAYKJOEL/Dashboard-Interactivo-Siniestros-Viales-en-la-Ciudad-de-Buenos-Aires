
# Hola, soy Mayk! 👋



# Proyecto de Análisis de Datos: Siniestros Viales en la Ciudad de Buenos Aires
¡Bienvenidos al segundo proyecto individual de la etapa de labs! En esta ocasión, asumiré el rol de un Data Analyst, trabajando en un proyecto crucial para abordar la problemática de los siniestros viales en la Ciudad de Buenos Aires.

![Logo](https://www.seguridadvialenlaempresa.com/media/publicaciones-recursos/invertir-seguridad-vial-laboral-768x520-1.jpg)

## Descripción del Problema y Contexto
Los siniestros viales son una preocupación importante en cualquier ciudad, y Buenos Aires no es una excepción. Estos incidentes pueden tener consecuencias devastadoras, desde daños materiales hasta lesiones graves o fatales. En Argentina, los siniestros viales representan una de las principales causas de muerte, con miles de personas falleciendo cada año.

El Observatorio de Movilidad y Seguridad Vial (OMSV) nos ha encomendado la tarea de analizar los datos de siniestros viales en la Ciudad de Buenos Aires con el objetivo de proporcionar información que permita tomar medidas para reducir la cantidad de víctimas fatales.

### Propuesta de Trabajo y Entregables
**Exploratory Data Analysis (EDA):** Se realizará un análisis exploratorio de los datos, documentando cada paso y conclusiones en un notebook. Se prestará especial atención a la identificación de valores faltantes, valores atípicos y duplicados.

**Dashboard Interactivo:** Se creará un dashboard interactivo que permita explorar detalladamente los datos, con filtros y gráficos claros y coherentes que faciliten la interpretación de la información.

**Análisis y Conclusiones:** No solo se producirán gráficos, sino que también se extraerán análisis y conclusiones significativas a partir de ellos.

**KPIs:** Se medirán y graficarán los dos KPIs propuestos para reducir la tasa de homicidios en siniestros viales y la cantidad de accidentes mortales de motociclistas, además de proponer y medir un tercer KPI relevante.


## Implementación del Proyecto
El sistema está implementado en las herramientas de **Python**, **MySQL** y **PowerBI**.

**Extracción de datos:** Se extrajo los datos de un (1) archivo xlsx descargado de la web de [buenosaires.gob](https://data.buenosaires.gob.ar/dataset/victimas-siniestros-viales). Se guardó en formato CSV para su futuro procesamiento y análisis.
 
* [Web](https://data.buenosaires.gob.ar/dataset/comunas)
* [Archivo](https://github.com/MAYKJOEL/Dashboard-Interactivo-Siniestros-Viales-en-la-Ciudad-de-Buenos-Aires/blob/main/0-DATA/homicidios.xlsx)

**ETL:** Se procedió con el proceso de limpieza de los datos. Se unió las dos hojas del exel por la columna `Id` y se procedió a eliminar columnas duplicadas y de no interes para el proyecto, ademas se de remmplazar valores nulos, vacios y sin dato 'SD' con valores estadísticos.

**WEBSCRAPING:** Se procedió con el proceso de tres (3) WebScraping ya que teníamos la columna [comunidades](https://buenosaires.gob.ar/jefaturadegabinete/atencion-ciudadana-y-gestion-comunal/gestion-comunal/comunas) y no sabíamos sus nombres y links de fotografías. También se realizó mediante el uso de las coordenadas el scrapeo de la zona donde se produjo el siniestro vial, obteniendo los nombres de los [barrios](https://datosabiertos-usig-apis.buenosaires.gob.ar/datos_utiles) y el tercer scrapeo en [Wikipedia](https://es.wikipedia.org/wiki/Buenos_Aires#:~:text=3%20121%20707%E2%80%8B%20hab.) para obtener la población de Buenos Aires Anualmente.

![image](https://github.com/MAYKJOEL/Dashboard-Interactivo-Siniestros-Viales-en-la-Ciudad-de-Buenos-Aires/blob/main/8-FOTOS/WS%20comunas.png)

**EDA:** Se procedió con el proceso de análisis de los datos. Se analizó a detalle cada columna y la relación entre ellas para obtener la máxima información e interpretar lo que los datos nos quieren contar. Además, se analizaron valores atípicos, estadísticos y de correlación.

**Machine Learning:** Se procedió a construir un modelo que nos permitiera obtener la población de los años 2016 hasta 2021, lo cual no se logró ya que el número de datos era pequeño. Esto se debe a que no existen esos datos en ningún portal, solo datos de los años 2010 y 2022 de Wikipedia. Para solucionarlo, asumimos un crecimiento lineal de la población y aumentamos [aritmeticamente](https://github.com/MAYKJOEL/Dashboard-Interactivo-Siniestros-Viales-en-la-Ciudad-de-Buenos-Aires/blob/main/4-ML/ML_BBDDpoblacion.ipynb) el número de personas desde 2010 al 2022, pudiendo obtener los datos de los años requeridos. 

**KPI:** Se procedió a la creación de 3 DataFrames para el cálculo de los [Indicadores Clave de Desempeño](https://github.com/MAYKJOEL/Dashboard-Interactivo-Siniestros-Viales-en-la-Ciudad-de-Buenos-Aires/blob/main/5-KPI/CuadrosKPI.ipynb)

**MySQL:** Se procedió a ingresar los datos de los 3 KPI y Homicidios a tablas, donde se le dio las conexiones entre ellas por la columna `Año` mediante los PRIMARY KEY y FOREIGN KEY, además de darle a cada columna el tipo de variable necesarios para que pueda ser interpretado de la manera mas optima por nuestro programa de visualización. 
    
* Ojo: las tablas que serán leídas por MySQL tienen que estar en la dirección similar a la siguiente: C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Datos\\resultadokpi2.csv 

![imagen1](https://github.com/MAYKJOEL/Dashboard-Interactivo-Siniestros-Viales-en-la-Ciudad-de-Buenos-Aires/blob/main/8-FOTOS/MySQL.png)

**POWERBI:** Por último se procedió a absorber la Base de Datos de MySQL mediante la conexión PowerBI-MySQL.

![image2](https://github.com/MAYKJOEL/Dashboard-Interactivo-Siniestros-Viales-en-la-Ciudad-de-Buenos-Aires/blob/main/8-FOTOS/ConexionPowebiMySQL1.png)

![image3](https://github.com/MAYKJOEL/Dashboard-Interactivo-Siniestros-Viales-en-la-Ciudad-de-Buenos-Aires/blob/main/8-FOTOS/ConexionPowebiMySQL2.png)

![image4](https://github.com/MAYKJOEL/Dashboard-Interactivo-Siniestros-Viales-en-la-Ciudad-de-Buenos-Aires/blob/main/8-FOTOS/ConexionPowebiMySQL3.png)

![image5](https://github.com/MAYKJOEL/Dashboard-Interactivo-Siniestros-Viales-en-la-Ciudad-de-Buenos-Aires/blob/main/8-FOTOS/ConexionPowebiMySQL4.png) 

Se Concluye con la representación mediante un DashBoard, en donde representamos los KPIs e información de nuestros datos analizados en el EDA y representados en este programa de visualización. Utilizamos los links-imagen de cada Comuna para que se muestre al interactuar con nuestro DashBoard.

![image6](https://github.com/MAYKJOEL/Dashboard-Interactivo-Siniestros-Viales-en-la-Ciudad-de-Buenos-Aires/blob/main/8-FOTOS/d1.png)

![image7](https://github.com/MAYKJOEL/Dashboard-Interactivo-Siniestros-Viales-en-la-Ciudad-de-Buenos-Aires/blob/main/8-FOTOS/d2.png)


### Análisis y Conclusiones Destacadas
* La mayoría de los accidentes involucran a una sola víctima.
* Los horarios de 6 a 8 de la mañana presentan el mayor número de accidentes.
* Las avenidas son el lugar con mayor incidencia de accidentes.
* Los hombres son las principales víctimas de los siniestros viales, pero las mujeres tienen un índice positivo.
* Las edades más afectadas son entre 20 y 40 años.
* Los barrios con más homicidios son Flores, Villa Lugano, Nueva Pompeya, Barracas y Palermo.
* Las comunas con más víctimas son Liniers, Retiro, Villa Soldati y La Boca.
* La mayoría de los accidentes fatales involucran a personas en autos.
* La edad promedio de las víctimas varía según el medio de transporte.
* Las variables del dataset no están correlacionadas entre sí.

### Recomendaciones para Mejorar los Índices de Seguridad Vial
* **Educación y Concientización:** Basándonos en el análisis que indica que los hombres entre 20 y 40 años son las principales víctimas de los accidentes viales, se recomienda implementar campañas educativas dirigidas específicamente a este grupo demográfico. Estas campañas deberían abordar los comportamientos de riesgo identificados, como el exceso de velocidad y la distracción al conducir, y enfatizar la importancia del cumplimiento de las normas de tránsito. Se sugiere también que se dirijan especialmente a los residentes de los barrios con mayor incidencia de accidentes, como Flores, Villa Lugano, Nueva Pompeya, Barracas y Palermo.

* **Infraestructura Vial Segura:** Según los datos analizados, las avenidas son los lugares con mayor incidencia de accidentes. Por lo tanto, se recomienda priorizar la mejora de la infraestructura vial en estas áreas, incluyendo la instalación de pasos de peatones seguros, la implementación de zonas de velocidad controlada y la mejora de la iluminación para reducir los accidentes durante la noche. Se debe prestar especial atención a las avenidas ubicadas en los barrios con más accidentes, como Flores, Villa Lugano, Nueva Pompeya, Barracas y Palermo.

* **Cumplimiento de Normativas:** Dado que se ha identificado que los horarios de 6 a 8 de la mañana presentan el mayor número de accidentes, se recomienda aumentar los controles de tránsito durante este período. Esto podría incluir la presencia de agentes de tránsito en puntos críticos y el uso de tecnología de vigilancia para detectar y sancionar infracciones de tránsito, como el exceso de velocidad y el uso del teléfono móvil al conducir. Se sugiere también que estos controles se intensifiquen en las comunas con más víctimas, como Liniers, Retiro, Villa Soldati y La Boca.

* **Promoción de Medios de Transporte Alternativos:** Considerando que la mayoría de los accidentes fatales involucran a personas en autos, se sugiere promover activamente el uso de medios de transporte alternativos, como el transporte público y la bicicleta. Específicamente, se podría implementar un programa de incentivos para alentar a los residentes de los barrios con mayor incidencia de accidentes a utilizar el transporte público en lugar de conducir. Se debe tener en cuenta que estos barrios incluyen Flores, Villa Lugano, Nueva Pompeya, Barracas y Palermo.

* **Tecnología y Seguridad de Vehículos:** Dado que las edades de las víctimas varían según el medio de transporte, se recomienda promover el uso de tecnologías de seguridad específicas para cada tipo de vehículo. Por ejemplo, para los automóviles, se podrían promover sistemas de frenado automático y control de crucero adaptativo para reducir el riesgo de colisiones. Para los ciclistas, se podría fomentar el uso de cascos y luces de seguridad para aumentar su visibilidad en la carretera y reducir el riesgo de lesiones en caso de accidente.

## Cómo Usar
Clona este repositorio en tu máquina local.
Instala las dependencias requeridas.
Ejecuta los Scripts.

## Contribuciones
¡Las contribuciones son bienvenidas! Si deseas mejorar este proyecto, puedes hacer un fork del repositorio, implementar tus cambios y luego enviar un pull request. Se revisarán y fusionarán las contribuciones relevantes.

## Créditos
Este proyecto fue desarrollado por [MAYK JOEL QUISPE GASPAR](https://github.com/MAYKJOEL/) como parte del Segundo Proyecto Individual del programa LABs **Data Science** del BootCamp ![`SOYHENRY`](https://d31uz8lwfmyn8g.cloudfront.net/Assets/logo-henry-white-lg.png)
## 🛠 Herramientas
Python, VisualCode, MySQL y PowerBI


## 🔗 Links
[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://github.com/MAYKJOEL)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mayk-quispe-gaspar-42814a97/)


## Documentation

[Documentation](https://github.com/soyHenry/PI_DA/tree/Full_Time?tab=readme-ov-file)

