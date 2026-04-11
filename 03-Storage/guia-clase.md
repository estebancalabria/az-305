## 🧑‍🏫 Guía Docente – AZ-305

### ✅ Checklist corto y fácil de seguir

* Clasificación de datos (estructurados, semiestructurados y no estructurados)
* Azure Storage Accounts
* Redundancia y replicación
* Azure Blob Storage
* Azure Files y Azure NetApp Files
* Azure Disks
* Seguridad en el almacenamiento
* Aplicación práctica del diseño

---

## 🗂️ Estructura Sugerida de la Clase

### 1. Clasificación de los Tipos de Datos

**Objetivo:** Comprender cómo el tipo de datos influye en la elección del servicio de almacenamiento.

**Qué explicar:**

* **Datos estructurados:** tablas relacionales con esquema definido (ej. Azure SQL).
* **Datos semiestructurados:** JSON, XML, YAML, eventos o plantillas.
* **Datos no estructurados:** documentos, imágenes, videos, backups y archivos multimedia.

**Hacer hincapié en:**

* La importancia de seleccionar el servicio de almacenamiento adecuado según el tipo de datos.
* Enfoque principal del módulo en datos semiestructurados y no estructurados.

---

### 2. Diseño de Azure Storage Accounts

**Objetivo:** Entender el rol de la cuenta de almacenamiento como contenedor principal de los servicios de datos.

**Qué explicar:**

* La cuenta de almacenamiento como “paraguas” de servicios: Blobs, Files, Queues, Tables y Data Lake.
* **Tipos de cuenta:**

  * **Standard (GPv2):** respaldada por HDD, adecuada para la mayoría de los escenarios.
  * **Premium:** respaldada por SSD, ideal para cargas sensibles a la latencia.
* **Consideraciones de diseño:**

  * Ubicación y residencia de datos.
  * Cumplimiento normativo.
  * Costos (capacidad, transacciones y egreso).
  * Límites y gobernanza.
  * Estrategias de administración centralizada o descentralizada.

**Hacer hincapié en:**

* Elegir correctamente el tipo de cuenta para evitar problemas de rendimiento y costos.
* Importancia de definir límites organizacionales y de propiedad.

---

### 3. Redundancia y Resiliencia de Datos

**Objetivo:** Diseñar soluciones altamente disponibles y duraderas.

**Qué explicar:**

* **Opciones de replicación:**

  * **LRS (Locally Redundant Storage):** tres copias dentro de un mismo centro de datos.
  * **ZRS (Zone-Redundant Storage):** copias distribuidas en distintas zonas de disponibilidad.
  * **GRS (Geo-Redundant Storage):** replicación asíncrona a una región secundaria.
  * **RA-GRS:** acceso de solo lectura a la región secundaria.
  * **GZRS (Geo-Zone Redundant Storage):** combinación de ZRS y GRS.
  * **RA-GZRS:** acceso de lectura a la región secundaria con máxima resiliencia.

**Hacer hincapié en:**

* Uso de regiones emparejadas para recuperación ante desastres.
* Distribución de tráfico mediante el endpoint secundario.
* Relación entre redundancia, durabilidad y costo.

---

### 4. Diseño para Azure Blob Storage

**Objetivo:** Comprender el uso de Blob Storage para grandes volúmenes de datos no estructurados.

**Qué explicar:**

* Blob Storage como almacenamiento de objetos altamente escalable.
* **Access tiers:**

  * **Hot:** acceso frecuente.
  * **Cool:** acceso infrecuente (retención mínima de 30 días).
  * **Cold:** acceso raro (retención mínima de 90 días).
  * **Archive:** almacenamiento offline para cumplimiento (retención mínima de 180 días).
* **Lifecycle Management:** automatización de la transición entre tiers.
* **Inmutabilidad:**

  * **Time-based retention.**
  * **Legal hold (WORM – Write Once, Read Many).**

**Hacer hincapié en:**

* Optimización de costos mediante el uso adecuado de los tiers.
* Penalizaciones por eliminación anticipada.
* Uso de almacenamiento inmutable para cumplimiento normativo y auditorías.

---

### 5. Diseño para Azure Files y Azure NetApp Files

**Objetivo:** Identificar escenarios donde se requiere almacenamiento compartido con semántica de sistema de archivos.

**Qué explicar:**

* **Azure Files:**

  * Acceso mediante protocolos **SMB** y **NFS 4.1**.
  * Montaje como unidad de red.
  * Escenarios de lift-and-shift de file servers.
  * Integración híbrida mediante **Azure File Sync**.
  * Uso en VDI, AKS y entornos que requieren almacenamiento persistente compartido.
* **Azure NetApp Files:**

  * Rendimiento empresarial y baja latencia.
  * Casos de uso como SAP, HPC, AVS y VDI.

**Hacer hincapié en:**

* Diferencias entre Blob Storage (objetos) y Azure Files (sistema de archivos).
* Sincronización y centralización de datos en escenarios híbridos.

---

### 6. Diseño para Azure Disks

**Objetivo:** Comprender el almacenamiento persistente para máquinas virtuales.

**Qué explicar:**

* Uso de **Managed Disks** como opción recomendada.
* **Tipos de discos:**

  * Standard HDD.
  * Standard SSD.
  * Premium SSD.
  * Ultra Disk.
* **Consideraciones de diseño:**

  * Rendimiento (IOPS y throughput).
  * Caché de disco.
  * Escalabilidad mediante disk striping.
  * Discos compartidos para escenarios de clúster.

**Seguridad y protección:**

* **Server-Side Encryption (SSE).**
* **Azure Disk Encryption (BitLocker/DM-Crypt).**
* **Encryption at Host.**
* Integración con **Azure Backup** y **Site Recovery**.

**Hacer hincapié en:**

* Selección del tipo de disco según las necesidades de rendimiento.
* Balance entre costos y performance.

---

### 7. Seguridad en el Almacenamiento

**Objetivo:** Diseñar soluciones de almacenamiento seguras y conformes a las mejores prácticas.

**Qué explicar:**

* **Autenticación y autorización:**

  * Integración con **Microsoft Entra ID**.
  * Uso de **Role-Based Access Control (RBAC)**.
  * **Shared Access Signatures (SAS)** y **Access Keys** (uso restringido y rotación periódica).
* **Protección de red:**

  * Firewalls de almacenamiento.
  * **Service Endpoints**.
  * **Private Endpoints** mediante **Private Link**.
* **Cifrado:**

  * Encriptación en reposo.
  * Encriptación en tránsito.

**Hacer hincapié en:**

* Principio de mínimo privilegio.
* Preferencia por autenticación basada en identidad frente al uso de claves.
* Aislamiento de red para datos sensibles.

---

### 8. Aplicación Práctica del Diseño de Almacenamiento

**Objetivo:** Integrar los conceptos mediante un escenario empresarial.

**Escenario:**
Una organización requiere:

* **Media files** (JPEG/MP4) para un sitio web público con acceso global.
* **Marketing literature** (PDF) accesible tanto por clientes como por usuarios internos mediante una unidad mapeada.
* **Corporate documents** (Word/Excel) sensibles y sujetos a requisitos de cumplimiento.

**Diseño propuesto:**

* **Media files:** Azure Blob Storage con acceso público controlado y optimización mediante access tiers.
* **Marketing literature:** Azure Files para permitir acceso mediante SMB y también desde aplicaciones web.
* **Corporate documents:** Azure Blob Storage con políticas de inmutabilidad y autenticación mediante Microsoft Entra ID.

**Hacer hincapié en:**

* Separación de cuentas de almacenamiento para aislar cargas de trabajo.
* Uso de autenticación segura y controles de acceso.
* Optimización de costos y cumplimiento normativo mediante características específicas de cada servicio.
