## ✅ ¿Sigue la estructura de la transcripción?

**Sí**, la estructura propuesta sigue fielmente el orden de los temas presentados en el video y respeta la secuencia pedagógica del instructor. El recorrido conceptual es el siguiente:

1. Gobernanza del acceso mediante **Access Reviews**.
2. Identidades para aplicaciones: **Managed Identities**.
3. Autenticación de aplicaciones externas mediante **Service Principals**.
4. Protección de secretos, claves y certificados con **Azure Key Vault**.
5. Aplicación práctica del diseño en un escenario empresarial híbrido.

---

## 🧑‍🏫 Guía Docente – AZ-305

### 🔐 Design Authentication and Authorization Solutions (Part 2)

### ✅ Checklist corto y fácil de seguir

* Access Reviews
* Managed Identities (System-assigned y User-assigned)
* Service Principals y App Registrations
* Azure Key Vault
* Escenario práctico de implementación

---

## 🗂️ Estructura Sugerida de la Clase

### 1. Gobernanza del Acceso con Access Reviews

**Objetivo:** Garantizar que los permisos otorgados a usuarios y aplicaciones sigan siendo necesarios a lo largo del tiempo.

**Qué explicar:**

* **Access Reviews** permiten validar periódicamente si el acceso sigue siendo apropiado.
* Automatizan procesos de **onboarding**, **cambios de rol** y **offboarding**.
* Pueden aplicarse a:

  * Membresías de grupos.
  * Roles de Azure AD/Microsoft Entra.
  * Acceso a aplicaciones empresariales.
  * Access Packages en Entitlement Management.
* Tipos de revisores:

  * Autoevaluación.
  * Gerentes o propietarios de recursos.
  * Revisores designados.

**Hacer hincapié en:**

* Revisión periódica de **roles privilegiados** (por ejemplo, Global Administrator).
* Limpieza de **usuarios invitados (B2B)**.
* Validación del acceso a **aplicaciones sensibles**.
* Implementación inicial mediante un **piloto**.

---

### 2. Identidades para Aplicaciones: Managed Identities

**Objetivo:** Permitir que las aplicaciones se autentiquen de forma segura sin necesidad de gestionar credenciales.

**Qué explicar:**

* Las **Managed Identities** proporcionan una identidad automática en **Microsoft Entra ID** para recursos de Azure.
* Eliminan la necesidad de almacenar **contraseñas o secretos** en el código.
* Utilizan **RBAC** para otorgar permisos a otros recursos.

#### Tipos de Managed Identities

| Tipo                | Características                                                    | Casos de uso                                           |
| ------------------- | ------------------------------------------------------------------ | ------------------------------------------------------ |
| **System-assigned** | Relación 1:1 con el recurso. Se elimina al borrar el recurso.      | Escenarios donde se requiere trazabilidad específica.  |
| **User-assigned**   | Puede asociarse a múltiples recursos. Ciclo de vida independiente. | Entornos con autoescalado o reutilización de permisos. |

**Ejemplo práctico:**

* Una **máquina virtual** accede a un **Azure Key Vault** para obtener credenciales de base de datos sin exponer secretos.

**Hacer hincapié en:**

* Reducción del riesgo de filtración de credenciales.
* Simplificación operativa al eliminar la rotación manual de secretos.
* Integración natural con el principio de **Zero Trust**.

---

### 3. Service Principals y App Registrations

**Objetivo:** Permitir la autenticación segura de aplicaciones externas o multi-tenant.

**Qué explicar:**

* **App Registration:** define la aplicación en el tenant de origen (el “blueprint”).
* **Service Principal:** instancia de esa aplicación en un tenant específico.
* Utilizados cuando:

  * La aplicación se ejecuta **fuera de Azure**.
  * Se requiere acceso **cross-tenant**.
  * Se necesitan **credenciales basadas en certificados o secretos**.

#### Flujo de Autenticación

1. Se registra la aplicación en el tenant propietario.
2. El tenant consumidor otorga **consentimiento**.
3. Se crea un **Service Principal** en el tenant consumidor.
4. La aplicación obtiene un **token** para acceder a los recursos autorizados.

**Buenas prácticas:**

* Solicitar únicamente los **permisos necesarios** (principio de mínimo privilegio).
* Preferir **certificados** sobre secretos cuando sea posible.
* Restringir el **user consent** a aplicaciones verificadas.
* Manejar adecuadamente los escenarios donde el consentimiento es denegado.

**Hacer hincapié en:**

* Diferencias entre **Managed Identities** (para recursos de Azure) y **Service Principals** (para aplicaciones externas o multi-tenant).
* Importancia del control y la gobernanza en entornos empresariales.

---

### 4. Diseño para Azure Key Vault

**Objetivo:** Proteger y gestionar secretos, claves criptográficas y certificados de forma centralizada.

**Qué explicar:**

* **Azure Key Vault** como repositorio seguro para:

  * **Secrets:** contraseñas, cadenas de conexión, API keys.
  * **Keys:** claves criptográficas para cifrado.
  * **Certificates:** certificados SSL/TLS.
* Integración con **Managed Identities** y **Service Principals** para acceso seguro.
* Soporte para **Customer-Managed Keys (CMK)** en servicios como Azure SQL, Storage y Cosmos DB.
* Cumplimiento de estándares como **FIPS 140-2**.

#### Consideraciones de Diseño

| Aspecto                  | Recomendaciones                                                                |
| ------------------------ | ------------------------------------------------------------------------------ |
| **Límites de seguridad** | Separar vaults por aplicación o entorno para reducir el blast radius.          |
| **Autorización**         | Preferir **RBAC** sobre Access Policies para mayor escalabilidad y gobernanza. |
| **Conectividad**         | Utilizar **Private Endpoints** para evitar exposición pública.                 |
| **Protección de datos**  | Habilitar **Soft Delete** y **Purge Protection**.                              |
| **Auditoría**            | Integración con Azure Monitor y Microsoft Defender for Cloud.                  |

**Hacer hincapié en:**

* Separación de responsabilidades entre desarrolladores y equipos de seguridad.
* Eliminación de secretos en código fuente y archivos de configuración.
* Alineación con los principios de **Zero Trust**.

---

### 5. Aplicación Práctica del Diseño

#### 🏢 Escenario: Acceso Seguro a Azure SQL Database

**Requerimientos:**

* Una **máquina virtual en Azure** debe acceder a una **Azure SQL Database** de forma segura.
* Un **servidor on-premises** también necesita acceso sin almacenar credenciales.
* Se requiere conectividad privada y control de acceso granular.

#### ✅ Diseño Propuesto

1. **Segmentación de Red**

   * Creación de subredes protegidas con **Network Security Groups (NSG)**.
   * Implementación de un **Private Endpoint** para Azure SQL Database.

2. **Acceso desde la Máquina Virtual**

   * Habilitar una **Managed Identity (System-assigned)**.
   * Asignar permisos mediante **RBAC** o roles de base de datos en Azure SQL.

3. **Acceso desde On-Premises**

   * Conectividad mediante **VPN Site-to-Site** y **Virtual Network Gateway**.
   * Registro de la aplicación en **Microsoft Entra ID**.
   * Creación del correspondiente **Service Principal** para autenticación.

4. **Gestión de Secretos**

   * Uso de **Azure Key Vault** para almacenar cualquier información sensible adicional.
   * Acceso al vault mediante **Managed Identities**.

#### 🏗️ Beneficios del Diseño

* 🔐 **Seguridad:** Eliminación de credenciales embebidas.
* 🌐 **Conectividad privada:** Minimiza la exposición a Internet.
* 📊 **Gobernanza:** Control centralizado mediante Entra ID.
* ⚙️ **Escalabilidad:** Arquitectura adaptable a futuras necesidades.

