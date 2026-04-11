## 🧑‍🏫 Guía Docente – AZ-305

### ✅ Checklist corto y fácil de seguir

* Diferencias entre mensajes y eventos
* Azure Storage Queues
* Azure Service Bus (Queues y Topics)
* Azure Event Grid
* Azure Event Hubs e IoT Hub
* Azure Managed Redis (caching)
* Azure API Management
* Application Lifecycle: IaC y Azure App Configuration
* Aplicación práctica del diseño

---

## 🗂️ Estructura Sugerida de la Clase

### 1. Diferenciación entre Mensajes y Eventos

**Objetivo:** Comprender las diferencias conceptuales entre mensajería y arquitectura basada en eventos para seleccionar el servicio adecuado.

**Qué explicar:**

* **Eventos:**

  * Representan la notificación de que “algo ocurrió”.
  * No requieren que exista un consumidor para que el evento tenga validez.
  * Permiten múltiples suscriptores.
  * Ejemplo: un usuario inicia sesión en una aplicación.

* **Mensajes:**

  * Contienen información que debe ser procesada.
  * Se espera que al menos un consumidor procese el mensaje.
  * Garantizan la entrega y, en algunos casos, el orden.
  * Ejemplo: la solicitud de eliminación de una cuenta de usuario.

**Hacer hincapié en:**

* Eventos → **Notificación**.
* Mensajes → **Acción obligatoria**.
* La correcta identificación del patrón impacta directamente en la arquitectura.

---

### 2. Diseño de Soluciones de Mensajería

**Objetivo:** Seleccionar el servicio de mensajería adecuado según los requisitos de confiabilidad y complejidad.

#### 🔹 Azure Storage Queues

**Qué explicar:**

* Solución simple y altamente escalable.
* Acceso mediante REST.
* Modelo basado en **polling**.
* Ideal para procesamiento asincrónico de grandes volúmenes.

**Casos de uso:**

* Procesamiento de pedidos en e-commerce.
* Backlogs de tareas.
* Escenarios donde no se requieren características avanzadas.

#### 🔹 Azure Service Bus

**Qué explicar:**

* Plataforma de mensajería empresarial con mayores garantías.
* Soporte para:

  * **FIFO** mediante sesiones.
  * **Dead-lettering**.
  * **Transacciones**.
  * **Entrega push**.
  * **Detección de duplicados**.

**Modalidades:**

| Característica | Service Bus Queue        | Service Bus Topic       |
| -------------- | ------------------------ | ----------------------- |
| Comunicación   | 1 a 1                    | 1 a N                   |
| Escenario      | Procesamiento de órdenes | Publicación/Suscripción |
| Garantías      | Altas                    | Altas                   |

**Hacer hincapié en:**

* **Storage Queues:** simplicidad y bajo costo.
* **Service Bus:** confiabilidad y características empresariales.
* **Topics:** distribución de mensajes a múltiples consumidores.

---

### 3. Diseño de Soluciones Basadas en Eventos

**Objetivo:** Diseñar arquitecturas reactivas y desacopladas utilizando servicios de eventos.

#### 🔹 Azure Event Grid

**Qué explicar:**

* Servicio de **enrutamiento de eventos**.
* Modelo **push**.
* Integración nativa con servicios de Azure.
* Ideal para automatización y arquitecturas serverless.

**Casos de uso:**

* Procesamiento de archivos cargados en Blob Storage.
* Automatización de operaciones.
* Notificaciones en tiempo real.

#### 🔹 Azure Event Hubs

**Qué explicar:**

* Plataforma de **ingestión de eventos en streaming** a gran escala.
* Modelo **pull** basado en particiones.
* Adecuado para telemetría y análisis de grandes volúmenes de datos.

**Casos de uso:**

* IoT y sensores.
* Logging y monitoreo.
* Integración con Azure Stream Analytics.

#### 🔹 Azure IoT Hub

**Qué explicar:**

* Especializado en comunicación con dispositivos IoT.
* Soporte para **identidad por dispositivo** y **comunicación bidireccional**.
* Capacidades de administración de dispositivos.

**Comparación de servicios:**

| Servicio      | Uso Principal               |
| ------------- | --------------------------- |
| Storage Queue | Mensajería simple           |
| Service Bus   | Mensajería empresarial      |
| Event Grid    | Enrutamiento de eventos     |
| Event Hubs    | Ingesta de streaming        |
| IoT Hub       | Gestión de dispositivos IoT |

**Hacer hincapié en:**

* Diferencias entre modelos **push** y **pull**.
* Selección del servicio según el patrón arquitectónico requerido.

---

### 4. Optimización de Aplicaciones

**Objetivo:** Mejorar el rendimiento, la escalabilidad y la seguridad de las aplicaciones.

#### 🔹 Azure Managed Redis (Caching)

**Qué explicar:**

* Almacenamiento en memoria con **baja latencia**.
* Mejora el rendimiento y reduce la carga del backend.
* Permite mantener aplicaciones **stateless**.
* Soporte para alta disponibilidad y escalabilidad.

**Casos de uso:**

* Caché de datos frecuentemente accedidos.
* Almacenamiento de sesiones.
* Datos para análisis en tiempo real.

#### 🔹 Azure API Management

**Qué explicar:**

* Puerta de entrada centralizada para APIs.
* Aplicación de políticas de:

  * Autenticación y autorización.
  * Limitación de tasa (**throttling**).
  * Transformación de solicitudes y respuestas.
  * Monitoreo y analítica.

**Arquitectura recomendada:**

* **Application Gateway + WAF** como punto de entrada.
* **API Management** en modo interno.
* **Private Endpoints** para comunicación segura con los backends.
* Integración con **Azure Key Vault** para la gestión de secretos.

**Hacer hincapié en:**

* Centralización de la gobernanza de APIs.
* Mejora de la seguridad y cumplimiento normativo.
* Protección frente a tráfico malicioso.

---

### 5. Ciclo de Vida de las Aplicaciones

**Objetivo:** Garantizar despliegues consistentes, seguros y automatizados.

#### 🔹 Infraestructura como Código (IaC)

**Qué explicar:**

* Definición de la infraestructura mediante archivos declarativos.
* Herramientas principales:

  * **ARM Templates**
  * **Bicep**
  * **Terraform**
  * **GitHub Actions**
  * **Azure DevOps Pipelines**
  * **Jenkins**

**Beneficios:**

* Consistencia entre entornos.
* Prevención del **configuration drift**.
* Despliegues repetibles y auditables.
* Automatización y gobernanza.

#### 🔹 Azure App Configuration

**Qué explicar:**

* Gestión centralizada de configuraciones y **feature flags**.
* Integración con **Microsoft Entra ID** mediante identidades administradas.
* Soporte para **versionado** y **snapshots**.
* Integración con **Azure Key Vault** para secretos.

**Hacer hincapié en:**

* Separación entre código y configuración.
* Implementación de despliegues progresivos y rollback.
* Beneficios para arquitecturas de **microservicios** y **serverless**.

---

### 6. Aplicación Práctica del Diseño

**Objetivo:** Integrar los conceptos en un escenario empresarial real.

#### 🖼️ Escenario: Carga y Procesamiento de Imágenes

**Requerimientos:**

* Almacenamiento de imágenes subidas por los usuarios.
* Escaneo obligatorio de las imágenes mediante una API interna.
* Notificación por correo electrónico tras la aprobación.
* Capacidad de autoscaling y alta disponibilidad.

#### ✅ Diseño Propuesto

| Componente                 | Servicio Azure           | Justificación                             |
| -------------------------- | ------------------------ | ----------------------------------------- |
| Almacenamiento de imágenes | **Azure Blob Storage**   | Escalabilidad y almacenamiento de objetos |
| Notificación de carga      | **Azure Event Grid**     | Arquitectura reactiva                     |
| Garantía de procesamiento  | **Azure Service Bus**    | Entrega confiable de mensajes             |
| Procesamiento de imágenes  | **Azure Functions**      | Ejecución serverless y escalable          |
| Envío de correos           | **Azure Logic Apps**     | Integración rápida mediante conectores    |
| Exposición de APIs         | **Azure API Management** | Seguridad y gobernanza                    |
| Caché                      | **Azure Managed Redis**  | Mejora de rendimiento                     |

**Flujo de la solución:**

1. El usuario carga una imagen en **Azure Blob Storage**.
2. **Event Grid** detecta el evento de carga.
3. Se envía un mensaje a **Service Bus** para garantizar el procesamiento.
4. **Azure Functions** invoca la API de escaneo.
5. Tras la validación, **Logic Apps** envía un correo de confirmación al usuario.

**Hacer hincapié en:**

* Desacoplamiento de componentes mediante eventos y mensajería.
* Escalabilidad y resiliencia de la arquitectura.
* Alineación con los pilares del **Well-Architected Framework**.

---

Esta guía docente permite estructurar la clase de manera clara y didáctica, facilitando la comprensión de cómo diseñar soluciones de arquitectura de aplicaciones en Azure para el examen **AZ-305**.
