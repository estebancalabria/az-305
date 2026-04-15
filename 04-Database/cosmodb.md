## 🌐 Resumen de Azure Cosmos DB

**Azure Cosmos DB** es una base de datos **NoSQL totalmente administrada**, diseñada para aplicaciones modernas que requieren **escala global**, **baja latencia**, **alta disponibilidad** y **rendimiento garantizado**. Es especialmente adecuada para escenarios donde los datos deben estar disponibles en múltiples regiones con tiempos de respuesta en el orden de los milisegundos.

---

## 🧩 Características Principales

### 🔹 1. Distribución Global

* Permite replicar datos en **múltiples regiones de Azure** con solo unos clics.
* Ofrece **latencia de un solo dígito de milisegundos** para operaciones de lectura y escritura.
* Soporta configuraciones **multi-región activas**, mejorando la disponibilidad y la experiencia del usuario.
* Proporciona **acuerdos de nivel de servicio (SLA)** para disponibilidad, latencia, rendimiento y consistencia.

### 🔹 2. Rendimiento Garantizado (Throughput)

* El rendimiento se mide en **Request Units por segundo (RU/s)**.
* Permite aprovisionar capacidad de forma **manual (provisioned throughput)** o mediante **autoscale**, que ajusta automáticamente las RU/s según la demanda.
* Garantiza un rendimiento predecible y consistente.

### 🔹 3. Modelos de Consistencia

Azure Cosmos DB ofrece **cinco niveles de consistencia**, permitiendo equilibrar disponibilidad y precisión de los datos:

| Nivel de Consistencia | Descripción                                                                   | Caso de Uso                                    |
| --------------------- | ----------------------------------------------------------------------------- | ---------------------------------------------- |
| **Strong**            | Garantiza que siempre se lea el último valor escrito.                         | Sistemas financieros o críticos.               |
| **Bounded Staleness** | Permite un retraso controlado en número de versiones o tiempo.                | Aplicaciones con replicación controlada.       |
| **Session**           | Consistencia garantizada dentro de la sesión del usuario.                     | Aplicaciones web y móviles (opción más común). |
| **Consistent Prefix** | Garantiza el orden de las escrituras sin asegurar que sean las más recientes. | Procesamiento de eventos.                      |
| **Eventual**          | Máxima disponibilidad con posible retraso en la propagación de datos.         | Escenarios analíticos o sociales.              |

---

## 🗂️ 4. APIs y Modelos de Datos

Azure Cosmos DB es una base de datos **multi-modelo**, lo que permite utilizar diferentes APIs sin necesidad de cambiar la arquitectura de la aplicación:

| API            | Modelo                                   | Casos de Uso                                            |
| -------------- | ---------------------------------------- | ------------------------------------------------------- |
| **Core (SQL)** | Documentos JSON                          | Aplicaciones modernas y microservicios.                 |
| **MongoDB**    | Documentos                               | Migraciones desde MongoDB.                              |
| **Cassandra**  | Columnas anchas                          | Sistemas distribuidos y de alta escritura.              |
| **Table**      | Clave-valor                              | Migración desde Azure Table Storage.                    |
| **Gremlin**    | Grafos                                   | Redes sociales, recomendaciones y detección de fraudes. |
| **PostgreSQL** | Relacional distribuido (basado en Citus) | Aplicaciones que requieren SQL distribuido.             |

---

## 🚀 5. Alta Disponibilidad y Recuperación ante Desastres

* **Disponibilidad del 99.999%** para cuentas configuradas en múltiples regiones.
* **Replicación automática** y configurable entre regiones.
* **Failover automático** para mantener la continuidad del servicio.
* **Arquitectura multi-master (multi-write)** que permite escrituras en varias regiones simultáneamente.

---

## 🔄 6. Integración con Arquitecturas Modernas

### 🔹 Change Feed

* Proporciona un registro ordenado de los cambios en los datos.
* Permite implementar **arquitecturas event-driven**, sincronización de datos y procesamiento en tiempo real.
* Se integra fácilmente con **Azure Functions** y otros servicios.

### 🔹 Integración con Caché

* Puede combinarse con **Azure Cache for Redis** para mejorar el rendimiento y reducir la latencia en lecturas frecuentes.

### 🔹 Escenarios Híbridos de Almacenamiento

* Es posible utilizar **Azure Cosmos DB** para datos “calientes” y **Azure Table Storage** para datos históricos o de bajo costo, replicándolos mediante el **change feed**.

---

## 🔐 7. Seguridad en Azure Cosmos DB

Azure Cosmos DB incorpora múltiples mecanismos de seguridad:

* **Autenticación con Microsoft Entra ID** y claves de acceso.
* **Control de acceso basado en roles (RBAC)**.
* **Aislamiento de red** mediante **firewalls**, **Service Endpoints** y **Private Endpoints**.
* **Cifrado de datos en reposo** por defecto y **TLS** para datos en tránsito.
* **Customer-Managed Keys** almacenadas en **Azure Key Vault**.
* **Microsoft Defender for Cloud** para detección de amenazas y evaluaciones de seguridad.

---

## 💡 8. Casos de Uso Comunes

| Caso de Uso                                 | Justificación                                  |
| ------------------------------------------- | ---------------------------------------------- |
| Aplicaciones web y móviles globales         | Baja latencia y replicación multi-región       |
| IoT                                         | Ingesta continua de grandes volúmenes de datos |
| Gaming                                      | Manejo de picos masivos de tráfico             |
| Retail y marketing                          | Personalización en tiempo real                 |
| Sistemas de contenido generado por usuarios | Flexibilidad del modelo JSON                   |
| Arquitecturas event-driven                  | Integración con Change Feed                    |

---

## 📊 9. Comparación: Cosmos DB Table API vs Azure Table Storage

| Característica      | Cosmos DB Table API              | Azure Table Storage   |
| ------------------- | -------------------------------- | --------------------- |
| Escalabilidad       | Global y prácticamente ilimitada | Limitada a una región |
| Latencia            | Milisegundos de un solo dígito   | Mayor                 |
| SLA                 | Sí                               | Más limitado          |
| Replicación global  | Sí                               | No                    |
| Throughput dedicado | Sí (RU/s)                        | No                    |
| Costo               | Mayor                            | Más económico         |

---

## 🧭 10. ¿Cuándo Elegir Azure Cosmos DB?

**Elegir Azure Cosmos DB cuando:**

* Se requiere **distribución global** y **baja latencia**.
* La aplicación necesita **escalabilidad masiva**.
* Se manejan **datos semi-estructurados o NoSQL**.
* Se necesitan **múltiples modelos de consistencia**.
* Se implementan **arquitecturas modernas y event-driven**.

**No es la mejor opción cuando:**

* Se requiere un **modelo estrictamente relacional** con transacciones complejas → mejor **Azure SQL Database**.
* El principal objetivo es **minimizar costos** sin necesidad de escalabilidad global → mejor **Azure Table Storage**.

---

## 🧭 Resumen Ejecutivo

> **Azure Cosmos DB es una base de datos NoSQL globalmente distribuida que ofrece escalabilidad elástica, latencia ultrabaja y rendimiento garantizado, siendo ideal para aplicaciones modernas que requieren alta disponibilidad y acceso a datos en múltiples regiones.**

---

> **“Si tu aplicación necesita escala global, baja latencia y flexibilidad en el modelo de datos, Azure Cosmos DB es la elección ideal.”**

