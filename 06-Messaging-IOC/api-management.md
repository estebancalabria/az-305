# 🌐 Resumen: Azure API Management (APIM)

## 📌 ¿Qué es Azure API Management?

**Azure API Management (APIM)** es un servicio totalmente administrado que actúa como la **puerta de entrada (API Gateway)** para las APIs de una organización. Permite **publicar, proteger, transformar, monitorear y gobernar** las APIs desde un único punto centralizado, facilitando su consumo por parte de aplicaciones internas, socios o desarrolladores externos.

---

## 🎯 Objetivos Principales

* **Centralizar el acceso** a los servicios backend.
* **Proteger las APIs** mediante autenticación y autorización.
* **Aplicar políticas** de control y transformación del tráfico.
* **Monitorear y analizar** el uso de las APIs.
* **Facilitar la gobernanza y el cumplimiento normativo.**
* **Simplificar la exposición de servicios** a diferentes consumidores.

---

## ⚙️ Funcionamiento General

### 🔄 Flujo de Solicitudes

1. **Cliente**: Una aplicación (web, móvil o sistema externo) realiza una solicitud a la API.
2. **Azure API Management**:

   * Valida la autenticación y autorización.
   * Aplica políticas como limitación de tasa (rate limiting), transformación de mensajes o caché.
   * Registra métricas y logs para análisis.
3. **Backend**: La solicitud es redirigida al servicio correspondiente (App Service, AKS, Functions, etc.).
4. **Respuesta**: APIM puede transformar y devolver la respuesta al cliente.

---

## 🚀 Características Principales

### 🔐 Seguridad

* Integración con **Microsoft Entra ID** (Azure AD).
* Soporte para **OAuth 2.0**, **OpenID Connect** y **JWT**.
* Uso de **suscripciones y claves de API**.
* Protección mediante **Web Application Firewall (WAF)** cuando se integra con Application Gateway.

### 📜 Políticas (Policies)

Las políticas permiten modificar el comportamiento de las APIs sin cambiar el código del backend:

* **Rate limiting y throttling**.
* **Transformación de solicitudes y respuestas** (XML/JSON).
* **Validación de tokens**.
* **Caching de respuestas**.
* **Reescritura de URLs**.
* **Registro y monitoreo**.

### 📊 Monitoreo y Analítica

* Integración con **Azure Monitor** y **Application Insights**.
* Métricas de rendimiento y uso.
* Diagnóstico y trazabilidad de solicitudes.

### 🌍 Portal para Desarrolladores

* Documentación interactiva de APIs.
* Gestión de suscripciones.
* Pruebas de APIs desde el navegador.

### 🔄 Transformación y Orquestación

* Permite desacoplar clientes y backends mediante transformaciones de mensajes.
* Facilita la modernización de aplicaciones legacy.

---

## 🏗️ Beneficios Clave

| Beneficio                   | Descripción                                                      |
| --------------------------- | ---------------------------------------------------------------- |
| **Gobernanza centralizada** | Control uniforme sobre todas las APIs.                           |
| **Seguridad mejorada**      | Autenticación, autorización y protección contra abusos.          |
| **Escalabilidad**           | Soporta altos volúmenes de tráfico.                              |
| **Observabilidad**          | Monitoreo detallado del uso y rendimiento.                       |
| **Desacoplamiento**         | Permite evolucionar los backends sin afectar a los consumidores. |
| **Facilidad de consumo**    | Portal para desarrolladores y documentación integrada.           |

---

## 📌 Casos de Uso Comunes

* Exposición segura de **microservicios**.
* Integración con **socios y terceros**.
* Modernización de **sistemas legacy**.
* Creación de una **capa de abstracción** para múltiples backends.
* Implementación de **estrategias de versionado de APIs**.
* Consolidación de múltiples APIs bajo un único endpoint.

---

# 🏗️ API Management Landing Zone Architecture

La **Landing Zone Architecture** para Azure API Management define una arquitectura de referencia segura, escalable y alineada con las mejores prácticas de gobernanza y redes en Azure.

## 📌 Descripción General

En esta arquitectura, **Azure API Management** se implementa dentro de una **red virtual (VNet)** en modo **interno**, evitando la exposición directa a Internet. El acceso externo se gestiona a través de un **Application Gateway** con **Web Application Firewall (WAF)**, proporcionando una capa adicional de seguridad y control.

## 🖼️ Diagrama de Arquitectura

<img width="1214" height="585" alt="image" src="https://github.com/user-attachments/assets/6b5d8207-d962-4b41-a3c5-97414c96f542" />


## 🔄 Componentes Principales

### 1. Application Gateway con WAF

* Actúa como **punto de entrada público**.
* Proporciona **terminación SSL/TLS**.
* Protege contra ataques comunes (OWASP Top 10).
* Permite el uso de **dominios personalizados**.

### 2. Azure API Management (Modo Interno)

* Desplegado dentro de una **subred dedicada**.
* No es accesible directamente desde Internet.
* Gestiona la **seguridad, transformación y gobernanza** de las APIs.

### 3. Backends de Aplicación

* Servicios como **Azure App Service**, **Azure Functions**, **AKS** o **máquinas virtuales**.
* Accesibles de forma privada desde APIM.
* Pueden estar distribuidos en múltiples regiones.

### 4. Private Endpoints

* Permiten conexiones seguras a servicios como:

  * **Azure Key Vault** para la gestión de secretos y certificados.
  * **Azure Storage** u otros servicios PaaS.
* Eliminan la exposición a redes públicas.

### 5. Microsoft Entra ID

* Proporciona **autenticación y autorización centralizadas**.
* Permite el uso de **Managed Identities** para el acceso seguro a recursos.

### 6. Subredes Dedicadas

* **Subred del Application Gateway**.
* **Subred de API Management**.
* **Subred de Private Endpoints**.
* Facilitan el aislamiento y la seguridad de la red.

---

## 🔄 Flujo de Solicitudes en la Landing Zone

1. **Cliente externo** accede a la API mediante un dominio público.
2. La solicitud llega al **Application Gateway con WAF**, donde se inspecciona y protege.
3. El tráfico se enruta de forma privada hacia **Azure API Management**.
4. **APIM** aplica políticas de seguridad, transformación y control.
5. La solicitud se envía a los **servicios backend** mediante conexiones privadas.
6. **Key Vault** proporciona certificados y secretos de manera segura.
7. La respuesta sigue el mismo camino de regreso al cliente.

---

## 🎯 Beneficios de la Landing Zone

| Beneficio                  | Descripción                                          |
| -------------------------- | ---------------------------------------------------- |
| **Seguridad reforzada**    | APIM no está expuesto directamente a Internet.       |
| **Defensa en profundidad** | Integración con Application Gateway y WAF.           |
| **Conectividad privada**   | Uso de VNets y Private Endpoints.                    |
| **Gobernanza**             | Control centralizado del acceso a las APIs.          |
| **Escalabilidad**          | Arquitectura preparada para crecimiento.             |
| **Cumplimiento normativo** | Facilita el cumplimiento de requisitos de seguridad. |

---

## 📝 Ejemplo de Escenario

Una empresa desea exponer sus microservicios a clientes externos de forma segura:

* **Application Gateway + WAF** protege el acceso público.
* **APIM** gestiona la autenticación mediante **Microsoft Entra ID** y aplica políticas de rate limiting.
* **Azure Functions** y **App Services** procesan la lógica de negocio.
* **Key Vault** almacena certificados y secretos.
* **Private Endpoints** aseguran la conectividad interna.

---

# 🧾 Resumen Final

| Aspecto            | Azure API Management                                 |
| ------------------ | ---------------------------------------------------- |
| Rol principal      | API Gateway y plataforma de կառավարanza              |
| Seguridad          | OAuth2, JWT, Entra ID, WAF                           |
| Gobernanza         | Políticas, versionado y control de acceso            |
| Observabilidad     | Integración con Azure Monitor y Application Insights |
| Conectividad       | Soporte para VNets y Private Endpoints               |
| Escenarios ideales | Exposición segura de APIs y microservicios           |

**Conclusión:**
Azure API Management es un componente esencial para diseñar arquitecturas modernas, seguras y escalables. Su implementación dentro de una **Landing Zone** asegura una **defensa en profundidad**, permitiendo a las organizaciones exponer sus APIs con altos estándares de seguridad, gobernanza y rendimiento.

