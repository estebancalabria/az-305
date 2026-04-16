# 📘 Registros de Cambio en Azure Storage Account

En Azure Storage, los **registros de cambio** permiten auditar y rastrear qué sucedió con los datos almacenados. Son fundamentales para **seguridad, cumplimiento normativo, recuperación ante errores y análisis forense**.

Existen principalmente **tres mecanismos** para registrar cambios en un **Blob Storage**:

---

## 🔄 1. Blob Change Feed

### 📌 ¿Qué es?

El **Blob Change Feed** es un registro **inmutable y ordenado** de todas las modificaciones que ocurren en los blobs dentro de una cuenta de almacenamiento.

### 📌 ¿Qué eventos registra?

* ✅ Creación de blobs
* ✅ Modificación o sobrescritura
* ✅ Eliminación
* ✅ Restauración
* ✅ Cambios en metadatos
* ✅ Cambios en snapshots o versiones

### 📌 Características clave

* 🔒 **Inmutable**: No puede modificarse ni eliminarse.
* 🕒 **Orden cronológico**: Permite reconstruir la secuencia de eventos.
* 📂 **Persistente**: Se almacena como archivos en una ubicación especial dentro del Storage.
* 🔁 **Integrable**: Puede ser consumido por aplicaciones para procesamiento o auditoría.

### 📌 ¿Cómo habilitarlo?

1. Ir al **Storage Account** en el Azure Portal.
2. Seleccionar **Data Protection**.
3. Activar la opción **Blob Change Feed**.
4. Guardar los cambios.

### 📌 Casos de uso

* Auditoría y cumplimiento.
* Análisis forense.
* Sincronización de datos.
* Arquitecturas orientadas a eventos.

---

## 🕒 2. Blob Versioning

### 📌 ¿Qué es?

El **Blob Versioning** guarda automáticamente una **nueva versión** de un blob cada vez que se modifica o elimina.

### 📌 Beneficios

* Permite recuperar versiones anteriores.
* Protege contra sobrescrituras accidentales.
* Complementa el Change Feed proporcionando acceso al contenido histórico.

### 📌 Cómo habilitarlo

1. Ir a **Storage Account → Data Protection**.
2. Activar **Blob Versioning**.

### 📌 Ejemplo de uso

Si un archivo `reporte.pdf` es modificado, Azure conserva la versión anterior, permitiendo su restauración.

---

## 🗑️ 3. Soft Delete (para Blobs y Contenedores)

### 📌 ¿Qué es?

El **Soft Delete** permite recuperar blobs o contenedores eliminados durante un período de retención configurable.

### 📌 Características

* Retención configurable (por ejemplo, de 1 a 365 días).
* Protección contra eliminaciones accidentales o maliciosas.
* Compatible con Versioning y Change Feed.

### 📌 Cómo habilitarlo

1. Ir a **Storage Account → Data Protection**.
2. Activar:

   * **Soft delete for blobs**
   * **Soft delete for containers**
3. Definir el período de retención.

---

## 📊 4. Azure Monitor y Diagnostic Logs

### 📌 ¿Qué registran?

A diferencia del Change Feed, estos registros capturan **operaciones de acceso** al Storage Account, como:

* Lecturas y escrituras.
* Solicitudes autenticadas o anónimas.
* Errores y tiempos de respuesta.
* Información del cliente (IP, identidad, etc.).

### 📌 Destinos posibles

* **Log Analytics Workspace**
* **Azure Storage**
* **Event Hub**

### 📌 Cómo configurarlos

1. Ir al **Storage Account**.
2. Seleccionar **Diagnostic settings**.
3. Crear una nueva configuración y elegir las categorías de logs.

---

## 🧩 Comparación de los Mecanismos de Registro

| Característica             | Blob Change Feed | Versioning     | Soft Delete | Diagnostic Logs |
| -------------------------- | ---------------- | -------------- | ----------- | --------------- |
| Registra eventos           | ✅                | ⚠️ (implícito) | ⚠️          | ✅               |
| Guarda contenido histórico | ❌                | ✅              | ✅           | ❌               |
| Inmutable                  | ✅                | ✅              | ❌           | ❌               |
| Auditoría de acceso        | ❌                | ❌              | ❌           | ✅               |
| Recuperación de datos      | ❌                | ✅              | ✅           | ❌               |
| Orden cronológico          | ✅                | ❌              | ❌           | ❌               |

---

## 🏗️ Arquitectura Recomendada

Para una solución robusta de auditoría y protección de datos en Azure Storage:

1. **Blob Change Feed** → Para registrar eventos de cambios.
2. **Blob Versioning** → Para recuperar versiones anteriores.
3. **Soft Delete** → Para restaurar eliminaciones accidentales.
4. **Diagnostic Logs** → Para auditar accesos y operaciones.

---

## 🎯 Ejemplo Práctico

**Escenario:** Una empresa necesita cumplir con requisitos regulatorios y poder auditar cualquier cambio en sus documentos.

**Solución:**

* Activar **Blob Change Feed** para registrar todas las modificaciones.
* Habilitar **Blob Versioning** para conservar el historial de contenido.
* Configurar **Soft Delete** para recuperar eliminaciones.
* Enviar **Diagnostic Logs** a **Log Analytics** para auditoría de accesos.

---

## 📝 Resumen Final

| Mecanismo            | Propósito Principal                 |
| -------------------- | ----------------------------------- |
| **Blob Change Feed** | Registro inmutable de cambios       |
| **Blob Versioning**  | Historial de versiones de los datos |
| **Soft Delete**      | Recuperación de eliminaciones       |
| **Diagnostic Logs**  | Auditoría de accesos y operaciones  |



> 💡 *“En Azure Storage no solo protegemos los datos, sino también su historia: quién los cambió, cuándo y cómo.”*

