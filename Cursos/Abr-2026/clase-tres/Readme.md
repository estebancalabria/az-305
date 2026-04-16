# Clase Tres - 16 de Octubre del 2026

# Repaso Ejecurito

* Caso de estudio de Compute
* Principios de WAF aplicados a cada tema
* Storage
    * Escalabilidad
    * Governanza
      * Inmutabilidad
    * File Share
    * Blobs
    * Redundancias
    * Critetio cuando aplicar cada uno
    * Compliance
    * Moitoring
    * Costos
      * Calculadora de costos
      * Compativa de costos
* Bases de Datos
  * SQL
    * Optimizacion de costos
  * CosmoDB

# Actualizacion con la clase pasada

* Tabla de costos
  * https://github.com/estebancalabria/az-305/blob/main/04-Database/costos.md

# Data Integration

* Tiene que ver con
   * Data Science
   * Mahine learning
   * Power BI
   * Toma de decisiones
   * Anlitica de datos en tiempo real
 
* Proceso de Intergracion de Datos
   * Generacion de datos (bases de datos, api externas para sacarles dates, documentos semi-estructurado)
      * Ingesta de datos
         * Almacenamiento (Data Lake = Blob + HDFS + napescapce jeraquicos)
            * Procesamiento y transformacion (ETL)
              * Analitica y enriquecimiento (ML, Consultas)
                 * Exposicion : Generar dashboars interactivos con esos esos datos
  * Gobernanza
     * Que puede ver cada uno
     * Microsft PureView
        * https://www.microsoft.com/es-es/security/business/microsoft-purview

## Decisiones Arquitectura

* Definir la estructura de carpetas y permisos en el DataLake para governar los dos
* No conviene trabajar directamente sobre los datos de produccion
* Implementar el proceso anterior en servicios de Azure
* Empezaria a pensar en estos servicios
   * Cuando no quiero inferir en la performance de produccion para la analyticoa
   * Cuando estoy hablando de informacion en el orden de los GB

## Herramientas de Azure

### Almacenamiento

* Data Lake 2
      * >>>> Delta Lake  :: Data Lake Mejorado con manejo de versiones

* Almacenamientos
   * Bronze
      * Ejemplos : Datos json, csv,... sin relacion
   * Plata
      * Ejemplos : Unificas los datos en un formato unico (Ej  parquet), definis un esquema, una especie de normalizacion, los filtras
   * Gold
      * Ejemplo : Los enriqueces con infomacion estras, le das un pulido final, etc

### Ingesta

* Data Factory
   * Mover datos desde todas mis fuentes al Data Lale
   * Se maneja desde su propio portal
      * https://adf.azure.com/

### Procesamiento de datos (ETL)

* Data Bricks
   * https://spark.apache.org/
* Tiene su propio portal
   * https://adb-xxxxxxxxxxxxxx.azuredatabricks.net/

### Analitica

* Synapse Analytics

### Resumen Proceso

<img width="1146" height="682" alt="image" src="https://github.com/user-attachments/assets/4b768222-838a-4291-be27-02d5d6d429ae" />


# Arquitectura de Apps (Messaging)

## Networking en en contexto de Arquitectura

# Auth



