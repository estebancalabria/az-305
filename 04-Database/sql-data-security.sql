## 🔐 Resumen de Seguridad de Datos en Azure SQL

La seguridad en **Azure SQL** se basa en un enfoque de **defensa en profundidad (Defense in Depth)**, que protege la información en todas sus etapas: **en reposo**, **en tránsito** y **en uso**, además de incorporar controles de **red**, **identidad**, **monitoreo** y **gobernanza**.

---

### 🛡️ 1. Seguridad de Red (Network Security)

**Objetivo:** Restringir el acceso al servicio de base de datos únicamente a redes y recursos autorizados.

**Principales mecanismos:**

* **Firewall de Azure SQL:** Permite definir reglas de acceso por direcciones IP específicas.
* **Private Endpoint (Azure Private Link):** Proporciona acceso privado al servicio a través de una red virtual, evitando la exposición a Internet.
* **Service Endpoints:** Extienden la identidad de la red virtual hacia el servicio de Azure SQL, mejorando la seguridad del tráfico.
* **Integración con redes virtuales (VNet):** Especialmente relevante para **Azure SQL Managed Instance**.

**Beneficios:**

* Reducción de la superficie de ataque.
* Aislamiento del tráfico de red.
* Cumplimiento de requisitos de seguridad y normativas.

---

### 👤 2. Identidad y Control de Acceso (Identity & Access Management)

**Objetivo:** Garantizar que solo usuarios y aplicaciones autorizados puedan acceder a los datos.

**Principales mecanismos:**

* **Autenticación con Microsoft Entra ID (antes Azure AD):**

  * Permite la gestión centralizada de identidades.
  * Soporta **Single Sign-On (SSO)** y **Multi-Factor Authentication (MFA)**.
* **Autenticación SQL:** Alternativa tradicional basada en usuario y contraseña.
* **Control de Acceso Basado en Roles (RBAC):** Permite asignar permisos de forma granular.
* **Principio de mínimo privilegio:** Asegura que cada usuario tenga únicamente los permisos necesarios.

**Beneficios:**

* Mayor control y trazabilidad.
* Simplificación de la administración de identidades.
* Integración con políticas corporativas de seguridad.

---

### 🔒 3. Protección de Datos

#### 🔹 a. Datos en Reposo

* **Transparent Data Encryption (TDE):**

  * Cifra automáticamente los archivos de datos, logs y backups.
  * Utiliza claves administradas por Microsoft o por el cliente (**Customer-Managed Keys**) almacenadas en **Azure Key Vault**.

**Beneficio:** Protección frente a accesos no autorizados a los archivos físicos.

#### 🔹 b. Datos en Tránsito

* **Transport Layer Security (TLS):**

  * Cifra la comunicación entre clientes y el servidor de base de datos.
  * Previene ataques de intercepción como “man-in-the-middle”.

**Beneficio:** Garantiza la confidencialidad e integridad de la información durante la transmisión.

#### 🔹 c. Datos en Uso

* **Always Encrypted:**

  * Permite cifrar columnas sensibles (por ejemplo, números de tarjetas o identificadores personales).
  * Las claves permanecen en el cliente, evitando que incluso los administradores de la base puedan ver los datos en texto claro.
  * Soporta **secure enclaves** para habilitar operaciones más avanzadas sobre datos cifrados.

**Beneficio:** Protección de información altamente sensible incluso durante su procesamiento.

---

### 🕵️ 4. Protección y Monitoreo de Amenazas

**Objetivo:** Detectar y responder a actividades sospechosas o vulnerabilidades.

* **Microsoft Defender for Cloud (Defender for SQL):**

  * Evaluaciones de vulnerabilidad.
  * Detección de amenazas y comportamientos anómalos.
  * Recomendaciones de seguridad.
  * Alertas ante posibles ataques (inyección SQL, accesos inusuales, etc.).

* **Auditoría de Azure SQL:**

  * Registro de eventos de acceso y modificaciones.
  * Integración con **Azure Monitor**, **Log Analytics** y **Microsoft Sentinel** para análisis y respuesta ante incidentes.

**Beneficios:**

* Mejora de la postura de seguridad.
* Cumplimiento normativo.
* Capacidad de respuesta ante incidentes.

---

### 🕶️ 5. Protección de Datos Sensibles

* **Dynamic Data Masking (DDM):**

  * Oculta datos sensibles en tiempo de consulta para usuarios no privilegiados.
  * Ejemplos: enmascaramiento de correos electrónicos o números de tarjetas.

* **Row-Level Security (RLS):**

  * Restringe el acceso a filas específicas según el contexto del usuario.
  * Ideal para aplicaciones **multi-tenant**.

* **Clasificación y Etiquetado de Datos:**

  * Permite identificar y clasificar datos sensibles para facilitar el cumplimiento normativo.

**Beneficios:**

* Control granular del acceso a la información.
* Protección de la privacidad.
* Soporte para regulaciones como GDPR.

---

### 🗂️ 6. Gobernanza y Cumplimiento

* **Microsoft Purview:**

  * Herramienta de gobernanza que permite el descubrimiento, clasificación y linaje de los datos.
  * Facilita auditorías y cumplimiento normativo.

**Beneficios:**

* Visibilidad completa del ciclo de vida de los datos.
* Mejora de la gestión y cumplimiento de políticas corporativas.

---

## 🧭 Resumen Integrado

| Capa de Seguridad       | Tecnologías Clave                             | Objetivo Principal                                |
| ----------------------- | --------------------------------------------- | ------------------------------------------------- |
| **Red**                 | Firewall, Private Endpoint, Service Endpoints | Restringir el acceso                              |
| **Identidad**           | Entra ID, RBAC, MFA                           | Controlar quién accede                            |
| **Datos en reposo**     | TDE, Customer-Managed Keys                    | Proteger archivos físicos                         |
| **Datos en tránsito**   | TLS                                           | Asegurar la comunicación                          |
| **Datos en uso**        | Always Encrypted                              | Proteger datos sensibles durante el procesamiento |
| **Monitoreo**           | Defender for Cloud, Auditoría                 | Detectar amenazas                                 |
| **Protección de datos** | DDM, RLS, Clasificación                       | Limitar exposición de información                 |
| **Gobernanza**          | Microsoft Purview                             | Cumplimiento y gestión                            |

---

> **“La seguridad en Azure SQL se basa en una estrategia de defensa en profundidad: proteger la red, controlar la identidad y cifrar los datos en reposo, en tránsito y en uso, complementado con monitoreo continuo y gobernanza.”**

