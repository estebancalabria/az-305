# 🌐 Acceso a Azure Storage desde Azure App Service

Cuando una aplicación desplegada en **Azure App Service** necesita interactuar con un **Azure Storage Account** (por ejemplo, Blob Storage), existen varias opciones de autenticación y conectividad. La elección adecuada depende de los requisitos de **seguridad**, **simplicidad** y **arquitectura**.

---

## 🔐 1. Managed Identity + Azure RBAC (Recomendado)

### 📌 ¿Qué es?

Una **Managed Identity** permite que el **App Service** se autentique en Azure sin necesidad de almacenar credenciales en el código o en archivos de configuración.

### 📌 Tipos

* **System-assigned Managed Identity**: Se crea automáticamente y está vinculada al App Service.
* **User-assigned Managed Identity**: Puede ser compartida entre múltiples recursos.

### 📌 ¿Cómo configurarlo?

#### Paso 1: Habilitar la Managed Identity

1. Ir al **App Service** en el Azure Portal.
2. Seleccionar **Identity**.
3. Activar **System assigned** y guardar.

#### Paso 2: Asignar permisos al Storage Account

1. Ir al **Storage Account**.
2. Seleccionar **Access Control (IAM)**.
3. Agregar un rol como:

   * **Storage Blob Data Reader**
   * **Storage Blob Data Contributor**
   * **Storage Blob Data Owner**

#### Paso 3: Acceder desde el código

**Ejemplo en .NET:**

```csharp
using Azure.Identity;
using Azure.Storage.Blobs;

var client = new BlobServiceClient(
    new Uri("https://<nombre-storage>.blob.core.windows.net"),
    new DefaultAzureCredential());

var containerClient = client.GetBlobContainerClient("mi-contenedor");
```

**Ejemplo en Python:**

```python
from azure.identity import DefaultAzureCredential
from azure.storage.blob import BlobServiceClient

account_url = "https://<nombre-storage>.blob.core.windows.net"
credential = DefaultAzureCredential()
client = BlobServiceClient(account_url, credential=credential)
```

### ✅ Ventajas

* No se almacenan secretos.
* Integración con Microsoft Entra ID.
* Permite control granular mediante RBAC.
* Facilita la auditoría y el cumplimiento.

### ⚠️ Consideraciones

* Requiere que el acceso por **Shared Key** esté habilitado solo si se usan métodos alternativos.
* Puede necesitar configuración de red adicional (firewall o private endpoints).

---

## 🔑 2. Claves del Storage Account (Access Keys)

### 📌 ¿Qué es?

El App Service utiliza una de las **claves de acceso** del Storage Account para autenticarse.

### 📌 Implementación

1. Obtener la clave desde **Storage Account → Access Keys**.
2. Guardarla como **Application Setting** en el App Service.
3. Utilizarla en la cadena de conexión.

**Ejemplo de cadena de conexión:**

```
DefaultEndpointsProtocol=https;AccountName=<nombre>;AccountKey=<clave>;EndpointSuffix=core.windows.net
```

### ✅ Ventajas

* Fácil de implementar.
* Compatible con aplicaciones heredadas.

### ⚠️ Desventajas

* Acceso total al Storage.
* Mayor riesgo de exposición de secretos.
* Requiere rotación periódica.

---

## ⏱️ 3. Shared Access Signature (SAS)

### 📌 ¿Qué es?

Una **SAS (Shared Access Signature)** permite otorgar acceso limitado y temporal a recursos específicos del Storage.

### 📌 Tipos

* **User Delegation SAS** (basado en Entra ID, más seguro).
* **Service SAS**.
* **Account SAS**.

### 📌 Implementación

1. Generar el SAS desde el Portal o mediante código.
2. Almacenarlo como **Application Setting** en el App Service.
3. Utilizar la URL firmada para acceder al recurso.

**Ejemplo de URL:**

```
https://<storage>.blob.core.windows.net/<container>/<blob>?<SAS_TOKEN>
```

### ✅ Ventajas

* Permisos y duración limitados.
* Ideal para compartir acceso temporal.

### ⚠️ Desventajas

* Requiere gestión de expiración y renovación.
* Si se filtra, puede ser utilizado hasta su vencimiento.

---

## 🌐 4. Conectividad de Red Segura

Además de la autenticación, es fundamental considerar cómo el **App Service** se conecta al Storage Account a nivel de red.

### 🔹 a. Service Endpoints

* Permiten que el tráfico desde la **VNet** del App Service hacia el Storage permanezca dentro de la red de Azure.
* Requiere **VNet Integration** en el App Service.
* El Storage debe permitir la subred en su firewall.

### 🔹 b. Private Endpoints (Azure Private Link) – 🔒 Máxima seguridad

* El Storage Account obtiene una **IP privada** dentro de una VNet.
* El acceso público puede deshabilitarse completamente.
* El App Service accede al Storage mediante **VNet Integration**.

### 🔹 c. Access Restrictions (Firewall)

* El firewall del Storage puede permitir únicamente el acceso desde:

  * Subredes específicas.
  * Direcciones IP salientes del App Service.

---

## 🗂️ 5. Azure Files Mount (Contenido Persistente)

El **App Service** también puede montar un **Azure File Share** como sistema de archivos persistente.

### 📌 ¿Cómo configurarlo?

1. Ir al **App Service → Configuration → Path mappings**.
2. Agregar un **Azure Storage Mount**.
3. Proporcionar:

   * Nombre del Storage.
   * File Share.
   * Clave de acceso.
   * Ruta de montaje.

### ✅ Casos de uso

* Almacenamiento de archivos persistentes.
* Contenido compartido entre instancias.
* Logs o archivos generados por la aplicación.

---

## 📊 Resumen Comparativo

| Opción                      | Seguridad | Gestión de secretos | Complejidad | Escenario ideal            |
| --------------------------- | --------- | ------------------- | ----------- | -------------------------- |
| **Managed Identity + RBAC** | ⭐⭐⭐⭐⭐     | ❌ No                | Media       | Aplicaciones modernas      |
| **Access Keys**             | ⭐⭐        | ✅ Sí                | Baja        | Sistemas heredados         |
| **SAS**                     | ⭐⭐⭐⭐      | ✅ Sí                | Media       | Acceso temporal o delegado |
| **Service Endpoints**       | ⭐⭐⭐⭐      | N/A                 | Media       | Restricción de red         |
| **Private Endpoints**       | ⭐⭐⭐⭐⭐     | N/A                 | Alta        | Entornos altamente seguros |
| **Azure Files Mount**       | ⭐⭐⭐       | ✅ Sí                | Baja        | Almacenamiento persistente |

---

## 🏗️ Arquitectura Recomendada

Para una solución segura y alineada con buenas prácticas:

1. **Managed Identity** habilitada en el App Service.
2. **Asignación de roles RBAC** en el Storage Account.
3. **Private Endpoint** para el Storage.
4. **VNet Integration** en el App Service.
5. **Deshabilitar el acceso público** al Storage.

---

## 🗣️ Frase “WOW” para tus clases

> 💡 *“La forma más segura de acceder a Azure Storage desde un App Service es aquella en la que no existen secretos que proteger.”*

---

## 🧭 Conclusión

Existen múltiples opciones para que un **Azure App Service** acceda a un **Azure Storage Account**, pero la elección dependerá de los requisitos de seguridad y arquitectura:

* ✅ **Managed Identity + RBAC** es la opción recomendada.
* 🔑 **Access Keys** y **SAS** son alternativas válidas en escenarios específicos.
* 🌐 **Private Endpoints** y **Service Endpoints** fortalecen la seguridad de red.
* 📂 **Azure Files Mount** permite almacenamiento persistente para la aplicación.

