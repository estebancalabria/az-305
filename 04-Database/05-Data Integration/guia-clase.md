## 🧑‍🏫 Guía Docente – AZ-305

### ✅ Checklist corto y fácil de seguir

* Visión end-to-end de integración de datos
* Azure Data Lake Storage
* Azure Data Factory
* Azure Databricks
* Azure Synapse Analytics
* Azure Stream Analytics
* Aplicación práctica del diseño

---

## 🗂️ Estructura Sugerida de la Clase

### 1. Visión End-to-End de Integración y Analítica de Datos

**Objetivo:** Comprender el flujo completo de los datos desde su origen hasta su consumo para la toma de decisiones.

**Qué explicar:**

* **Fuentes de datos:** IoT, aplicaciones, archivos, logs y sistemas transaccionales.
* **Ingesta de datos:** Servicios como Azure Data Factory o Event Hubs.
* **Almacenamiento analítico:** Azure Data Lake Storage.
* **Procesamiento:** Azure Databricks o Azure Synapse Analytics.
* **Análisis en tiempo real:** Azure Stream Analytics.
* **Consumo:** Herramientas de visualización como Power BI.

**Hacer hincapié en:**

* La importancia de entender el flujo completo antes de seleccionar los servicios.
* Cómo cada componente cumple un rol específico dentro de la arquitectura.

---

### 2. Diseño para Azure Data Lake Storage

**Objetivo:** Identificar cuándo utilizar Azure Data Lake como repositorio central de datos analíticos.

**Qué explicar:**

* Azure Data Lake Storage como extensión de Azure Blob Storage con **hierarchical namespace**.
* Compatibilidad con **HDFS** para herramientas de Big Data.
* Soporte para **ACLs** además de **RBAC**, permitiendo un control de acceso más granular.
* Capacidad para almacenar grandes volúmenes de datos en su formato nativo.
* Integración con servicios como IoT Hub, Event Hubs y Stream Analytics.

**Comparación con Blob Storage:**

| Característica             | Azure Blob Storage     | Azure Data Lake Storage |
| -------------------------- | ---------------------- | ----------------------- |
| Estructura                 | Plana                  | Jerárquica              |
| Compatibilidad HDFS        | No                     | Sí                      |
| Control de acceso granular | Limitado               | ACLs + RBAC             |
| Enfoque principal          | Almacenamiento general | Analítica de Big Data   |

**Hacer hincapié en:**

* El enfoque “analytics-first” del Data Lake.
* Su rol como repositorio central para múltiples equipos y herramientas.

---

### 3. Orquestación e Integración con Azure Data Factory

**Objetivo:** Comprender cómo orquestar y automatizar el movimiento de datos entre múltiples sistemas.

**Qué explicar:**

* Azure Data Factory como servicio de **orquestación** y **ETL/ELT**.
* Concepto de **pipelines**, **datasets** y **linked services**.
* Integración con fuentes **on-premises**, **Azure** y **SaaS** mediante **Integration Runtime**.
* Amplia biblioteca de **conectores**.
* Soporte para **CI/CD** y automatización de flujos de datos.

**Hacer hincapié en:**

* Data Factory no almacena datos; coordina su movimiento y transformación.
* Su papel central en arquitecturas modernas de datos.

---

### 4. Procesamiento y Analítica Avanzada con Azure Databricks

**Objetivo:** Entender cuándo utilizar Azure Databricks para procesamiento masivo y machine learning.

**Qué explicar:**

* Plataforma colaborativa basada en **Apache Spark**.
* Integración de equipos de **data engineering**, **data science** y **analytics**.
* Uso de **Delta Lake** para garantizar **ACID**, versionado y calidad de datos.
* Arquitectura **Medallion**:

  * **Bronze:** datos crudos.
  * **Silver:** datos limpios y enriquecidos.
  * **Gold:** datos agregados y listos para el negocio.
* Integración con **Power BI** y **Microsoft Purview** para gobernanza.

**Hacer hincapié en:**

* Su idoneidad para cargas de trabajo intensivas en procesamiento y machine learning.
* La colaboración entre equipos como ventaja diferencial.

---

### 5. Plataforma Analítica Unificada con Azure Synapse Analytics

**Objetivo:** Diseñar soluciones analíticas integradas que combinen almacenamiento, procesamiento y visualización.

**Qué explicar:**

* Azure Synapse como plataforma unificada que integra:

  * **SQL Pools dedicados:** rendimiento predecible para data warehousing.
  * **SQL Pools serverless:** consultas bajo demanda sobre el Data Lake.
  * **Spark Pools:** procesamiento y machine learning.
  * **Pipelines:** integración de datos (basados en Data Factory).
  * **Synapse Studio:** interfaz unificada de gestión.
  * **Synapse Link:** analítica casi en tiempo real desde sistemas operacionales.

**Comparación con otros servicios:**

| Servicio           | Rol Principal                 |
| ------------------ | ----------------------------- |
| Azure Data Factory | Orquestación e integración    |
| Azure Databricks   | Procesamiento Spark y ML      |
| Azure Synapse      | Plataforma analítica integral |

**Hacer hincapié en:**

* La simplificación arquitectónica al centralizar capacidades en un único servicio.
* La posibilidad de combinar Synapse con Databricks en soluciones empresariales.

---

### 6. Análisis en Tiempo Real con Azure Stream Analytics

**Objetivo:** Diseñar soluciones capaces de procesar y analizar datos en streaming.

**Qué explicar:**

* Motor de procesamiento de eventos en tiempo real totalmente administrado.
* **Fuentes de entrada:** Event Hubs, IoT Hub y Blob Storage.
* **Lenguaje de consultas:** basado en SQL con extensiones en JavaScript y .NET.
* **Destinos de salida:** Azure SQL Database, Data Lake, Blob Storage, Cosmos DB, Power BI, Functions o Service Bus.
* Conceptos de **ventanas temporales** (tumbling, hopping y sliding).

**Ejemplo práctico:**

* Sensores de un invernadero inteligente que envían datos de humedad.
* Stream Analytics detecta condiciones específicas y desencadena acciones automáticas.

**Hacer hincapié en:**

* La diferencia entre procesamiento **batch** y **streaming**.
* Su utilidad en escenarios IoT y de análisis en tiempo real.

---

### 7. Aplicación Práctica del Diseño

**Objetivo:** Integrar los conceptos mediante escenarios empresariales reales.

#### Escenario 1: Arquitectura Analítica End-to-End

**Diseño propuesto:**

* **Ingesta:** Azure Data Factory y Event Hubs.
* **Almacenamiento:** Azure Data Lake Storage.
* **Procesamiento:** Azure Databricks para ingeniería de datos.
* **Data Warehouse:** Azure Synapse Analytics.
* **Visualización:** Power BI.
* **Gobernanza:** Microsoft Purview.

#### Escenario 2: Análisis en Tiempo Real de una Compañía de Taxis

**Requerimiento:**

* Calcular el promedio de propinas por milla en tiempo real a partir de dos flujos de datos (viajes y pagos).

**Diseño propuesto:**

* **Ingesta:** Event Hubs.
* **Procesamiento en tiempo real:** Azure Stream Analytics con correlación de streams y ventanas temporales.
* **Almacenamiento:** Azure Data Lake o Azure SQL Database.
* **Visualización:** Power BI para dashboards en tiempo real.

**Hacer hincapié en:**

* La selección de servicios según el tipo de procesamiento requerido.
* La alineación con los pilares del **Well-Architected Framework**: rendimiento, escalabilidad, seguridad y eficiencia operativa.
