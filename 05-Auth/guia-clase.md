## 🧑‍🏫 Guía Docente – AZ-305

### 🔐 Design Authentication and Authorization Solutions (Part 1)

### ✅ Checklist corto y fácil de seguir

* Identity and Access Management (IAM)
* Principios de Zero Trust
* Microsoft Entra ID
* Microsoft Entra B2B
* Microsoft Entra External ID
* Conditional Access
* Identity Protection
* Escenario práctico de implementación

---

## 🗂️ Estructura Sugerida de la Clase

### 1. Identity and Access Management (IAM) y Zero Trust

**Objetivo:** Comprender cómo la identidad se convierte en el nuevo perímetro de seguridad en la nube.

**Qué explicar:**

* **Autenticación vs. Autorización:**

  * *Autenticación:* verifica quién es el usuario.
  * *Autorización:* determina qué acciones puede realizar.
* **Principios de Zero Trust:**

  * **Verify explicitly:** validar cada solicitud de acceso.
  * **Least privilege:** otorgar solo los permisos necesarios.
  * **Assume breach:** diseñar sistemas preparados para posibles compromisos.
* **Seis pilares de Zero Trust:**

  * Identidades
  * Dispositivos
  * Aplicaciones
  * Datos
  * Infraestructura
  * Redes

**Hacer hincapié en:**

* La transición desde un modelo basado en perímetro hacia uno centrado en la identidad.
* La reducción del “blast radius” mediante el principio de mínimo privilegio.

---

### 2. Diseño para Microsoft Entra ID

**Objetivo:** Entender el rol de Microsoft Entra ID como plataforma central de gestión de identidades.

**Qué explicar:**

* Directorio en la nube que centraliza **usuarios, grupos, dispositivos y aplicaciones**.
* **Single Sign-On (SSO)** para mejorar la experiencia del usuario.
* **Integración híbrida** mediante **Microsoft Entra Connect** para sincronizar identidades on-premises.
* **Microsoft Entra Domain Services** para soportar aplicaciones heredadas con Kerberos y LDAP.
* Uso de **Managed Identities** para autenticación segura entre servicios de Azure.

**Hacer hincapié en:**

* La centralización de identidades y políticas de seguridad.
* Simplificación operativa y mejora de la gobernanza.

---

### 3. Diseño para Microsoft Entra B2B

**Objetivo:** Facilitar la colaboración segura con socios y proveedores externos.

**Qué explicar:**

* Invitación de usuarios externos como **guest users**.
* Los invitados utilizan sus propias credenciales (no se gestionan sus contraseñas).
* Asignación de **roles y permisos** mediante **RBAC**.
* Aplicación de políticas de **Conditional Access** y **MFA**.

**Ejemplo práctico:**

* Un consultor externo que necesita acceso temporal a recursos internos del proyecto.

**Hacer hincapié en:**

* Control granular del acceso.
* Seguridad sin necesidad de crear y administrar nuevas identidades.

---

### 4. Diseño para Microsoft Entra External ID

**Objetivo:** Gestionar identidades de clientes y usuarios externos a la organización.

**Qué explicar:**

* Permite **registro e inicio de sesión** para aplicaciones orientadas a clientes.
* Personalización de experiencias de autenticación.
* Separación entre:

  * **Workforce tenant:** empleados y colaboradores (B2B).
  * **External tenant:** clientes y consumidores.
* Evolución del modelo tras el fin de venta de **Azure AD B2C** para nuevos clientes.

**Hacer hincapié en:**

* Escalabilidad y seguridad para aplicaciones orientadas al público.
* Beneficios de mantener separados empleados y clientes.

---

### 5. Conditional Access

**Objetivo:** Diseñar políticas que controlen el acceso a los recursos en función del contexto.

**Qué explicar:**

* Conditional Access como **motor de decisiones** de Zero Trust.
* **Señales evaluadas:**

  * Identidad del usuario.
  * Ubicación.
  * Estado del dispositivo.
  * Aplicación solicitada.
  * Nivel de riesgo.
* **Controles posibles:**

  * Requerir **MFA**.
  * Permitir o bloquear acceso.
  * Exigir dispositivos compatibles.
  * Restringir por ubicación.

**Herramientas clave:**

* **Templates** de políticas.
* **Report-only mode** para evaluar impacto.
* **What-if tool** para simulaciones.
* **Cuentas de emergencia (break-glass)** para evitar bloqueos administrativos.

**Hacer hincapié en:**

* Implementación progresiva y segura de políticas.
* Alineación con los principios de Zero Trust.

---

### 6. Identity Protection

**Objetivo:** Detectar y mitigar automáticamente riesgos relacionados con identidades.

**Qué explicar:**

* Evaluación de **riesgo de usuario** y **riesgo de inicio de sesión**.
* Detección de amenazas como:

  * Credenciales filtradas.
  * Inicios de sesión desde IP anónimas.
  * Viajes imposibles.
  * Ataques de password spray.
* **Acciones de remediación:**

  * Requerir **MFA**.
  * Forzar cambio de contraseña.
  * Bloquear el acceso.

**Recomendaciones de configuración:**

| Política     | Umbral sugerido | Acción               |
| ------------ | --------------- | -------------------- |
| User Risk    | Alto            | Cambio de contraseña |
| Sign-in Risk | Medio o Alto    | Requerir MFA         |

**Hacer hincapié en:**

* Integración con Conditional Access.
* Mejora continua de la postura de seguridad.

---

### 7. Aplicación Práctica del Diseño

**Objetivo:** Integrar los conceptos mediante un escenario empresarial.

#### 🏢 Escenario: Empresa con Identidad Híbrida

**Requerimientos:**

* Sincronizar identidades on-premises con la nube.
* Permitir colaboración con socios externos.
* Habilitar autenticación segura para aplicaciones.
* Detectar y mitigar accesos riesgosos.

**Diseño propuesto:**

* **Microsoft Entra ID:** Directorio central de identidades.
* **Microsoft Entra Connect:** Sincronización híbrida.
* **Microsoft Entra Domain Services:** Soporte para aplicaciones heredadas.
* **Microsoft Entra B2B:** Colaboración con partners.
* **Conditional Access:** Requerimiento de MFA y control contextual.
* **Identity Protection:** Detección y remediación automática de riesgos.

**Hacer hincapié en:**

* La alineación con los pilares del **Microsoft Well-Architected Framework**: seguridad, confiabilidad y excelencia operativa.
* La importancia de una estrategia integral de identidad para reducir riesgos.
