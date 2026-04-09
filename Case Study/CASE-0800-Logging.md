# 🧩 Caso de estudio: Logging

## 🏢 Contexto

* **EstebanCalabria Industries** es un contratista de construcción que quiere integrar **tecnologías de hogar inteligente** y mejorar su software de gestión de proyectos (PM).  
* Objetivos:
  * Migrar sistemas existentes a la **nube pública**.  
  * Reemplazar scripts inseguros (FTP) y automatizar la ingesta de datos.  
  * Implementar una nueva solución de **Home Technology** con escalabilidad, alta disponibilidad y seguridad.

---

## 📋 Situación Actual

### Project Management (PM) software

* Aplicación Windows de terceros.  
* 2-node **NLB cluster**, base de datos **SQL Server**.  
* Documentos e imágenes en NAS.  
* Superintendentes de obra usan laptops/tablets offline → scripts diarios para subir cambios vía FTP.  

### Home Technology

* Sistemas de HVAC, seguridad y automatización provistos por terceros, dispersos en distintos sitios web.  
* No hay integración central ni control unificado de datos de sensores.

---

## 📊 Enunciado

1. Diseñar solución para **Project Management software** en la nube.  
2. Diseñar arquitectura para **Home Technology Solution** unificada.  
3. Aplicar los pilares del **Well-Architected Framework** para garantizar calidad, estabilidad y eficiencia.

---

## 🏗️ Arquitectura propuesta — Project Management

```mermaid
graph TD
    Office_Users[Corporate Users Web] --> AppService_PM[Azure App Service - Web Frontend]
    Superintendents[Field Users] --> Storage_Blob[Azure Blob Storage / Event Grid]
    Storage_Blob --> Function_Process[Azure Functions - Process Changes]
    Function_Process --> SQL_DB[Azure SQL Database - PM]
    SQL_DB --> AppService_PM
````

**Componentes y justificación**

* **Azure App Service** → reemplaza front-end Windows, escalable según carga.
* **Azure Blob Storage + Event Grid** → reemplaza FTP, recepción de cambios en tiempo real.
* **Azure Functions** → procesa automáticamente los cambios al subir archivos, elimina dependencia de scripts nocturnos.
* **Azure SQL Database** → alta disponibilidad y resiliencia ante fallas de hardware.

**✅ Pros**

* Eliminación de FTP → más seguro.
* Procesamiento inmediato de archivos.
* Escalabilidad automática según carga de usuarios y superintendentes.
* Alta disponibilidad con **zone-redundant SQL**.

**💡 Demo en Azure**

* Crear **App Service Plan y Web App**.
* Configurar **Blob Storage + Event Grid trigger**.
* Crear **Function App** para procesamiento.
* Provisionar **SQL Database** con alta disponibilidad y alertas.

---

## 🏗️ Arquitectura propuesta — Home Technology Solution

```mermaid
graph TD
    Sensors[Home Sensors] --> IoTHub[Azure IoT Hub]
    IoTHub --> Stream_Analytics[Azure Stream Analytics]
    Stream_Analytics --> SQL_DB[Azure SQL Database - Sensor Data]
    Stream_Analytics --> Alerting[Azure Functions / Logic Apps - Real-time Alerts]
    Users[Homeowner Web App] --> AppService_Web[Azure App Service - Linux]
    AppService_Web --> SQL_DB
    AppService_Web --> Entra_ID[Azure AD - SSO Authentication]
```

**Componentes y justificación**

* **Azure IoT Hub** → recepción de datos de sensores de forma escalable y segura.
* **Stream Analytics** → procesamiento en tiempo real para alertas y análisis de tendencias.
* **Azure SQL Database** → almacenamiento relacional de preferencias y tendencias de sensores.
* **Azure Functions / Logic Apps** → envío de alertas configurables en tiempo real.
* **App Service (Linux)** → sitio web unificado para monitoreo y control.
* **Azure AD / SSO** → login seguro sin crear nuevas cuentas, integración con identidades existentes.

**✅ Pros**

* Escalable horizontalmente → soporta picos de carga.
* Alta disponibilidad y redundancia para servicios críticos.
* Integración de alertas y datos históricos para análisis de tendencias.
* Seguridad: SSO, cifrado en tránsito y reposo, control de acceso basado en roles.

**💡 Demo en Azure**

* Crear **IoT Hub** y simular dispositivos.
* Configurar **Stream Analytics Job** para procesar datos en tiempo real.
* Provisionar **SQL Database** para almacenar preferencias y métricas.
* Crear **Logic App / Function** para alertas de usuarios.
* Crear **App Service Linux Web App** y conectar con **Entra ID** para SSO.
* Monitorear métricas y telemetría con **Application Insights / Azure Monitor**.

---

## ⚙️ Aplicación del Well-Architected Framework

* **Fiabilidad (Reliability)** → Azure SQL con zona redundante, App Service escalable, IoT Hub con tolerancia a fallas.
* **Rendimiento (Performance Efficiency)** → Stream Analytics procesa datos en tiempo real, funciones serverless escalables.
* **Seguridad (Security)** → SSO con Azure AD, cifrado de datos, control de acceso granular.
* **Optimización de costos (Cost Optimization)** → uso de serverless (Functions), pago por ejecución y escalado automático de App Service.
* **Operaciones (Operational Excellence)** → monitoreo completo con Azure Monitor, alertas y logs centralizados.

---

## 🔗 Resumen

* **Project Management** → migración a App Service + Blob + Functions + SQL.
* **Home Technology** → IoT Hub + Stream Analytics + SQL + Functions + Web App + Entra ID.
* **Seguridad, escalabilidad, alta disponibilidad y eficiencia** garantizadas siguiendo **Well-Architected Framework**.

