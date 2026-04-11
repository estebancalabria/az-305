## 🧑‍🏫 Guía Docente – AZ-305 - Compute pt1

### ✅ Checklist corto y fácil de seguir

* Selección de servicios de cómputo en Azure
* Azure Virtual Machines
* Azure Batch
* Azure App Services
* Modernización de aplicaciones y arquitectura de referencia

---

## 🗂️ Estructura Sugerida de la Clase

### 1. Selección de Servicios de Cómputo

**Objetivo:** Comprender cómo elegir el servicio de cómputo adecuado según las necesidades del workload.

**Qué explicar:**

* La elección del cómputo como una decisión del modelo operativo: **control vs. conveniencia** y **predictibilidad vs. elasticidad**.
* Analogía del vehículo: cada servicio está diseñado para un propósito específico.
* Importancia de analizar el comportamiento de la aplicación: uso de CPU, memoria, I/O y necesidades de escalabilidad.
* Uso de la **Azure Compute Decision Tree** y el **Azure Architecture Center** como guías de referencia.

**Hacer hincapié en:**

* Diferencias entre **IaaS, PaaS y Serverless**.
* Selección de servicios según el tipo de aplicación:

  * **Virtual Machines**: control total del sistema operativo.
  * **App Service**: aplicaciones web y APIs administradas.
  * **Azure Functions / Logic Apps**: cargas event-driven.
  * **ACI / AKS**: contenedores y microservicios.
  * **Azure Batch**: procesamiento paralelo a gran escala.

---

### 2. Diseño de Soluciones con Azure Virtual Machines

**Objetivo:** Entender cuándo y cómo utilizar máquinas virtuales en Azure.

**Qué explicar:**

* Máquinas virtuales como opción de **máximo control** y flexibilidad.
* Escenarios típicos: migraciones lift-and-shift, aplicaciones legacy y necesidades específicas del sistema operativo.
* Responsabilidades del modelo **Infrastructure as a Service (IaaS)**.

**Aspectos de diseño:**

* **Planificación inicial**: región, suscripción y resource group.
* **Redes**:

  * Implementación dentro de una **Virtual Network**.
  * Segmentación mediante **subnets**.
  * Uso de **Network Security Groups (NSG)**.
  * Acceso seguro mediante **Azure Bastion**.
  * Salida a internet mediante **NAT**.
* **Almacenamiento**:

  * Uso de **Managed Disks** para sistema operativo y datos.
  * Consideraciones de rendimiento y caching.
* **Imágenes**:

  * Uso del **Azure Marketplace** para desplegar stacks completos.
* **Nomenclatura y gobernanza**:

  * Definición de convenciones de nombres y su cumplimiento mediante **Azure Policy**.
* **Monitoreo y actualizaciones**:

  * Integración con **Azure Monitor** y soluciones de **Update Management** desde el primer día.

**Selección de tamaños de VM:**

* **General Purpose**: equilibrio entre CPU y memoria.
* **Compute Optimized**: aplicaciones intensivas en CPU.
* **Memory Optimized**: bases de datos y análisis en memoria.
* **Storage Optimized**: alto rendimiento de disco e IOPS.
* **GPU**: renderizado y machine learning.
* **High Performance Computing (HPC)**: cargas científicas y financieras.
* Uso de **Azure Copilot** para recomendar tamaños adecuados.

**Alta disponibilidad y escalabilidad:**

* **Single VM**: 99.9% SLA.
* **Availability Sets**: 99.95% SLA.
* **Availability Zones**: mayor resiliencia dentro de una región.
* **Virtual Machine Scale Sets (VMSS)** para escalado horizontal y elasticidad.

**Arquitectura de referencia:**

* **Application Gateway con WAF** para la capa de entrada.
* Balanceo de carga entre VMs de frontend.
* Comunicación segura entre frontend y backend mediante **Load Balancer** y direcciones IP privadas.
* Administración segura a través de **Azure Bastion**.

**Hacer hincapié en:**

* “Con gran poder viene gran responsabilidad”: mayor control implica mayor carga operativa.
* Elegir VMs solo cuando se requiera control del sistema operativo.
* Importancia de planificar la red y la arquitectura antes del despliegue.

---

### 3. Diseño de Soluciones con Azure Batch

**Objetivo:** Comprender el uso de Azure Batch para procesamiento paralelo a gran escala.

**Qué explicar:**

* Azure Batch como solución para **High Performance Computing (HPC)** administrado.
* Adecuado para cargas que pueden dividirse en múltiples tareas independientes.
* Conceptos clave:

  * **Job**: conjunto de tareas.
  * **Task**: unidad de trabajo.
  * **Pool**: conjunto de máquinas virtuales donde se ejecutan las tareas.

**Casos de uso:**

* Renderizado de imágenes o video.
* Simulaciones científicas o financieras.
* Modelos actuariales.
* Procesamiento masivo de datos.

**Beneficios:**

* Escalado automático de recursos.
* Reintento automático de tareas fallidas.
* Aprovisionamiento y desmantelamiento automático de VMs.
* Optimización de costos al pagar solo por el tiempo de cómputo utilizado.

**Hacer hincapié en:**

* Ideal para cargas **masivamente paralelas**.
* Reduce la complejidad operativa en comparación con la gestión manual de clústeres HPC.
* Ejemplo real: aceleración de modelos actuariales con mejoras significativas en tiempo y eficiencia.

---

### 4. Diseño de Soluciones con Azure App Services

**Objetivo:** Entender cómo utilizar Azure App Service para aplicaciones web y APIs administradas.

**Qué explicar:**

* Servicio **Platform as a Service (PaaS)** para hospedar aplicaciones web sin gestionar servidores.
* Azure administra la infraestructura, mientras el equipo se enfoca en el código.
* Soporte para múltiples lenguajes y frameworks.
* Integración con **GitHub** y **Azure DevOps** para despliegue continuo.

**Componentes clave:**

* **App Service Plan**: define los recursos de cómputo compartidos.
* **Deployment Slots**: permiten despliegues seguros mediante staging y swap.
* **WebJobs**: ejecución de tareas en segundo plano.
* **Custom Containers**: soporte para runtimes no nativos.
* **Seguridad integrada**: autenticación y autorización con **Microsoft Entra ID**.

**Arquitectura segura con Private Link:**

* **Application Gateway con WAF** como punto de entrada.
* Uso de **Private Endpoints** para comunicación privada.
* Resolución de nombres mediante **Private DNS Zones**.
* **Virtual Network Integration** para acceso seguro a servicios como Key Vault, Storage y SQL Database.

**Hacer hincapié en:**

* Ideal para aplicaciones web y APIs que no requieren control del sistema operativo.
* Reducción significativa del esfuerzo operativo frente a soluciones basadas en VMs.
* Importancia de considerar el App Service Plan como unidad de costo.

---

### 5. Modernización de una Aplicación de Tres Capas

**Objetivo:** Aplicar los conceptos de selección de servicios de cómputo en un escenario real.

**Qué explicar:**

* Migración y modernización de una aplicación tradicional de tres capas:

  * **Frontend**: aplicación web con picos de demanda.
  * **Middle Tier**: procesamiento de solicitudes con necesidad de escalabilidad.
  * **Backend**: base de datos SQL con requisitos de alta disponibilidad en una única región.

**Diseño de la solución:**

* Implementación de una **Virtual Network** con subnets para cada capa.
* Protección mediante **Network Security Groups**.
* Uso de **Application Gateway con WAF** para gestionar el tráfico de entrada.
* **Virtual Machine Scale Sets** para el frontend y el middle tier, permitiendo autoescalado y alta disponibilidad.
* Comunicación segura con la base de datos a través de **Load Balancer** y direcciones IP privadas.
* Cumplimiento de requisitos legales manteniendo el backend en una única región.

**Hacer hincapié en:**

* Importancia de la **elasticidad** para manejar picos de demanda.
* Selección del servicio de cómputo según las características de cada capa.
* Alineación con los pilares del **Well-Architected Framework**: eficiencia, resiliencia y optimización de costos.

