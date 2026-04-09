# 🧩 Caso de estudio: Diseño de infraestructura de red

## 🏢 Contexto

* **EstebanCalabria Industries** está migrando workloads críticos a **Azure**, incluyendo aplicaciones internas y de cara a internet.  
* Objetivos:
  * Diseñar una infraestructura de red escalable y segura para soportar **aplicaciones críticas**.  
  * Minimizar latencias para usuarios externos y internos.  
  * Cumplir con los requerimientos de **alta disponibilidad, recuperación ante desastres y seguridad**.

---

## 📋 Situación Actual

### Product Catalog Enterprise Application

* Aplicación internet-facing, Windows, .NET Core, dos capas (Web + DB).  
* Base de datos: SQL Server Always On en Azure SQL Database.  
* SLA crítico: 99.99%, RPO 10 min, RTO 2 hrs.  
* Requerimiento de seguridad: todo tráfico interno debe viajar por **Azure backbone**, no por endpoints públicos.

---

## 🏗️ Arquitectura de red propuesta

```mermaid
graph TD
    Internet --> FrontDoor[Azure Front Door - Global Load Balancing / WAF]
    FrontDoor --> AppGW[Azure Application Gateway - WAF / TLS termination]
    AppGW --> LB[Azure Load Balancer - Internal Traffic Distribution]
    LB --> VM_Web[VMs Web Tier / App Service]
    VM_Web --> SQL_DB[Azure SQL Database - Internal Endpoint]
    DMZ_NSG[Network Security Group DMZ] --> AppGW
    VNet_Web[Virtual Network] --> LB
    SQL_NSG[Network Security Group SQL] --> SQL_DB
````

**Componentes y justificación**

* **Azure Front Door** → balanceo global, caching de contenido estático, WAF para protección de internet-facing apps.
* **Azure Application Gateway** → TLS termination, inspección de tráfico, integración con NSG y WAF adicional.
* **Azure Load Balancer** → distribuye tráfico entre instancias de Web Tier, tolerancia a fallos regional.
* **Virtual Network (VNet)** → aislamiento lógico de la aplicación, segmentación entre Web Tier y DB Tier.
* **Network Security Groups (NSG)** → control de tráfico entrante y saliente entre subredes y recursos críticos.
* **Azure SQL Database** → endpoint privado, todo tráfico interno por **Azure backbone**, cumple seguridad corporativa.

**✅ Pros**

* Alta disponibilidad y resiliencia ante fallas de servidor o subred.
* Caching y aceleración global optimizan experiencia del usuario.
* Seguridad reforzada: WAF, NSG, tráfico interno por backbone.
* Escalable horizontalmente según demanda.

**💡 Demo en Azure**

* Crear **Virtual Network** con subredes Web y DB.
* Configurar **NSG** para control de tráfico interno/external.
* Crear **App Service / VMs Web Tier**.
* Configurar **Azure Load Balancer** para Web Tier.
* Configurar **Azure Front Door + WAF** y probar acceso externo.
* Configurar **SQL Database con endpoint privado** y probar comunicación desde Web Tier.
* Monitorear métricas y logs con **Azure Monitor / Application Insights**.

---

## ⚙️ Aplicación del Well-Architected Framework

* **Fiabilidad (Reliability)** → Front Door + Load Balancer + SQL con alta disponibilidad y failover.
* **Rendimiento (Performance Efficiency)** → caching, balanceo global y regional, optimización de latencia.
* **Seguridad (Security)** → WAF, NSG, Azure backbone, endpoint privado SQL.
* **Optimización de costos (Cost Optimization)** → uso de PaaS (SQL, App Service), escalado automático.
* **Operaciones (Operational Excellence)** → logs centralizados, alertas, monitoreo de disponibilidad y seguridad.

---

## 🔗 Resumen

* Diseño de red de **dos niveles** con seguridad, alta disponibilidad y escalabilidad.
* Integración de **Azure Front Door, Application Gateway, Load Balancer, VNet y NSG**.
* Tráfico interno seguro por **Azure backbone**, tráfico externo optimizado y protegido por WAF.
* Cumple con **Well-Architected Framework**: seguridad, rendimiento, fiabilidad, costo y operaciones.

