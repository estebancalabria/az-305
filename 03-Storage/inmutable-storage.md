## 🔒 ¿Qué significa que un Storage sea “inmutable”?

La **inmutabilidad** en Azure Storage permite que los datos almacenados en **Blob Storage** no puedan ser:

* ❌ Modificados
* ❌ Eliminados
* ❌ Sobrescritos

Durante un período de retención definido o hasta que se elimine una retención legal. Esta funcionalidad se conoce como **WORM (Write Once, Read Many)**.

> ⚠️ Importante: La inmutabilidad **no se configura a nivel del Storage Account completo**, sino a nivel de **contenedores de blobs** o **versiones individuales de blobs**.

---

## 🛡️ Tipos de Políticas de Inmutabilidad

### 1. ⏱️ **Time-Based Retention Policy**

* Define un período de retención específico (por ejemplo, 7 años).
* Durante ese tiempo, los datos no pueden ser modificados ni eliminados.
* Puede configurarse en dos estados:

  * **Unlocked (desbloqueada):** Permite aumentar el período de retención.
  * **Locked (bloqueada):** No puede modificarse ni eliminarse (cumplimiento estricto).

### 2. ⚖️ **Legal Hold**

* Se utiliza cuando existe un requerimiento legal o de auditoría.
* No tiene fecha de expiración.
* Permanece activa hasta que se elimine explícitamente.
* Puede aplicarse mediante **etiquetas (tags)**.

---

## 🛠️ Cómo Configurar la Inmutabilidad

### ✅ Opción 1: Desde el Azure Portal

1. Ir al **Azure Portal**.
2. Navegar hasta tu **Storage Account**.
3. Seleccionar **Containers** dentro de **Data storage**.
4. Elegir el **contenedor** deseado.
5. En el menú superior, hacer clic en **Immutability**.
6. Seleccionar una de las opciones:

   * **Add policy** → para una política de retención por tiempo.
   * **Set legal hold** → para un bloqueo legal.
7. Definir:

   * Número de días de retención.
   * Estado **Unlocked** o **Locked**.
8. Confirmar la configuración.

---

## 💻 Configuración mediante Azure CLI

### 🔹 Crear una política de retención basada en tiempo

```bash
az storage container immutability-policy create \
  --account-name <nombre-storage> \
  --container-name <nombre-contenedor> \
  --resource-group <grupo-recursos> \
  --period <dias> \
  --allow-protected-append-writes true
```

### 🔹 Bloquear la política (modo cumplimiento)

```bash
az storage container immutability-policy lock \
  --account-name <nombre-storage> \
  --container-name <nombre-contenedor> \
  --resource-group <grupo-recursos>
```

### 🔹 Aplicar un Legal Hold

```bash
az storage container legal-hold set \
  --account-name <nombre-storage> \
  --container-name <nombre-contenedor> \
  --resource-group <grupo-recursos> \
  --tags tag1 tag2
```

---

## 🧩 Inmutabilidad a Nivel de Versión de Blob

Además de los contenedores, Azure permite aplicar inmutabilidad a **versiones individuales de blobs**, lo cual es útil cuando:

* Está habilitado el **Blob Versioning**.
* Se requiere proteger solo versiones específicas.

---

## 📊 Resumen Comparativo

| Característica         | Time-Based Retention      | Legal Hold           |
| ---------------------- | ------------------------- | -------------------- |
| Duración definida      | ✅                         | ❌                    |
| Requerimientos legales | ⚠️                        | ✅                    |
| Puede eliminarse       | Solo si está **Unlocked** | Sí, quitando el hold |
| Cumplimiento normativo | ✅                         | ✅                    |
| Bloqueo permanente     | ✅ (Locked)                | ✅                    |

---

## 🎯 Casos de Uso Comunes

* 🏦 **Finanzas:** Cumplimiento de normativas como SEC 17a-4.
* 🏥 **Salud:** Protección de historiales clínicos (HIPAA).
* 🏛️ **Gobierno:** Preservación de documentos oficiales.
* 📝 **Auditorías:** Conservación de logs y registros.

---

## 📝 Buenas Prácticas

* ✅ Habilitar **Blob Versioning** junto con la inmutabilidad.
* ✅ Bloquear (**Lock**) la política una vez validada.
* ✅ Utilizar **Legal Holds** para investigaciones o litigios.
* ✅ Documentar los períodos de retención según las normativas aplicables.
* ✅ Probar primero en entornos de desarrollo antes de aplicarlo en producción.

---

## 🧭 Conclusión

Para marcar datos en Azure Storage como **inmutables**:

1. **No se configura a nivel del Storage Account**, sino a nivel de **contenedor o versión de blob**.
2. Utilizar:

   * **Time-Based Retention Policy** para períodos definidos.
   * **Legal Hold** para requerimientos legales.
3. Bloquear la política (**Locked**) para garantizar cumplimiento normativo.

