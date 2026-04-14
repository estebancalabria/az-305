### Migración a Azure – Cloud Adoption Framework y Azure Migration Framework (Resumen integrado profesional)

Este contenido aborda el rol del **Azure Architect** en el diseño de estrategias de migración hacia Azure, enfocadas en la evaluación, planificación, selección de herramientas, migración (online y offline), optimización y monitoreo de cargas de trabajo (máquinas virtuales, bases de datos, aplicaciones y datos estructurados y no estructurados) desde entornos on-premises hacia la nube.

---

## Contexto general de migración

Las organizaciones con infraestructura on-premises gestionan completamente sus datacenters (hardware, software y aplicaciones), lo que puede generar limitaciones en escalabilidad, agilidad y velocidad de entrega. Esto impulsa la adopción de estrategias de migración y modernización hacia la nube.

El objetivo es definir el enfoque adecuado para migrar y modernizar workloads, equilibrando riesgo, costo, complejidad y valor de negocio.

---

## Cloud Adoption Framework (CAF)

El **Microsoft Cloud Adoption Framework for Azure** proporciona recomendaciones, buenas prácticas y herramientas para guiar la adopción de Azure.

### Ciclo de adopción:

* Strategy (Estrategia)
* Plan (Planificación)
* Ready (Preparación)
* Adopt (Migración y modernización)
* Govern (Gobierno)
* Manage (Gestión)

Permite alinear personas, procesos y tecnología en la transformación cloud.

---

## Planificación de migración

Antes de migrar, se define un plan que incluye:

* Identificación de workloads
* Selección de herramientas
* Estrategia de migración
* Optimización post-migración
* Evaluación técnica y de negocio

---

## Azure Migration Framework

Se organiza en cuatro etapas:

### 1. Assess (Evaluar)

* Inventario de aplicaciones, servidores y datos
* Análisis de dependencias
* Involucramiento de stakeholders
* Estimación de costos con Azure TCO Calculator
* Selección de herramientas

### 2. Migrate (Migrar)

* Despliegue de infraestructura en Azure
* Migración de aplicaciones y datos
* Uso de Azure Migrate y Database Migration Service
* Pilotos con workloads no críticos
* Descomisionamiento de on-premises
* Backups en Azure Blob Storage

### 3. Optimize (Optimizar)

* Análisis de costos
* Microsoft Cost Management
* Azure Advisor para recomendaciones
* Mejora de rendimiento y eficiencia

### 4. Monitor (Monitorear)

* Azure Monitor para métricas, logs y alertas
* Microsoft Sentinel para seguridad
* Monitoreo en Windows y Linux

---

## Estrategias de migración (Migration patterns)

* **Rehost:** lift & shift sin cambios
* **Refactor:** ajustes mínimos hacia PaaS
* **Rearchitect:** rediseño para escalabilidad cloud
* **Rebuild:** reconstrucción cloud-native completa

---

## Selección de herramientas de migración

Tras la evaluación, se seleccionan herramientas según el workload:

* Azure Migrate (assessment y migración de VMs, apps y datos)
* Database Migration Service (migración de bases de datos)
* App Service Migration Assistant
* SQL Server Data Migration Assistant (DMA)
* Azure Data Box
* Azure Resource Mover

---

## Azure Resource Mover

Permite mover recursos dentro de Azure entre:

* Suscripciones
* Resource Groups
* Regiones

### Beneficios:

* Centralización de movimientos
* Identificación de dependencias
* Testing previo al movimiento
* Optimización post-migración

---

## Migración de bases de datos (Azure Database Migration Service)

* Migración a Azure SQL DB, SQL MI, SQL VM, Cosmos DB, MySQL y PostgreSQL
* Modos:

  * **Offline:** con downtime
  * **Online:** sincronización continua con mínimo impacto
* Consideraciones: compatibilidad, schemas, logins, automatización e integración

---

## Migración de almacenamiento y datos no estructurados

### Azure Storage Mover

* Migración de archivos y carpetas a Azure Storage
* Soporte SMB y NFS
* Mantiene metadatos (ACLs, timestamps, atributos)
* Uso de agentes locales (VMs cercanas al origen)
* Arquitectura híbrida
* Ideal para migraciones repetitivas o lift-and-shift
* Puede combinarse con Azure Data Box para transferencia inicial offline

### Azure File Sync

* Extiende Azure Files a servidores Windows
* Permite caching local de archivos
* Casos de uso:

  * Reemplazo de file servers/NAS
  * Backup y disaster recovery
  * Migración de shares a cloud
  * Reemplazo de DFS

---

## Migración offline de datos

### Azure Import/Export Service

* Transferencia de datos mediante discos físicos enviados a Azure
* Usado para import/export de grandes volúmenes
* Requiere BitLocker y logística propia (FedEx/DHL)
* Solo exporta desde Azure Blob Storage (no Azure Files)
* Casos de uso:

  * Migraciones one-time
  * Backup
  * Recovery
  * Distribución de datos

---

### Azure Data Box

Servicio físico administrado por Microsoft para mover grandes volúmenes de datos:

* Dispositivos de 120 TB a 525 TB
* Appliance seguro y tamper-proof
* Microsoft gestiona logística de envío
* Gestión desde Azure Portal (Data Box Service)
* Interfaz web local para configuración y monitoreo
* Cifrado gestionado por el cliente

### Casos de uso:

* Migraciones masivas (>40 TB)
* Transferencias iniciales bulk + sync incremental
* Entornos con conectividad limitada
* Movimientos periódicos (IoT, backups, media, etc.)

### Comparación clave:

| Característica | Import/Export  | Data Box           |
| -------------- | -------------- | ------------------ |
| Medio físico   | Discos propios | Appliance dedicado |
| Logística      | Cliente        | Microsoft          |
| Facilidad      | Media          | Alta               |
| Escala         | Media          | Alta               |
| Integración    | Baja           | Alta               |

---

## Proceso de migración por workload

* **Assess:** análisis técnico y económico
* **Deploy:** implementación en Azure
* **Release:** validación y producción

---

## Relevancia

Este contenido es clave para el **AZ-305**, especialmente en el diseño de soluciones de migración completas en Azure, incluyendo cómputo, bases de datos, almacenamiento estructurado y no estructurado, y transferencia de grandes volúmenes de datos online y offline.
