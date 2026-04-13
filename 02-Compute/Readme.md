## 🌐 Resumen Profesional – Servicios de Cómputo e Innovación en Microsoft Azure

Este módulo proporciona una visión integral de los **servicios de cómputo y alojamiento de aplicaciones en Microsoft Azure**, permitiendo comprender cómo seleccionar la opción más adecuada según el nivel de control, escalabilidad y esfuerzo operativo requerido. Se analizan soluciones como **Azure Virtual Machines**, **Azure Virtual Desktop**, **contenedores**, **Azure Functions**, **Azure App Service** y las categorías de **Inteligencia Artificial, Machine Learning e IoT/Edge**.

### 🎯 Objetivos de Aprendizaje

Al finalizar el módulo, el participante será capaz de:

* Comparar los distintos tipos de cómputo en Azure, incluyendo **Virtual Machines**, **Container Instances** y **Azure Functions**.
* Describir las opciones de máquinas virtuales, como **Virtual Machine Scale Sets** y **Availability Sets**.
* Identificar los recursos necesarios para implementar máquinas virtuales.
* Analizar las opciones de alojamiento de aplicaciones, incluyendo **Azure App Service**, contenedores y máquinas virtuales.
* Reconocer las principales categorías de servicios avanzados, como **Inteligencia Artificial**, **Machine Learning** e **IoT/Edge**.

---

## 🖥️ Azure Virtual Machines (VMs)

Las **Azure Virtual Machines** son un servicio de **Infraestructura como Servicio (IaaS)** que permite ejecutar servidores virtualizados con control total sobre el sistema operativo y el software instalado. Son ideales para escenarios que requieren configuraciones personalizadas o la migración de aplicaciones existentes mediante estrategias de *Lift and Shift*.

### Casos de uso principales

* Pruebas y desarrollo.
* Alojamiento de aplicaciones en la nube.
* Extensión del datacenter.
* Recuperación ante desastres.
* Migración de cargas de trabajo existentes.
* Ejecución de software personalizado.

### Escalabilidad y resiliencia

* **Virtual Machine Scale Sets:** permiten el escalado automático y la administración centralizada de múltiples VMs.
* **Availability Sets:** distribuyen las VMs en *Fault Domains* y *Update Domains* para mejorar la resiliencia.
* **Availability Zones:** ofrecen aislamiento adicional frente a fallas a nivel de datacenter.

---

## 💻 Azure Virtual Desktop (AVD)

**Azure Virtual Desktop** es un servicio administrado de virtualización de escritorios y aplicaciones que permite acceder de forma segura a entornos Windows desde cualquier dispositivo y ubicación.

### Características clave

* Centralización de escritorios y aplicaciones en la nube.
* Integración con **Microsoft Entra ID** para la gestión de identidades y accesos.
* Reducción de la exposición de datos en dispositivos locales.
* Soporte para sesiones **single-session** y **multi-session**.
* Administración simplificada mediante **host pools**.

### Casos de uso

* Equipos distribuidos o trabajadores híbridos.
* Contratistas o personal temporal.
* Centros de soporte con entornos estandarizados.
* Organizaciones con requisitos estrictos de seguridad y cumplimiento.

---

## 📦 Azure Containers

Los **contenedores** proporcionan una alternativa ligera y ágil a las máquinas virtuales, permitiendo ejecutar múltiples aplicaciones en un mismo host con un menor consumo de recursos. Son fundamentales para el desarrollo de aplicaciones modernas basadas en **arquitecturas de microservicios**, donde cada componente puede desplegarse y escalarse de forma independiente.

### Servicios principales

* **Azure Container Instances (ACI):** ejecución rápida y sencilla de contenedores sin administrar infraestructura.
* **Azure Container Apps:** plataforma PaaS con escalado automático y balanceo de carga.
* **Azure Kubernetes Service (AKS):** servicio de orquestación para gestionar implementaciones complejas de contenedores.

### Beneficios en arquitecturas de microservicios

* Escalabilidad independiente de cada componente.
* Mayor resiliencia del sistema.
* Flexibilidad tecnológica.
* Despliegues y actualizaciones más rápidos.

---

## ⚡ Azure Functions

**Azure Functions** es un servicio de cómputo **serverless** que permite ejecutar código en respuesta a eventos sin necesidad de administrar infraestructura.

### Beneficios clave

* Ejecución basada en eventos (HTTP, temporizadores, colas o mensajería).
* Escalado automático según la demanda.
* Modelo de **pago por uso**, facturando solo el tiempo de ejecución.
* Liberación automática de recursos al finalizar la ejecución.
* Integración con redes virtuales y entornos dedicados.

### Tipos de funciones

* **Stateless:** cada ejecución es independiente.
* **Stateful (Durable Functions):** permiten mantener el estado y orquestar flujos de trabajo complejos.

### Casos de uso

* Automatización de procesos.
* Integración entre sistemas.
* Procesamiento de eventos en tiempo real.
* Backends ligeros para aplicaciones web o móviles.

---

## 🤖 Servicios de Inteligencia Artificial, Machine Learning e IoT/Edge

Azure ofrece un conjunto de servicios que permiten construir **soluciones inteligentes y conectadas**.

### Azure AI Services

Proporcionan capacidades de IA preconstruidas mediante APIs para:

* Lenguaje natural.
* Voz.
* Visión.
* Procesamiento de documentos.

El **Azure OpenAI Service** habilita escenarios de **IA generativa**, como chat y generación de contenido, con controles de seguridad y gobernanza.

### Patrones de IA Agéntica

Las aplicaciones agénticas combinan modelos de IA, contexto e ինտeracciones con herramientas para completar objetivos de múltiples pasos. Se consideran un **patrón de arquitectura** y no una categoría independiente de servicio.

### Azure Machine Learning

Permite **crear, entrenar, desplegar y administrar modelos personalizados**, siendo ideal para escenarios que requieren experimentación y control del ciclo de vida del modelo (MLOps).

### Servicios de IoT y Edge

* **Azure IoT Hub:** comunicación bidireccional segura con dispositivos.
* **Azure IoT Central:** plataforma SaaS que simplifica la gestión de soluciones IoT.
* **Azure IoT Edge:** procesamiento local de datos cerca de los dispositivos.

### Triada de decisión

| Necesidad                              | Servicio recomendado             |
| -------------------------------------- | -------------------------------- |
| Capacidades de IA preconstruidas       | Azure AI Services / Azure OpenAI |
| Desarrollo de modelos personalizados   | Azure Machine Learning           |
| Soluciones con dispositivos conectados | Azure IoT Services               |

---

## 🌐 Opciones de Alojamiento de Aplicaciones

Al alojar aplicaciones en Azure, es posible elegir entre diferentes alternativas según el **nivel de control** y el **esfuerzo operativo** requerido:

| Opción                | Nivel de control | Esfuerzo operativo | Casos de uso                                 |
| --------------------- | ---------------- | ------------------ | -------------------------------------------- |
| **Virtual Machines**  | Alto             | Alto               | Migraciones y configuraciones personalizadas |
| **Containers**        | Medio            | Medio              | Aplicaciones modernas y microservicios       |
| **Azure App Service** | Bajo             | Bajo               | Aplicaciones web y APIs                      |

### 🚀 Azure App Service

**Azure App Service** es una plataforma **Platform as a Service (PaaS)** que permite crear y alojar aplicaciones web, APIs RESTful, backends móviles y tareas en segundo plano sin gestionar la infraestructura subyacente.

### Características clave

* **Servicio basado en HTTP** para aplicaciones web y APIs.
* **Escalado automático** y **alta disponibilidad**.
* **Balanceo de carga integrado**.
* **Despliegue continuo** desde GitHub, Azure DevOps o cualquier repositorio Git.
* **Seguridad integrada** para los endpoints.
* Soporte para **Windows y Linux**.
* Compatibilidad con múltiples lenguajes y frameworks: **.NET, .NET Core, Java, PHP, Python y Node.js**.

### Tipos de aplicaciones en App Service

#### 🌐 Web Apps

Permiten alojar aplicaciones web desarrolladas con tecnologías como ASP.NET, Java, Node.js, PHP, Python o Ruby, eligiendo entre sistemas operativos Windows o Linux.

#### 🔌 API Apps

Facilitan la creación y publicación de **APIs REST** con soporte para **Swagger/OpenAPI** y su posible distribución a través de Azure Marketplace. Pueden ser consumidas por cualquier cliente HTTP/HTTPS.

#### ⚙️ WebJobs

Permiten ejecutar programas o scripts en segundo plano dentro del mismo contexto de una Web App o API. Pueden ejecutarse de forma:

* **Programada**.
* **Bajo demanda**.
* **Basada en desencadenadores (triggers)**.

Son ideales para tareas como procesamiento de colas, limpieza de datos o automatizaciones.

#### 📱 Mobile Apps

Proporcionan un backend rápido para aplicaciones móviles **iOS** y **Android**, incluyendo:

* Almacenamiento de datos en bases SQL en la nube.
* **Autenticación** con proveedores sociales como Microsoft, Google, X y Facebook.
* **Notificaciones push**.
* Ejecución de lógica personalizada en **C#** o **Node.js**.
* SDKs para **Xamarin** y **React Native**.

---

## ✅ Conclusión

Los **servicios de cómputo e innovación de Microsoft Azure** ofrecen una plataforma completa y flexible para el desarrollo de soluciones empresariales modernas:

* **Azure Virtual Machines:** máximo control sobre la infraestructura (IaaS).
* **Azure Virtual Desktop:** virtualización segura de escritorios y aplicaciones.
* **Azure Containers:** base para aplicaciones modernas y arquitecturas de microservicios.
* **Azure Functions:** cómputo serverless basado en eventos y pago por uso.
* **Azure App Service:** alojamiento PaaS para aplicaciones web, APIs y backends móviles.
* **Azure AI Services y Azure OpenAI:** incorporación de capacidades inteligentes y generativas.
* **Azure Machine Learning:** desarrollo y gestión de modelos personalizados.
* **Azure IoT y Edge:** conexión y gestión de dispositivos con procesamiento cercano al origen de los datos.

En conjunto, estos servicios permiten a las organizaciones **acelerar la innovación**, **optimizar costos**, **mejorar la seguridad** y **desarrollar soluciones altamente escalables y resilientes** en la nube.

