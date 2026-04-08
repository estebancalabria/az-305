# 🧩 Caso de estudio: Diseño de una solución de gobernanza

## 🏢 Contexto

* **EstebanCalabria Industries** está planificando definir en su estrategia de gobernanza en Azure.
* Realizar un asesoramiento como arquitecto de soluciones Azure, con el objetivo de definir recomendaciones, al y responder a una serie de requerimientos clave.

---

## 📋 Situacion Actual

EstebanCalabria Industries cuenta con dos unidades de negocio principales:

* Apparel (Indumentaria)
* Sporting Goods (Artículos deportivos)

Cada unidad de negocio está compuesta por tres departamentos:

* Desarrollo de Producto
* Marketing
* Ventas

```mermaid
graph TD
    A[EstebanCalabria Industries]

    A --> B[Apparel (Indumentaria)]
    A --> C[Sporting Goods (Artículos deportivos)]

    B --> B1[Desarrollo de Producto]
    B --> B2[Marketing]
    B --> B3[Ventas]

    C --> C1[Desarrollo de Producto]
    C --> C2[Marketing]
    C --> C3[Ventas]
```

## 🚀 Nuevo proyecto de desarrollo

La empresa está iniciando un nuevo proyecto orientado a la recopilación de feedback de clientes.

El CFO ha definido los siguientes requisitos:

* Todos los costos asociados al proyecto deben poder **identificarse y rastrearse claramente**.
* Durante la fase de testing, las cargas de trabajo deben ejecutarse en **máquinas virtuales de bajo costo**.
* Las máquinas virtuales deben seguir una **convención de nombres que permita identificar su pertenencia al proyecto**.
* Cualquier incumplimiento de las reglas de consistencia de recursos debe ser **detectado automáticamente**.

---

## 🧠 Enunciado

* ¿Qué opciones existen para **rastrear los costos** del nuevo proyecto?
* ¿Cómo garantizarías el cumplimiento de los requisitos relacionados con:

  * el tamaño de las máquinas virtuales
  * la convención de nombres
* Proponer **al menos dos enfoques distintos** para cumplir con estos requisitos y justificar la elección final.

---

### 🏗️ Arquitectura

* ¿Cómo aplicarías los principios del **Well-Architected Framework** para diseñar una solución:

  * de alta calidad
  * estable
  * eficiente

Perfecto, seguimos con el mismo nivel y formato. Te dejo la continuación **lista para pegar**, incluyendo qué explicar y **qué mostrar en Azure en cada parte**.

---

## 💰 Opciones para rastrear costos

### 🧩 Opción 1 — Uso de Tags

**Descripción:**
Asignar tags a todos los recursos del proyecto.

Ejemplo:

* `project = feedback`
* `environment = dev`
* `owner = equipo-x`

**✅ Pros**

* Flexible
* Permite segmentar costos dentro de una misma subscription
* Fácil de implementar

**❌ Contras**

* Depende de disciplina (si no se asignan, se pierde tracking)
* Requiere enforcement con policies

---

### 🧩 Opción 2 — Subscription dedicada

**Descripción:**
Crear una subscription exclusiva para el proyecto.

**✅ Pros**

* Aislamiento total de costos
* Reporting directo sin depender de tags
* Mejor control de presupuesto

**❌ Contras**

* Mayor overhead administrativo
* Menos flexible si el proyecto crece o se divide

---

### 🧩 Opción 3 — Resource Groups

**Descripción:**
Agrupar recursos del proyecto en uno o varios Resource Groups.

**✅ Pros**

* Simplicidad
* Fácil organización lógica

**❌ Contras**

* No escala bien para múltiples proyectos
* Menor control que subscription

---

## ⚙️ Implementación en Azure (Costos)

Mostrar en Azure:

* **Cost Management + Billing**

  * Cost Analysis
  * Filtros por tag / subscription
* **Tags**

  * Asignación de tags en un recurso
* **Budgets**

  * Crear alerta de presupuesto

👉 Frase clave:

> “Esto nos permite no solo ver costos, sino controlarlos activamente”

---

## 🎯 Recomendación (Costos)

👉 **Combinar Tags + Budgets (y opcionalmente subscription si escala)**

**Justificación:**

* Tags permiten flexibilidad
* Budgets agregan control
* Escalable sin sobrecargar estructura

---

# 📏 Cumplimiento de requisitos (Compliance)

## 🧩 Opción 1 — Azure Policy (recomendada)

**Aplicaciones:**

* Restringir tamaños de VM
* Enforce naming convention
* Requerir tags obligatorios

Tipos de políticas:

* **Deny** → bloquea creación
* **Audit** → detecta incumplimiento
* **DeployIfNotExists** → corrige automáticamente

---

## 🧩 Opción 2 — Convenciones + procesos manuales

**Descripción:**

* Documentación interna
* Revisiones manuales

**❌ Problema:**

* No escala
* Alto riesgo de errores

---

## ⚙️ Implementación en Azure (Compliance)

Mostrar en Azure:

* **Azure Policy**

  * Ver definiciones existentes
  * Crear una policy simple (ej: allowed VM sizes)
  * Asignar policy a nivel subscription o MG
* **Compliance dashboard**

  * Ver recursos no conformes

👉 Frase clave:

> “La governance real no documenta reglas, las ejecuta automáticamente”

---

## 🎯 Recomendación (Compliance)

👉 **Azure Policy con enfoque combinado:**

* Deny → para reglas críticas (tamaño VM, naming)
* Audit → para monitoreo
* DeployIfNotExists → para automatización

---

# 🧠 Convención de nombres

Ejemplo:

```
vm-feedback-dev-001
```

Estructura:

* tipo recurso
* proyecto
* entorno
* identificador

---

## ⚙️ Implementación en Azure (Naming)

Mostrar en Azure:

* Policy de naming (pattern)
* Ejemplo de validación al crear recurso

---

# 🏗️ Aplicación del Well-Architected Framework

## 💰 Cost Optimization

* Uso de VMs de bajo costo en testing
* Uso de budgets
* Uso de tags para análisis

## 🔐 Security

* Policies para enforcement
* RBAC (mínimo privilegio)

## ⚙️ Operational Excellence

* Naming estándar
* Automatización con policies

## 🔁 Reliability

* Consistencia en configuración
* Monitoreo de compliance

---

## ⚙️ Implementación en Azure (Well-Architected)

Mostrar en Azure:

* **Advisor**
* **Cost Management**
* **Policy Compliance**

---

# 🎯 Cierre del escenario

👉 “Partimos de una estructura organizacional y ahora la llevamos a un caso real”
👉 “La diferencia entre un buen diseño y uno real es la capacidad de enforcement”

