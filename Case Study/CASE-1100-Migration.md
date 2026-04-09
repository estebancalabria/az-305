# 🧩 Caso de estudio docente: Migración a Azure

## 🏢 Contexto

* **EstebanCalabria Industries** quiere migrar su infraestructura on-premises a Azure.
* Se busca **reducir costos**, **mejorar escalabilidad**, **garantizar alta disponibilidad**, **modernizar aplicaciones** y **proteger datos corporativos**.
* Los sistemas actuales incluyen:

  * Servidores web y aplicaciones internas.
  * Bases de datos SQL Server.
  * Almacenamiento de archivos en NAS.
  * Scripts manuales de integración de datos.

---

## 📋 Objetivos del laboratorio

1. Evaluar la infraestructura on-premises y planificar la migración.
2. Diseñar la arquitectura target en Azure para:

   * Aplicaciones web.
   * Bases de datos.
   * Almacenamiento de archivos.
   * Redes y conectividad.
3. Aplicar buenas prácticas de seguridad, escalabilidad y resiliencia.
4. Incorporar los **pilares del Well Architected Framework**.

---

## 📊 Actividades y guía docente

### 1️⃣ Inventario y evaluación de servidores

**Qué mostrar en Azure:**

* Abrir **Azure Migrate** → crear un proyecto de migración.
* Agregar servidores y dependencias de la infraestructura on-premises.
* Ejecutar **evaluaciones de compatibilidad, tamaño y costos**.

**Qué explicar:**

* Lift & Shift vs modernización.
* Identificación de servidores críticos y dependencias.
* Estimación de costos y planificación de recursos target en Azure.

---

### 2️⃣ Migración de aplicaciones web

**Qué mostrar en Azure:**

* Abrir **App Services** → crear **App Service Plan** y **Web App**.
* Configurar **slots de staging** y pruebas sin downtime.
* Mostrar **escalado automático** según carga.

**Qué explicar:**

* Ventajas de PaaS frente a máquinas virtuales.
* Cómo App Services asegura alta disponibilidad y balanceo de carga.
* Integración de seguridad: **TLS/HTTPS**, **Azure AD Authentication**, **firewall de aplicación**.

---

### 3️⃣ Migración de bases de datos

**Qué mostrar en Azure:**

* Abrir **Azure SQL Database** o **SQL Managed Instance**.
* Crear la base de datos target, habilitar **geo-replicación**.
* Configurar **backups automáticos**, **firewall y reglas de acceso**.

**Qué explicar:**

* Diferencia IaaS vs PaaS.
* Beneficios de geo-replicación, alta disponibilidad y backups automáticos.
* Migración de datos: **Data Migration Assistant**, **bacpac**, **Azure Database Migration Service**.
* Estrategias para no tener secretos en el código de aplicaciones (Managed Identity).

---

### 4️⃣ Migración de almacenamiento de archivos

**Qué mostrar en Azure:**

* Abrir **Azure Blob Storage** → crear un **Storage Account**.
* Configurar **contenedores**, permisos **RBAC** y **SAS tokens**.
* Seleccionar **tipo de redundancia**: LRS, GRS o RA-GRS según criticidad.

**Qué explicar:**

* Ventajas frente a NAS tradicional.
* Acceso seguro con **Shared Access Signatures** y **roles de Azure AD**.
* Integración con aplicaciones para servir contenido dinámico o procesamiento serverless.

---

### 5️⃣ Migración de datos y procesos batch

**Qué mostrar en Azure:**

* Abrir **Azure Data Factory** para reemplazar scripts FTP.
* Configurar pipelines para ingestión y procesamiento de archivos en Blob Storage.
* Monitorizar ejecuciones y alertas de fallos.

**Qué explicar:**

* Automatización de procesos batch.
* Reemplazo de FTP por almacenamiento seguro.
* Escalabilidad y retry automático de pipelines.

---

### 6️⃣ Red y conectividad

**Qué mostrar en Azure:**

* Abrir **Virtual Networks (VNet)** → subnets, **NSGs**.
* Configurar **VPN Gateway** o **ExpressRoute** para conectividad híbrida.
* Mostrar **Azure Front Door** o **Application Gateway** para apps públicas.
* Integrar **Azure Firewall** y reglas de tráfico.

**Qué explicar:**

* Segmentación de tráfico interno y externo.
* Balanceo de carga y failover regional.
* Seguridad de comunicaciones y acceso controlado.

---

### 7️⃣ Monitoreo y operación

**Qué mostrar en Azure:**

* Abrir **Azure Monitor**, **Log Analytics** y dashboards de recursos.
* Configurar alertas para performance, disponibilidad y errores.
* Revisar métricas de escalado automático y utilización de recursos.

**Qué explicar:**

* Cómo detectar problemas antes que afecten usuarios.
* Ventajas de centralizar logs y métricas.
* Integración con procesos de soporte y gobernanza.

---

### 8️⃣ Seguridad y cumplimiento

**Qué mostrar / explicar:**

* **RBAC y Azure AD**: acceso granular a recursos.
* **Managed Identities** para aplicaciones sin secretos hardcodeados.
* **Encryption at rest y in transit**.
* Auditoría y reportes semanales sobre cumplimiento.

---

### 9️⃣ Well Architected Framework

**Qué explicar:**

* **Confiabilidad**: geo-replicación, backups, escalado automático.
* **Seguridad**: RBAC, firewalls, cifrado.
* **Optimización de costos**: PaaS y serverless.
* **Eficiencia operativa**: monitorización, Azure Migrate, Data Factory.
* **Excelencia en desempeño**: Front Door, Application Gateway, escalado automático.

---

### 🔗 Demostración docente

Durante la demo, se puede mostrar:

* Proyecto de Azure Migrate y evaluación de servidores.
* Creación de **App Service** y **Azure SQL Database**.
* Configuración de **Blob Storage** y Data Factory pipelines.
* Red virtual, subnets y Application Gateway.
* Alertas y dashboards en Azure Monitor.

**Explicación final:**

* Cada componente explicado en contexto.
* Por qué se eligió PaaS sobre IaaS.
* Cómo se asegura alta disponibilidad, seguridad, escalabilidad y costos.
¿Querés que haga eso?
