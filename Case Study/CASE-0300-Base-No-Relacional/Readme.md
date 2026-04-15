# 🧩 Caso de estudio: Diseño de una solución de Non-relational Storage

## 🏢 Contexto

* **Esteban Calabria Industries** desea optimizar el almacenamiento de sus archivos multimedia, marketing y documentos corporativos en la nube.
* Los archivos actuales se almacenan en el datacenter local, generando problemas de acceso y duplicación.
* El equipo de TI solicita recomendaciones sobre **servicios de Azure Storage** que permitan centralizar, escalar y asegurar los datos.

---

## 📋 Situación Actual

* **Media files**: Fotos de productos y videos que se muestran en el sitio web.  
  * Formatos más comunes: JPEG, MP4.  
  * Acceso frecuente para productos populares y estacional para otros.  
  * Problema: durante picos de tráfico, el sitio web se vuelve lento.

* **Marketing literature**: Historias de clientes, flyers de ventas, sizing charts, información de fabricación eco-friendly.  
  * Acceso interno: vía mapped drives en Windows.  
  * Acceso externo: vía sitio web público.

* **Corporate documents**: Documentos internos de RRHH y finanzas.  
  * Algunos deben conservarse por períodos legales específicos.  
  * Acceso bajo demanda; mayormente por cumplimiento.

* **Ubicación actual**: Todos los archivos están en servidores locales, organizados por departamento o línea de producto.  
  * Problema: Los servidores luchan por servir contenido al sitio web durante horas pico.

---

## 🧠 Enunciado

1. Diseñar una solución de almacenamiento para **Esteban Calabria Industries**:  

      * ¿Qué tipo de datos representan los distintos archivos?  
      * ¿Qué factores considerarás en tu diseño?  
      * ¿Usarías **blob access tiers**?  
      * ¿Usarías **immutable storage**?  
      * ¿Cómo se asegurará el acceso seguro al contenido?  

2. Considerar las diferencias entre **media files**, **marketing literature** y **corporate documents**.  

3. Explicar cómo se incorporan los **pilares del Well-Architected Framework** para lograr una arquitectura:  

      * Alta calidad  
      * Estable  
      * Eficiente

---

## 🏗️ Arquitectura propuesta — Non-relational Storage en Azure

```mermaid
graph TD
    FE[Front-end: Sitio Web / App] --> Blob[Azure Blob Storage]
    Marketing[Marketing Docs] --> Blob
    Corporate[Corporate Documents] --> Blob

    subgraph "Opciones de acceso y seguridad"
        Blob --> Tier[Access Tiers: Hot / Cool / Archive]
        Blob --> IAM[Control de acceso RBAC]
        Blob --> Immutable[Immutability Policies]
    end

    subgraph "Monitor y Logging"
        Blob --> AI[Application Insights / Azure Monitor]
    end
````

---

## 🏗️ Opciones de Azure Non-relational Storage

### 🟢 Media files — Fotos y videos del catálogo

**Recomendación:** **Azure Blob Storage (Hot/Cool Tier)**

**✅ Pros**

* Escalado automático según volumen de archivos.
* Integración fácil con sitio web y CDN (Content Delivery Network).
* Posibilidad de definir **access tiers** para optimizar costos:

  * **Hot** → contenido frecuente
  * **Cool / Archive** → contenido menos usado

**❌ Contras**

* Costo según volumen y tipo de acceso.
* No hay estructura relacional, lo que limita consultas complejas.

**💡 Qué mostrar en Azure:**

* Ir a **Azure Portal → Storage Accounts → Crear cuenta de almacenamiento**.
* Configurar **Blob Containers** para media.
* Subir archivos de ejemplo y mostrar **tiering** (Hot / Cool).
* Activar **Azure CDN** para distribución rápida.
* Revisar métricas en **Monitoring → Metrics** para tráfico de blobs.

---

### 🟡 Marketing literature — Flyers y documentos internos

**Recomendación:** **Azure Blob Storage + Azure Files (para acceso interno)**

**✅ Pros**

* Blob Storage para clientes externos vía sitio web.
* Azure Files para usuarios internos con mapped drive (SMB / NFS).
* Control de acceso mediante **RBAC y SAS tokens**.

**❌ Contras**

* Necesita coordinación entre acceso externo e interno.

**💡 Qué mostrar en Azure:**

* Crear **Blob Container** para marketing externo.
* Crear **File Share** para usuarios internos.
* Configurar **RBAC** y **SAS tokens**.
* Mostrar cómo los usuarios internos montan el File Share en Windows.
* Revisar métricas de uso y acceso en **Azure Monitor**.

---

### 🔵 Corporate documents — Documentos legales y de RRHH

**Recomendación:** **Azure Blob Storage + Immutable Policies**

**✅ Pros**

* Garantiza retención de documentos según cumplimiento legal.
* Permite **immutability policies** para evitar borrado accidental o malicioso.
* Integración con **Azure AD** para control de acceso seguro.

**💡 Qué mostrar en Azure:**

* Crear Blob Container para documentos corporativos.
* Configurar **immutability policy** (WORM).
* Definir **RBAC** para roles específicos.
* Revisar logs y auditoría en **Azure Monitor / Activity Log**.

---

## 🏗️ Arquitectura — Aplicando Well-Architected Framework

**Pilares a destacar en la explicación:**

* **Fiabilidad (Reliability)** → Replicación de blobs, redundancia geográfica opcional (GRS).
* **Rendimiento (Performance Efficiency)** → CDN para media files, Hot tier para acceso frecuente.
* **Optimización de costos (Cost Optimization)** → Access tiers, almacenamiento en Archive para contenido poco usado.
* **Seguridad (Security)** → RBAC, SAS tokens, policies WORM para documentos legales.
* **Operaciones (Operational Excellence)** → Azure Monitor y Application Insights para telemetría y alertas.

**💡 Qué mostrar en Azure:**

* Storage Account con diferentes containers (Media, Marketing, Corporate).
* Configuración de **access tiers** y **immutability policies**.
* Azure CDN para media files.
* Métricas de acceso, uso de blobs y alertas en Azure Monitor.

```

