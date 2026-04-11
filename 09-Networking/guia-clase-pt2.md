## 🧑‍🏫 Guía Docente – AZ-305

### 🌐 Diseño de Infraestructura de Red – Parte 2

---

## 🎯 ¿Qué cubre esta clase?

En esta sesión se profundiza en el diseño de infraestructura de red en Azure, enfocándose en:

* Diseño de servicios de **entrega de aplicaciones (Application Delivery)**
* Selección de soluciones de **balanceo y enrutamiento de tráfico**
* Diseño de estrategias de **protección de aplicaciones y redes**
* Arquitecturas seguras con enfoque en **defensa en profundidad**

---

## 🧭 Flujo conceptual de la clase

1. Diseño de servicios de entrega de aplicaciones
2. Azure Load Balancer (L4)
3. Application Gateway (L7 regional)
4. Traffic Manager (DNS global L4)
5. Azure Front Door (global L7)
6. Content Delivery Network (CDN)
7. Diseño de protección de aplicaciones
8. DDoS Protection, WAF, NSG y Azure Firewall
9. Service Endpoints vs Private Link
10. Bastion y JIT access
11. Arquitectura híbrida de ejemplo end-to-end

---

## 🚀 1. Diseño de servicios de entrega de aplicaciones

### 🎯 Objetivo

Seleccionar el servicio correcto para enrutar tráfico hacia aplicaciones según:

* Tipo de tráfico (HTTP vs TCP/UDP)
* Alcance (regional vs global)
* Requisitos de seguridad (WAF, TLS, inspección)
* Plataforma de destino (VMs, AKS, App Service)

---

## ⚖️ 2. Azure Load Balancer (Layer 4)

### 🎯 Uso principal

Distribución de tráfico TCP/UDP de alto rendimiento.

### 🔧 Características clave:

* Balanceo a nivel **L4**
* Soporta **alta disponibilidad dentro de una región**
* Backend pools con health probes
* Público o interno
* Puede ser regional o global (cross-region)

### 💡 Casos típicos:

* Aplicaciones backend en VMs
* Alta disponibilidad en capas internas

---

## 🌐 3. Application Gateway (Layer 7 regional)

### 🎯 Uso principal

Balanceo HTTP/HTTPS con inspección avanzada.

### 🔧 Características:

* Routing basado en **URL paths**
* Multi-site hosting
* Integración con **WAF (Web Application Firewall)**
* TLS termination
* Soporta VMs, App Service, híbrido

### 💡 Casos típicos:

* Aplicaciones web empresariales
* APIs HTTP regionales

---

## 🌍 4. Traffic Manager (DNS-based global L4)

### 🎯 Uso principal

Routing global basado en DNS.

### 🔧 Características:

* No enruta tráfico directamente (usa DNS)
* Métodos: prioridad, performance, weighted
* Multi-cloud / híbrido
* Failover global

### ⚠️ Importante:

* No es proxy, solo resolución DNS

---

## 🚀 5. Azure Front Door (Global L7)

### 🎯 Uso principal

Entrega global de aplicaciones web con baja latencia.

### 🔧 Características:

* Layer 7 global
* Anycast + edge network
* WAF integrado
* TLS termination
* Path-based routing global
* CDN integrado

### 💡 Casos típicos:

* Aplicaciones globales
* SaaS distribuidos
* Alta performance web

---

## 📦 6. Content Delivery Network (CDN)

### 🎯 Objetivo

Reducir latencia mediante caching en edge.

### 🔧 Características:

* Cache de contenido estático
* Custom domains
* Compresión de archivos
* Distribución global

### 💡 Casos:

* Imágenes, videos, assets web
* Sitios con alto tráfico global

---

## 🛡️ 7. Diseño de protección de aplicaciones

### 🧱 Modelo de defensa en profundidad:

1. **DDoS Protection**
2. **Azure Firewall / NVAs**
3. **WAF (App Gateway / Front Door)**
4. **NSG (Subnet/NIC)**
5. **Private Endpoints**
6. **Identity-based access control**

---

## 🌐 8. Service Endpoints vs Private Link

### 🔹 Service Endpoints

* Mantiene acceso vía **IP pública del servicio**
* Tráfico via Azure backbone
* Gratis
* Reduce superficie de ataque

### 🔹 Azure Private Link

* Asigna **IP privada al servicio PaaS**
* Elimina exposición pública
* Mayor seguridad
* Ideal para workloads sensibles

---

## 🔥 9. Azure Firewall vs NSG

### 🧩 Network Security Group (NSG)

* Filtrado L3/L4
* Subnet o NIC level
* Control básico de tráfico

### 🧱 Azure Firewall

* Firewall centralizado (PaaS)
* NAT + threat intelligence
* Políticas globales
* Inspección avanzada

---

## 🧑‍💻 10. Acceso seguro a VMs

### 🔹 Azure Bastion

* Acceso RDP/SSH sin IP pública
* Acceso vía portal Azure
* Reduce superficie de ataque

### 🔹 Just-In-Time (JIT)

* Abre puertos solo bajo demanda
* Acceso temporal controlado
* Reduce riesgo de brute force

---

## 🔐 11. Arquitectura híbrida (caso final)

### 🧩 Escenario empresarial:

Requisitos:

* Alta disponibilidad (99.99%)
* DR (RPO 10 min / RTO 2h)
* Conectividad híbrida
* Filtrado centralizado
* Bajo costo operativo

---

### 🏗️ Solución propuesta:

#### 🌐 Conectividad:

* ExpressRoute (primario)
* VPN Gateway (failover)

#### 🛡️ Seguridad perimetral:

* Azure Firewall
* DDoS Protection

#### 🌍 Ingreso de tráfico:

* Application Gateway + WAF
* Load Balancer interno

#### 🖥️ Capa de aplicación:

* VM Scale Sets (frontend/middle tier)

#### 🗄️ Datos:

* Azure SQL + Private Endpoint

#### 🔐 Seguridad:

* NSG en cada subnet
* Acceso controlado por capas

---

## 🧠 Idea clave de la clase

> No existe un único balanceador o firewall “correcto”.
> La arquitectura depende del tipo de tráfico, escala y nivel de seguridad requerido.

---

## 📌 Resumen final

En esta sesión aprendiste a:

* Diferenciar soluciones de balanceo (L4 vs L7 global vs regional)
* Diseñar arquitectura de entrega de aplicaciones
* Aplicar defensa en profundidad en redes Azure
* Comparar Service Endpoints vs Private Link
* Diseñar accesos seguros a VMs
* Construir arquitectura híbrida enterprise end-to-end

