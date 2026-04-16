# 📦 Azure Blob Storage: Tiers y Políticas de Cambio Automático

## 🌡️ ¿Qué son los Access Tiers?

Los **Access Tiers** en **Azure Blob Storage** permiten optimizar costos según la frecuencia de acceso a los datos. Cuanto menor es la frecuencia de acceso, menor es el costo de almacenamiento, pero mayor el costo de recuperación.

### 🔹 Tipos de Tiers

| Tier        | Frecuencia de acceso            | Costo de almacenamiento | Costo de acceso | Tiempo de disponibilidad        | Casos de uso                    |
| ----------- | ------------------------------- | ----------------------- | --------------- | ------------------------------- | ------------------------------- |
| **Hot**     | Frecuente                       | Alto                    | Bajo            | Inmediato                       | Datos activos, aplicaciones web |
| **Cool**    | Poco frecuente (≥ 30 días)      | Medio                   | Medio/Alto      | Inmediato                       | Backups a corto plazo           |
| **Cold**    | Muy poco frecuente (≥ 90 días)  | Bajo                    | Alto            | Inmediato                       | Archivos históricos             |
| **Archive** | Raramente accedido (≥ 180 días) | Muy bajo                | Muy alto        | Rehidratación requerida (horas) | Cumplimiento y archivado        |

> 📝 **Nota:** Los períodos mínimos de permanencia son: **30 días (Cool)**, **90 días (Cold)** y **180 días (Archive)**. Cambiar antes de estos plazos puede generar cargos adicionales.

---

## 🔄 Configuración del Tier por Defecto

Al crear un **Storage Account** (tipo **General Purpose v2**), se puede definir un **tier predeterminado** (Hot o Cool). Este valor aplica a los nuevos blobs, aunque cada blob puede cambiarse individualmente posteriormente.

---

## 🔁 Cambio Manual de Tier

Es posible cambiar el tier de un blob en cualquier momento:

### 📌 Desde el Azure Portal

1. Ir al **Storage Account**.
2. Seleccionar **Containers**.
3. Elegir el **blob** deseado.
4. Hacer clic en **Change tier**.
5. Seleccionar el nuevo tier (Hot, Cool, Cold o Archive).

### 📌 Mediante Azure CLI

```bash
az storage blob set-tier \
  --account-name <nombre-storage> \
  --container-name <contenedor> \
  --name <blob> \
  --tier Cool
```

### 📌 Rehidratación desde Archive

Cuando un blob está en **Archive**, debe rehidratarse antes de ser accedido:

```bash
az storage blob set-tier \
  --account-name <nombre-storage> \
  --container-name <contenedor> \
  --name <blob> \
  --tier Hot \
  --rehydrate-priority High
```

* **Standard Priority:** puede tardar hasta 15 horas.
* **High Priority:** más rápido, pero con mayor costo.

---

## 🤖 Políticas Automáticas: Lifecycle Management

### 📌 ¿Qué es Lifecycle Management?

El **Lifecycle Management** permite definir **políticas automáticas** que mueven los blobs entre tiers o los eliminan, en función de reglas basadas en el tiempo. Esto ayuda a optimizar costos sin intervención manual.

### 📌 ¿Dónde se configura?

1. Ir al **Storage Account** en el Azure Portal.
2. Seleccionar **Lifecycle Management** en el menú lateral.
3. Crear una nueva **regla**.
4. Definir:

   * **Scope:** contenedores o prefijos específicos.
   * **Filtros:** tipo de blob o etiquetas (blob index tags).
   * **Acciones:** cambio de tier o eliminación.
   * **Condiciones:** días desde la creación, modificación o último acceso.

---

## 🧩 Acciones Disponibles en las Políticas

| Acción                                 | Descripción                                                         |
| -------------------------------------- | ------------------------------------------------------------------- |
| **Move to Cool**                       | Reduce costos para datos con menor acceso.                          |
| **Move to Cold**                       | Optimiza aún más el almacenamiento para datos raramente utilizados. |
| **Move to Archive**                    | Minimiza costos para datos de largo plazo.                          |
| **Delete**                             | Elimina blobs después de un período determinado.                    |
| **Tiering para versiones y snapshots** | Permite aplicar reglas también a versiones anteriores.              |

---

## 📄 Ejemplo de Política en JSON

```json
{
  "rules": [
    {
      "name": "optimizacion-costos",
      "enabled": true,
      "type": "Lifecycle",
      "definition": {
        "filters": {
          "blobTypes": ["blockBlob"],
          "prefixMatch": ["datos/"]
        },
        "actions": {
          "baseBlob": {
            "tierToCool": {
              "daysAfterModificationGreaterThan": 30
            },
            "tierToCold": {
              "daysAfterModificationGreaterThan": 90
            },
            "tierToArchive": {
              "daysAfterModificationGreaterThan": 180
            },
            "delete": {
              "daysAfterModificationGreaterThan": 365
            }
          }
        }
      }
    }
  ]
}
```

### 📌 Implementación mediante Azure CLI

```bash
az storage account management-policy create \
  --account-name <nombre-storage> \
  --resource-group <grupo-recursos> \
  --policy @policy.json
```

---

## 🏷️ Uso de Blob Index Tags

Las **Blob Index Tags** permiten aplicar políticas más específicas, por ejemplo:

```json
"blobIndexMatch": [
  {
    "name": "tipo",
    "op": "==",
    "value": "backup"
  }
]
```

Esto posibilita gestionar automáticamente el ciclo de vida según el tipo de datos.

---

## 📊 Ejemplo de Estrategia de Tiering

| Tiempo desde el último acceso | Acción      |
| ----------------------------- | ----------- |
| 0 – 30 días                   | Hot         |
| 30 – 90 días                  | Cool        |
| 90 – 180 días                 | Cold        |
| > 180 días                    | Archive     |
| > 365 días                    | Eliminación |

---

## 🎯 Beneficios del Lifecycle Management

* 💰 **Optimización de costos** automática.
* 🤖 **Automatización** sin intervención manual.
* 📜 **Cumplimiento normativo** mediante retención controlada.
* 🔍 **Segmentación avanzada** usando prefijos o etiquetas.
* 📈 **Escalabilidad** para grandes volúmenes de datos.

---

## 📊 Resumen Comparativo de los Tiers

| Característica          | Hot       | Cool           | Cold               | Archive                |
| ----------------------- | --------- | -------------- | ------------------ | ---------------------- |
| Acceso                  | Frecuente | Poco frecuente | Muy poco frecuente | Raro                   |
| Disponibilidad          | Inmediata | Inmediata      | Inmediata          | Requiere rehidratación |
| Costo de almacenamiento | Alto      | Medio          | Bajo               | Muy bajo               |
| Costo de acceso         | Bajo      | Medio          | Alto               | Muy alto               |
| Permanencia mínima      | Ninguna   | 30 días        | 90 días            | 180 días               |

---

> 💡 *“En Azure Storage no solo almacenamos datos; diseñamos su ciclo de vida para que el costo acompañe su valor a lo largo del tiempo.”*

---

## 🧭 Conclusión

Los **Access Tiers** y las **políticas de Lifecycle Management** son herramientas esenciales para diseñar soluciones de almacenamiento eficientes en Azure:

* **Hot, Cool, Cold y Archive** permiten alinear el costo con la frecuencia de acceso.
* **Lifecycle Management** automatiza el movimiento entre tiers y la eliminación de datos.
* **Blob Index Tags** ofrecen segmentación avanzada para políticas más precisas.

