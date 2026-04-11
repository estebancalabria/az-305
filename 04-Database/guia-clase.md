## 🧑‍🏫 Guía Docente – AZ-305

### ✅ Checklist corto y fácil de seguir

* Clasificación de datos (estructurados y semiestructurados)
* Opciones de Azure SQL (SQL Database, Managed Instance y SQL en máquinas virtuales)
* Escalabilidad y modelos de precios (DTU, vCore y Serverless)
* Disponibilidad y recuperación ante desastres
* Seguridad de datos (en reposo, en tránsito y en uso)
* Azure Cosmos DB y Table Storage
* Aplicación práctica del diseño

---

## 🗂️ Estructura Sugerida de la Clase

### 1. Clasificación de los Tipos de Datos

**Objetivo:** Comprender cómo el tipo de datos y el patrón de acceso influyen en la elección del servicio de almacenamiento.

**Qué explicar:**

* **Datos estructurados:** Información con esquema definido y relaciones, típica de bases de datos relacionales.
* **Datos semiestructurados:** Información con estructura flexible como JSON o XML, que puede ser consultada pero no necesariamente relacional.

**Hacer hincapié en:**

* La alineación entre la forma de los datos y el servicio de almacenamiento.
* El enfoque del módulo en datos estructurados y semiestructurados.

---

### 2. Diseño para Azure SQL Databases

**Objetivo:** Identificar la opción de Azure SQL más adecuada según el nivel de control, compatibilidad y necesidades de modernización.

**Qué explicar:**

* **SQL Server en Azure Virtual Machines:**

  * Máximo control y compatibilidad.
  * Ideal para migraciones *lift-and-shift* y requerimientos de acceso al sistema operativo.

* **Azure SQL Managed Instance:**

  * Alta compatibilidad con SQL Server.
  * Integración con redes virtuales.
  * Adecuado para modernizaciones con mínima refactorización.

* **Azure SQL Database:**

  * Plataforma completamente administrada (PaaS).
  * Escalabilidad y alta disponibilidad integradas.
  * Ideal para aplicaciones nativas de la nube.

**Hacer hincapié en:**

* El balance entre control y responsabilidad operativa.
* La reducción de costos de administración con servicios PaaS.

---

### 3. Escalabilidad y Modelos de Precios

**Objetivo:** Comprender las opciones de escalabilidad y cómo seleccionar el modelo de precios adecuado.

**Qué explicar:**

* **Single Database:** Simplicidad y rendimiento dedicado.
* **Elastic Pools:** Recursos compartidos para múltiples bases de datos con demandas variables.
* **Modelos de precios:**

  * **DTU:** Modelo simplificado que agrupa CPU, memoria e IOPS.
  * **vCore:** Mayor transparencia y flexibilidad en la asignación de recursos.
  * **Serverless:** Escalado automático y pausa del cómputo para cargas de trabajo impredecibles.

**Hacer hincapié en:**

* La optimización de costos según los patrones de uso.
* El uso de elastic pools en escenarios multi-tenant.

---

### 4. Disponibilidad y Recuperación ante Desastres

**Objetivo:** Diseñar soluciones altamente disponibles que cumplan con los requisitos de continuidad del negocio.

**Qué explicar:**

* **Niveles de servicio:**

  * **General Purpose / Standard:** Balance entre costo y rendimiento.
  * **Business Critical / Premium:** Baja latencia y múltiples réplicas.
  * **Hyperscale:** Para bases de datos muy grandes (hasta 128 TB) con rápida recuperación.

* **Estrategias de recuperación:**

  * **Alta disponibilidad regional:** Réplicas automáticas dentro de la región.
  * **Geo-replicación activa:** Replicación asíncrona a otras regiones.
  * **Auto-failover Groups:** Endpoint estable para conmutación por error.

**Hacer hincapié en:**

* La relación entre SLA, RPO y RTO.
* La selección del tier adecuado según criticidad y tamaño de la base de datos.

---

### 5. Seguridad de los Datos

**Objetivo:** Implementar una estrategia de seguridad en múltiples capas para proteger la información.

**Qué explicar:**

* **Identidad y acceso:**

  * Integración con **Microsoft Entra ID**.
  * Control de acceso basado en roles (RBAC).
  * Alternativa de autenticación mediante SQL (cuando sea necesario).

* **Seguridad de red:**

  * Firewalls.
  * **Service Endpoints** y **Private Endpoints**.

* **Protección de datos:**

  * **En reposo:** Transparent Data Encryption (TDE).
  * **En tránsito:** TLS.
  * **En uso:** Always Encrypted.
  * **Enmascaramiento de datos:** Dynamic Data Masking.

* **Gobernanza y monitoreo:**

  * **Microsoft Defender for Cloud** para evaluación de vulnerabilidades.
  * **Microsoft Purview** para clasificación y cumplimiento.

**Hacer hincapié en:**

* El enfoque de defensa en profundidad.
* El principio de mínimo privilegio y la centralización de identidades.

---

### 6. Diseño para Azure Cosmos DB y Azure Table Storage

**Objetivo:** Identificar cuándo utilizar soluciones NoSQL o de escala global complementarias a las bases de datos relacionales.

**Qué explicar:**

* **Azure Cosmos DB:**

  * Base de datos NoSQL globalmente distribuida.
  * Latencia de milisegundos de un solo dígito.
  * Replicación multi-región y escalabilidad horizontal.
  * Soporte para múltiples APIs (MongoDB, Cassandra, Table, PostgreSQL, entre otras).
  * Casos de uso: aplicaciones web y móviles, IoT, gaming y sistemas con alta concurrencia.

* **Azure Table Storage:**

  * Almacenamiento clave-valor de bajo costo.
  * Adecuado para escenarios simples con menores requerimientos de rendimiento.

* **Cosmos DB Table API:**

  * Compatible con Table Storage pero con capacidades avanzadas de escalabilidad y disponibilidad.

**Hacer hincapié en:**

* La elección basada en necesidades de latencia global, escalabilidad y modelo de datos.
* La posibilidad de comenzar con Table Storage y evolucionar hacia Cosmos DB.

---

### 7. Aplicación Práctica del Diseño de Bases de Datos

**Objetivo:** Integrar los conceptos mediante un escenario empresarial realista.

**Escenario:**
Una empresa desea migrar su sitio web de comercio electrónico a Azure. El catálogo de productos reside actualmente en un SQL Server on-premises con Always On Availability Groups. Se requieren:

* **Alta disponibilidad** para evitar pérdidas de ventas.
* **Mejor rendimiento** en búsquedas y navegación.
* **Seguridad** para proteger información personal y financiera.
* **Escalabilidad global** a medida que crece el tráfico.

**Diseño propuesto:**

* **Base de datos principal:** Azure SQL Database en el tier **Business Critical** para baja latencia y alta disponibilidad.
* **Recuperación ante desastres:** Geo-replicación con **Auto-Failover Groups** hacia una región secundaria.
* **Optimización de rendimiento:** Uso de **Azure Managed Redis** para almacenamiento en caché.
* **Seguridad:**

  * Autenticación mediante **Microsoft Entra ID**.
  * Acceso seguro a través de **Azure Front Door** y reglas de red.
  * Protección con **Microsoft Defender for Cloud**.

**Hacer hincapié en:**

* La alineación con los pilares del **Well-Architected Framework**.
* La importancia de combinar rendimiento, disponibilidad y seguridad en el diseño final.
