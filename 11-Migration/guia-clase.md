### 🚀 AZ-305 – Diseño de Migración a Azure

Este módulo trata de **cómo planificar y ejecutar migraciones a Azure de forma segura, ordenada y con mínimo riesgo**, usando frameworks, herramientas y estrategias.

---

## 🧭 1. Enfoque general: Cloud Adoption Framework

Microsoft Cloud Adoption Framework

No es una checklist, sino un **marco de decisión**.

### 🔑 Etapas:

* 🎯 Definir estrategia (objetivos reales del negocio)
* 🧪 Evaluar workloads
* 🚚 Migrar o modernizar
* ⚙️ Gobernar y optimizar

👉 Idea clave: *no se empieza migrando, se empieza entendiendo el objetivo del negocio.*

---

## 🔄 2. Estrategias de migración (las 4 R)

* 🔁 **Rehost (Lift & Shift):** mover sin cambios
* 🧩 **Refactor:** pequeños ajustes (ej: contenedores)
* 🏗️ **Re-architect:** rediseño cloud-native
* 🆕 **Rebuild:** reconstrucción total

📌 Regla: la modernización es opcional, pero la intención no.

---

## 🧪 3. Evaluación de workloads

Azure Migrate

Permite descubrir infraestructura antes de migrar:

* VMs (VMware, Hyper-V, físicas)
* Bases de datos
* Aplicaciones web

### 🔍 Cómo funciona:

* Appliance recopila datos:

  * CPU, RAM, discos
  * IOPS y red
* Se sube a Azure Migrate
* Se generan reportes de compatibilidad y sizing

👉 Evita sorpresas como dependencias ocultas.

---

## 🧰 4. Herramientas de migración

### 🧠 Plataforma central

* Azure Migrate (assessment + migration)

### 🗄️ Bases de datos

Azure Database Migration Service

* Migración a:

  * Azure SQL
  * PostgreSQL
  * MySQL
  * Cosmos DB

---

### 📁 Archivos y storage

Azure File Sync

* Mantiene archivos locales + cloud sincronizados

Azure Storage Mover

* Migración de shares SMB/NFS

AzCopy

* Transferencias rápidas por CLI

---

### 📦 Migración offline

Azure Data Box

* Para grandes volúmenes (TB–PB)
* Se envían discos físicos a Azure

Azure Import/Export Service

* Alternativa para envío de discos

---

## 🌐 5. Migración online vs offline

* 🔵 **Online:** sincronización continua (menos downtime)
* ⚫ **Offline:** envío físico (más rápido para grandes datos)

👉 Decisión basada en:

* tamaño de datos
* ancho de banda
* tolerancia a downtime
* riesgo

---

## 📊 6. Ejemplo de arquitectura de migración

Caso típico:

* NAS → Azure Files
* SQL Server → Azure SQL Database
* FTP → Azure Blob Storage
* scripts → Azure Functions / Data Factory
* carga masiva → AzCopy

---

## 🧠 7. Patrón clave del módulo

Migrar bien no es “mover cosas”, es:

* 📌 Entender dependencias
* 📌 Elegir estrategia (4 R)
* 📌 Seleccionar herramienta correcta
* 📌 Minimizar downtime
* 📌 Validar impacto en negocio

---

## ⚠️ 8. Idea más importante del módulo

👉 *No existe una única herramienta de migración correcta.*

Depende de:

* tamaño de datos
* criticidad
* red disponible
* ventana de corte

---

## 🧭 Resumen mental rápido

Migración =
**CAF → Evaluación → Estrategia (4R) → Herramienta → Ejecución → Validación**
