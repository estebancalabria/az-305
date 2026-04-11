## 🧑‍🏫 Guía Docente – AZ-305

### ✅ Checklist corto y fácil de seguir

* Azure Container Instances (ACI)
* Azure Kubernetes Service (AKS)
* Azure Functions
* Azure Logic Apps
* Optimización de arquitecturas y selección de servicios

---

## 🗂️ Estructura Sugerida de la Clase

### 1. Diseño para Azure Container Instances (ACI)

**Objetivo:** Comprender cuándo utilizar Azure Container Instances para ejecutar contenedores de forma rápida y sin necesidad de orquestación.

**Qué explicar:**

* ACI como la forma más simple y rápida de ejecutar un contenedor en Azure.
* Ejecución bajo demanda sin gestión de máquinas virtuales ni orquestadores.
* Modelo de facturación por segundos.
* Portabilidad y consistencia de los contenedores entre entornos.
* Uso de registros de contenedores y escaneo de imágenes para seguridad.

**Casos de uso:**

* Procesos de corta duración o tareas programadas.
* Pruebas y entornos de desarrollo.
* Escenarios de “burst” o picos de demanda.
* Ejecución aislada de servicios, como Azure AI en contenedores para cumplir requisitos de residencia de datos.

**Hacer hincapié en:**

* Simplicidad y rapidez de despliegue.
* Aislamiento y cumplimiento normativo.
* Limitaciones: ausencia de características de orquestación como rolling updates o service discovery.
* Diferencias entre contenedores y máquinas virtuales en términos de aislamiento y control del sistema operativo.

---

### 2. Diseño para Azure Kubernetes Service (AKS)

**Objetivo:** Entender cómo AKS permite la orquestación y gestión de aplicaciones basadas en microservicios.

**Qué explicar:**

* AKS como plataforma administrada para la orquestación de contenedores.
* Automatización del despliegue, escalado y recuperación de contenedores.
* Responsabilidades compartidas: Azure gestiona el plano de control y el cliente los nodos de trabajo.
* Uso de registros privados de contenedores.

**Aspectos de diseño:**

* **Escalabilidad:**

  * Escalado a nivel de aplicación (pods).
  * Escalado a nivel de infraestructura (nodos).
* **Aislamiento:**

  * Uso de node pools para separar cargas de trabajo.
* **Seguridad:**

  * Integración con Microsoft Entra ID para autenticación y autorización.
  * Uso de Microsoft Defender for Containers.
  * Implementación de una estrategia de ingreso (ingress).
* **Observabilidad:**

  * Integración con Azure Monitor y Container Insights.
* **Alta disponibilidad y resiliencia:**

  * Implementaciones multi-región.
  * Estrategias activo-activo y activo-pasivo.
  * Uso de regiones emparejadas y replicación de datos.

**Caso de referencia:**

* Arquitectura basada en microservicios para vehículos conectados, con distribución global de actualizaciones y uso de Azure Cosmos DB para alta disponibilidad y baja latencia.

**Hacer hincapié en:**

* AKS como solución ideal para aplicaciones complejas y basadas en microservicios.
* Flexibilidad y escalabilidad a cambio de una mayor responsabilidad operativa.
* Diferencia entre ACI y AKS en términos de orquestación.

---

### 3. Diseño para Azure Functions

**Objetivo:** Comprender el uso de Azure Functions como solución serverless para cargas event-driven.

**Qué explicar:**

* Ejecución de pequeñas unidades de código en respuesta a eventos o programaciones.
* Aprovisionamiento automático de recursos y escalado dinámico.
* Soporte para patrones de microservicios y automatización.

**Casos de uso:**

* Procesamiento de eventos (por ejemplo, carga de archivos).
* Automatización de tareas programadas.
* Integración entre servicios (glue code).
* APIs ligeras.

**Buenas prácticas:**

* Evitar funciones de larga duración; utilizar Durable Functions cuando sea necesario.
* Implementar código defensivo con reintentos y manejo de errores.
* Organizar funciones para optimizar el rendimiento y el escalado.
* Incorporar monitoreo y telemetría.

**Hacer hincapié en:**

* Modelo de pago por ejecución.
* Alta escalabilidad y eficiencia en costos.
* Idoneidad para arquitecturas event-driven.

---

### 4. Diseño para Azure Logic Apps

**Objetivo:** Entender cómo Logic Apps facilita la automatización e integración de procesos empresariales mediante un enfoque low-code.

**Qué explicar:**

* Plataforma de orquestación de flujos de trabajo orientada a la integración.
* Desarrollo mediante diseñador visual con enfoque low-code/no-code.
* Disponibilidad de más de 1.400 conectores para servicios y aplicaciones.
* Integración con Azure API Management y Microsoft Entra ID para escenarios empresariales.

**Casos de uso:**

* Automatización de procesos de negocio.
* Integración B2B y entre sistemas heterogéneos.
* Flujos de aprobación y notificaciones.
* Orquestación de servicios backend.

**Arquitectura de referencia:**

* Cliente autenticado mediante Microsoft Entra ID.
* Exposición de APIs a través de Azure API Management.
* Orquestación de procesos mediante Logic Apps.
* Conectividad con sistemas backend en Azure o on-premises.

**Hacer hincapié en:**

* Diferencia entre Logic Apps y Azure Functions:

  * Logic Apps: orquestación e integración con enfoque visual.
  * Functions: lógica personalizada basada en código.
* Uso combinado de ambos servicios para soluciones empresariales completas.
* Visibilidad y trazabilidad de los flujos de trabajo.

---

### 5. Optimización de Arquitecturas y Selección de Servicios

**Objetivo:** Aplicar los servicios de cómputo adecuados para optimizar una arquitectura de tres capas.

**Qué explicar:**

* Modernización de una aplicación tradicional:

  * **Frontend:** hospedado en Azure App Service.
  * **Middle Tier:** implementado con Azure Functions para lógica basada en eventos y reducción de costos.
  * **Backend:** uso de servicios PaaS como Azure SQL Database.
* Implementación de una Virtual Network o arquitectura hub-and-spoke para comunicaciones seguras.
* Protección mediante Application Gateway con Web Application Firewall.
* Uso de Private Endpoints para reforzar la seguridad.

**Hacer hincapié en:**

* Optimización de costos mediante el uso de servicios serverless.
* Selección del servicio de cómputo según las características de cada capa.
* Alineación con los pilares del Well-Architected Framework.
* Asociación de servicios con casos de uso:

  * Virtual Machines: control total del sistema operativo.
  * App Services: aplicaciones web y móviles.
  * Container Instances: ejecución de contenedores independientes.
  * Azure Kubernetes Service: orquestación de contenedores.
  * Azure Functions: tareas programadas y procesamiento de mensajes.
  * Azure Logic Apps: flujos de trabajo e integración basada en eventos.
