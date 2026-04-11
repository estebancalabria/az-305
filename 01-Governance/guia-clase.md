## 🧑‍🏫 Guía Docente – AZ-305

### ✅ Checklist corto y fácil de seguir

* Introducción a la Gobernanza
* Jerarquía de Azure
* Management Groups
* Subscriptions
* Resource Groups
* Resource Tagging
* Azure Policy
* Role-Based Access Control (RBAC)
* Integración RBAC + Azure Policy
* Azure Landing Zones

---

## 🗂️ Estructura Sugerida de la Clase

### 1. Introducción a la Gobernanza (5 min)

**Objetivo:** Contextualizar el problema.

* Definir gobernanza en la nube.
* Mencionar los tres disparadores:

  * 💰 Cost surprises
  * 🔐 Security drift
  * ⚙️ Operational chaos

**Mensaje clave:** “Running the cloud rather than the cloud running us”.

---

### 2. Jerarquía de Azure (10 min)

**Orden:** Tenant → Management Groups → Subscriptions → Resource Groups → Resources.

**Aspectos importantes:**

* Herencia de políticas y permisos.
* Gestión basada en “scopes”.
* Diferencia entre organización lógica y técnica.

**Hacer hincapié en:**

* La jerarquía como base de toda la gobernanza.
* Relación con Microsoft Entra ID.

---

### 3. Management Groups (10 min)

**Objetivo:** Control centralizado.

* Permiten aplicar políticas y RBAC a múltiples suscripciones.
* Hasta 6 niveles de anidación.
* Estrategias comunes: por departamento, geografía o entorno.

**Mencionar seguro:**

* Preferir estructuras planas para facilitar la administración.
* Posibilidad de mover suscripciones entre grupos.
* Importancia de restringir quién puede modificar la jerarquía.

---

### 4. Subscriptions (10 min)

**Objetivo:** Entender su rol como límite organizacional.

* Unidad de facturación, seguridad y escala.
* Uso para aislamiento de entornos (Dev/Test/Prod).
* Consideraciones de cuotas y límites.

**Hacer hincapié en:**

* No es necesario una suscripción por región.
* Centralización de servicios compartidos.
* Responsabilidad del subscription owner.

---

### 5. Resource Groups (5 min)

**Objetivo:** Organización por ciclo de vida.

* Contenedor lógico de recursos.
* Estrategias:

  * Por aplicación.
  * Por tipo de recurso o equipo.

**Mencionar seguro:**

* Uso de Locks (Delete y ReadOnly).
* Eliminación del RG elimina todos los recursos.

---

### 6. Resource Tagging (5 min)

**Objetivo:** Visibilidad y control de costos.

* Pares clave-valor.
* Ejemplos: CostCenter, Owner, Environment, Project.

**Hacer hincapié en:**

* Los tags aparecen en la factura.
* Pueden ser obligatorios mediante Azure Policy.
* Facilitan reportes y gobernanza financiera.

---

### 7. Azure Policy (10 min)

**Objetivo:** Cumplimiento y automatización.

* Definiciones en JSON.
* Asignación por scope.
* Efectos principales:

  * Deny
  * Audit
  * DeployIfNotExists

**Mencionar seguro:**

* Herencia de políticas.
* Uso de Initiatives para agrupar políticas.
* Integración con Defender for Cloud.

---

### 8. Role-Based Access Control (RBAC) (10 min)

**Objetivo:** Control de acceso.

**Componentes:**

* Who: Identidad.

* What: Rol.

* Where: Scope.

* Diferencia entre Microsoft Entra roles y Azure RBAC.

**Hacer hincapié en:**

* Principio de mínimo privilegio.
* Asignar roles a grupos, no a usuarios.
* Posibilidad de crear roles personalizados.

---

### 9. Integración RBAC + Azure Policy (5 min)

**Mensaje clave:**

* RBAC determina quién puede realizar una acción.
* Policy determina qué está permitido.

**Flujo a mencionar:**

* Se evalúa RBAC.
* Luego se evalúa Azure Policy.
* Solo si ambas lo permiten, el recurso se despliega.

---

### 10. Azure Landing Zones (10 min)

**Objetivo:** Proveer una base escalable.

* Parte del Cloud Adoption Framework.
* Platform Landing Zone: identidad, red, seguridad, monitoreo.
* Application Landing Zone: suscripciones de las aplicaciones.

**Hacer hincapié en:**

* Estandarización y automatización mediante Infrastructure as Code.
* Reutilización de servicios compartidos.

