# 🧩 Caso de estudio: Diseño de infraestructura de red para aplicación BI

## 🏢 Contexto

* Una empresa en expansión está modernizando su aplicación **Business Intelligence (BI)**, interna y crítica para el negocio.  
* La aplicación es **tres capas**:
  * Front-end: IIS Web Servers  
  * Middle-tier: .NET Framework business logic  
  * Back-end: SQL Server Always On Availability Group  

* Objetivos de la red:
  * Alta disponibilidad y recuperación ante desastres (SLA 99.99%, RPO 10 min, RTO 2 hrs)  
  * Conectividad híbrida con el datacenter on-premises mediante **ExpressRoute**  
  * Minimizar costos y recursos de red centrales  
  * Filtrado de tráfico seguro y granular entre capas  

---

## 📋 Situación Actual

* La aplicación requiere conectividad interna de alta disponibilidad.  
* Todo tráfico entre VMs de diferentes capas debe estar restringido a los puertos necesarios.  
* Limitaciones de espacio de IP y subredes hacen complicado asignar subredes dedicadas a cada capa.  

---

## 🏗️ Arquitectura de red propuesta

```mermaid
graph TD
    OnPrem[Datacenter On-Premises] --> ER[ExpressRoute - Circuit Principal]
    ER --> HubVNet[Hub Virtual Network]

    HubVNet --> FW[Azure Firewall - Traffic Filtering]
    HubVNet --> VPN[VPN Gateway - Failover Connectivity]

    HubVNet --> SpokeVNet[Spoke Virtual Network - BI App]

    SpokeVNet --> NSG_FE[Front-End NSG]
    SpokeVNet --> FE[Front-End IIS Web Servers]

    SpokeVNet --> NSG_BE[Middle-Tier NSG]
    SpokeVNet --> BE[Middle-Tier .NET Servers]

    SpokeVNet --> NSG_DB[Back-End NSG]
    SpokeVNet --> DB[SQL Server Always On]

    FE --> LB_FE[Internal Load Balancer FE]
    BE --> LB_BE[Internal Load Balancer BE]
````

**Componentes y justificación**

* **ExpressRoute** → conectividad híbrida rápida y segura desde on-premises al hub VNet.
* **VPN Gateway** → failover económico en caso de caída de ExpressRoute.
* **Hub-Spoke VNet topology** → centraliza conectividad híbrida y filtrado, reduce recursos duplicados.
* **Azure Firewall** → inspección y control centralizado de tráfico entre on-premises y VMs, permite aplicar reglas de filtrado por aplicación y puerto sin depender de IP fijas.
* **NSGs por capa** → control granular de tráfico, limitando solo a los puertos necesarios para cada tier.
* **Load Balancers internos** → alta disponibilidad y distribución de tráfico entre instancias de cada tier.
* **Private Endpoints para SQL / Storage** → acceso seguro sin exponer servicios a internet, evitando hard-coded secrets.

---

## ⚙️ Consideraciones de integración

* **Compute Modernization** → si la capa de middle-tier se moderniza a App Services o containers, se puede reducir necesidad de subredes dedicadas y LB internos, usando **Service Endpoints y Private Link**.
* **Storage / Relational Database** → configurar **Private Endpoints** y **role-based access (RBAC)** para que solo aplicaciones autorizadas accedan al almacenamiento y SQL.
* **Secret Management** → Azure Key Vault para eliminar credenciales hard-coded, integrado con Managed Identity de VMs o App Services.

---

## ⚙️ Aplicación del Well-Architected Framework

* **Fiabilidad (Reliability)** → ExpressRoute + failover VPN, Load Balancers internos, Always On SQL.
* **Rendimiento (Performance Efficiency)** → LB internos, segmentación de subredes por capa, optimización de rutas en VNet.
* **Seguridad (Security)** → NSG, Firewall, Private Endpoints, Key Vault, acceso mínimo necesario por capa.
* **Optimización de costos (Cost Optimization)** → Hub-Spoke topology, VPN failover en lugar de circuito redundante costoso, PaaS cuando sea posible.
* **Operaciones (Operational Excellence)** → monitoreo con Azure Monitor, alertas de firewall y NSG, logging de tráfico y auditoría de accesos.

---

## 🔗 Resumen

* Red **tres capas** segura, escalable y resiliente para aplicación BI.
* Hub-Spoke topology centraliza conectividad híbrida y filtrado de tráfico.
* Private Endpoints y Managed Identity eliminan hard-coded credentials y aseguran acceso solo a usuarios y aplicaciones autorizadas.
* Cumple con los cinco pilares del **Well-Architected Framework**.
