# **Resumen Profesional: Microsoft Azure**

## **1. Introducción a Microsoft Azure**

**Microsoft Azure** es una plataforma de computación en la nube en constante expansión que permite a las organizaciones **crear, implementar y administrar aplicaciones y servicios** a través de una red global de centros de datos. Ofrece la flexibilidad de utilizar herramientas y frameworks preferidos, facilitando la innovación y la transformación digital.

### **Propuesta de Valor**

Azure se sustenta en tres pilares fundamentales:

* **Innovación sin límites:** Desarrollo de aplicaciones inteligentes mediante servicios avanzados de inteligencia artificial, analítica, IoT y machine learning.
* **Integración unificada:** Gestión eficiente de infraestructura, datos y aplicaciones desde una plataforma integrada.
* **Confianza y seguridad:** Altos estándares de seguridad, cumplimiento normativo y responsabilidad en el uso de la IA.

### **Capacidades Principales**

Azure dispone de cientos de servicios organizados en categorías clave:

* **Compute**
* **Networking**
* **Storage**
* **Databases**
* **AI + Machine Learning**
* **Identity + Security**
* **DevOps + Management**
* **IoT**
* **Analytics**
* **Integration**

Estas capacidades permiten desde la **migración de aplicaciones existentes** a máquinas virtuales hasta su **modernización** mediante servicios administrados, arquitecturas escalables y soluciones basadas en eventos.

### **Escalabilidad y Modelo de Costos**

Azure opera bajo un modelo de **pago por uso**, permitiendo escalar recursos según la demanda. Esto optimiza los costos y resulta ideal para aplicaciones con picos estacionales, ya que los recursos pueden ampliarse o reducirse dinámicamente.

### **Innovación con Inteligencia Artificial**

Azure facilita la creación de soluciones avanzadas mediante:

* **Azure AI Services** y **Azure OpenAI Service** para capacidades de lenguaje, visión, voz e IA generativa.
* **Azure Machine Learning** para el desarrollo y despliegue de modelos.
* **Servicios de IoT** y **almacenamiento escalable** para gestionar grandes volúmenes de datos.

---

## **2. Cuentas y Suscripciones de Azure**

Para utilizar los servicios de Azure es necesario contar con una **cuenta de Azure**, a partir de la cual se crean una o más **suscripciones**, que funcionan como límites administrativos, de facturación y gobernanza.

### **Jerarquía Básica**

1. **Cuenta de Azure:** Identidad asociada a Microsoft Entra ID o a una cuenta confiable (Microsoft o GitHub).
2. **Suscripciones:** Permiten separar entornos (Desarrollo, Pruebas, Producción, Sandbox) y controlar costos y accesos.
3. **Grupos de Recursos:** Contenedores lógicos para organizar recursos relacionados.
4. **Recursos:** Componentes individuales como máquinas virtuales, bases de datos, redes virtuales o servicios de IA.

### **Opciones para Obtener Azure**

* Compra directa a Microsoft.
* A través de representantes de Microsoft.
* Mediante **partners Cloud Solution Provider (CSP)** que ofrecen soluciones administradas.

### **Cuenta Gratuita de Azure**

#### **Azure Free Account**

* Acceso gratuito a servicios populares durante **12 meses**.
* **Crédito inicial** para los primeros **30 días**.
* Más de **65 servicios siempre gratuitos**.
* Requiere tarjeta de crédito solo para verificación de identidad.

#### **Azure Free Student Account**

* **USD 100 de crédito** durante **12 meses**.
* Acceso a servicios y herramientas de desarrollo.
* **No requiere tarjeta de crédito**.

### **Buenas Prácticas de Costos**

* Monitorear el consumo de recursos.
* Eliminar recursos que ya no se utilicen.
* Utilizar suscripciones separadas para facilitar el control financiero.

---

## **3. Infraestructura Física de Azure**

La infraestructura física de Azure garantiza **alta disponibilidad, resiliencia y escalabilidad** a nivel global. Se organiza jerárquicamente en **datacenters, regiones, zonas de disponibilidad y pares de regiones**.

### **3.1 Datacenters**

Son instalaciones físicas con servidores organizados en racks, con sistemas independientes de energía, refrigeración y redes. Operan a gran escala y no son accesibles directamente por los usuarios.

### **3.2 Regiones**

Una **región** es un área geográfica que contiene uno o más datacenters interconectados mediante redes de baja latencia. Al desplegar recursos, generalmente se debe seleccionar una región.

**Aspectos clave:**

* Balanceo inteligente de recursos.
* Cumplimiento de requisitos de residencia de datos.
* Algunos servicios o características están disponibles solo en regiones específicas.
* Existen servicios **globales** que no requieren región, como **Microsoft Entra ID**, **Azure Traffic Manager** y **Azure DNS**.

### **3.3 Zonas de Disponibilidad (Availability Zones)**

Son datacenters físicamente separados dentro de una misma región, cada uno con energía, refrigeración y redes independientes, conectados mediante fibra óptica de alta velocidad.

**Beneficios:**

* Aislamiento ante fallas.
* Alta disponibilidad.
* Continuidad del negocio.

**Categorías de Servicios:**

1. **Zonales:** Se implementan en una zona específica (ej., máquinas virtuales).
2. **Con redundancia de zona:** Replicación automática entre zonas (ej., almacenamiento ZRS, Azure SQL Database).
3. **No regionales:** Resilientes a fallas de zonas o regiones (ej., Microsoft Entra ID).

### **3.4 Pares de Regiones (Region Pairs)**

La mayoría de las regiones están emparejadas con otra región dentro de la misma geografía, separadas por al menos **300 millas**, lo que permite replicación de datos y recuperación ante desastres.

**Ventajas:**

* Conmutación por error (failover).
* Priorización en la restauración de servicios.
* Actualizaciones planificadas escalonadas.
* Cumplimiento de residencia de datos.

**Consideraciones:**

* No todos los servicios replican datos automáticamente.
* Algunas regiones presentan emparejamientos unidireccionales, como **Brazil South** con **South Central US**.
* Otras regiones dependen de zonas de disponibilidad y almacenamiento georredundante.

### **3.5 Regiones Soberanas**

Son instancias aisladas de Azure diseñadas para cumplir requisitos legales y regulatorios específicos.

**Ejemplos:**

* **Regiones gubernamentales de EE. UU.:** US DoD Central, US Gov Virginia y US Gov Arizona.
* **Regiones de China:** China East y China North, operadas en asociación con **21Vianet**.

---

## **4. Infraestructura de Administración de Azure**

La **infraestructura de administración** permite organizar recursos, controlar accesos y gestionar costos de manera eficiente. Está compuesta por **recursos, grupos de recursos, suscripciones y grupos de administración**.

### **4.1 Recursos de Azure**

Un **recurso** es el bloque básico de Azure. Todo lo que se crea o implementa en la plataforma —como máquinas virtuales, redes virtuales, bases de datos o servicios de IA— es considerado un recurso.

### **4.2 Grupos de Recursos (Resource Groups)**

Los **grupos de recursos** son contenedores lógicos que agrupan recursos relacionados.

**Características principales:**

* Cada recurso pertenece a **un único grupo**.
* Algunos recursos pueden **moverse** entre grupos.
* **No pueden anidarse** ni **renombrarse** después de su creación.
* Las acciones aplicadas al grupo afectan a todos sus recursos.
* **Eliminar un grupo elimina todos los recursos** contenidos en él.

**Casos de uso:**

* Entornos temporales de desarrollo.
* Separación de proyectos o equipos.
* Gestión simplificada del ciclo de vida de las aplicaciones.

### **4.3 Suscripciones de Azure**

Las **suscripciones** actúan como límites de **administración, facturación y control de acceso**.

**Tipos de límites:**

* **Límite de facturación:** Cada suscripción genera facturas e informes de costos independientes.
* **Límite de control de acceso:** Permite aplicar políticas y permisos diferentes (por ejemplo, desarrollo vs. producción).

**Motivos para crear múltiples suscripciones:**

* Separar entornos (sandbox, desarrollo, pruebas y producción).
* Diferenciar equipos o proyectos.
* Gestionar costos de manera independiente.

### **4.4 Grupos de Administración (Management Groups)**

Los **grupos de administración** permiten aplicar gobernanza y políticas a gran escala, especialmente en organizaciones con múltiples suscripciones.

**Características clave:**

* Se sitúan **por encima de las suscripciones** en la jerarquía.
* Permiten aplicar **políticas y permisos** que se heredan automáticamente.
* Pueden **anidarse hasta seis niveles** (sin contar el nivel raíz ni las suscripciones).
* Cada **Microsoft Entra tenant** posee un único **Tenant Root Group**.
* Un directorio puede admitir **hasta 10.000 grupos de administración**.
* Cada grupo de administración y suscripción puede tener **un solo padre**.

**Ejemplos de uso:**

* Aplicar políticas de cumplimiento o restricciones geográficas.
* Gestionar permisos mediante **Azure RBAC** en múltiples suscripciones.
* Reflejar la estructura organizacional (por ejemplo, Marketing, IT, Finanzas).

---

## **5. Jerarquía Completa de Azure**

La estructura organizativa de Azure puede resumirse de la siguiente manera:

```
Tenant Root Group
   └── Management Groups
         └── Subscriptions
               └── Resource Groups
                     └── Resources
```

Esta jerarquía permite una **gestión escalable, segura y gobernada** de los recursos en la nube, asegurando coherencia en políticas, control de acceso y administración de costos.

---

## **6. Conclusión**

Microsoft Azure es una **plataforma integral de computación en la nube** que permite a las organizaciones **migrar, modernizar e innovar** sus soluciones tecnológicas. Su valor se sustenta en:

* Una amplia gama de servicios tecnológicos.
* Un modelo flexible basado en cuentas y suscripciones.
* Una infraestructura física global que garantiza alta disponibilidad y resiliencia.
* Una sólida infraestructura de administración que facilita la gobernanza, el control de acceso y la gestión de costos.

Gracias a estas capacidades, Azure se posiciona como un **habilitador estratégico de la transformación digital**, permitiendo a las organizaciones desarrollar soluciones **escalables, seguras, resilientes y eficientes**.

