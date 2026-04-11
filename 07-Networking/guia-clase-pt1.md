## 🧭 Checklist corto del módulo

* Arquitectura de red en Azure
* Modelo de defensa en capas (Zero Trust aplicado a red)
* Diseño de VNets y subnets
* Topología hub-and-spoke
* Peering entre VNets
* Seguridad de red (NSG, ASG, Firewall, DDoS)
* Enrutamiento (system routes + UDR)
* Conectividad híbrida (VPN Gateway / ExpressRoute)
* Salida a internet (NAT)

---

## 🗂️ Estructura sugerida de la clase

---

## 1. Visión general: arquitectura de red en Azure

**Objetivo:** Entender cómo se diseña una red en la nube de forma segura y escalable.

**Qué explicar:**

* Azure networking permite:

  * Conectar recursos en Azure
  * Conectar on-premises con cloud
  * Proteger y controlar tráfico

* La red no es solo conectividad:

  * Es **seguridad + segmentación + control + rendimiento**

**Idea clave:**

> La red en cloud es una arquitectura de seguridad distribuida, no un cable virtual.

---

## 2. Seguridad en capas (defensa en profundidad)

**Objetivo:** Entender el modelo de seguridad aplicado a redes.

**Capas típicas:**

* Física (datacenter)
* Identidad
* Perímetro
* Red
* Cómputo
* Aplicación
* Datos

**Servicios asociados:**

| Capa      | Ejemplos                        |
| --------- | ------------------------------- |
| Identidad | Entra ID, Conditional Access    |
| Perímetro | DDoS Protection, Azure Firewall |
| Red       | NSG, ASG                        |
| Cómputo   | Defender for Cloud              |
| Datos     | Encryption, Key Vault           |

**Idea clave:**

> No hay una sola barrera de seguridad: hay múltiples controles superpuestos.

---

## 3. Azure Virtual Network (VNet)

**Objetivo:** Entender el bloque fundamental de red en Azure.

**Qué explicar:**

* VNet = red privada aislada en Azure
* Comunicación interna por defecto habilitada
* Permite:

  * Subnets
  * Segmentación
  * Control de tráfico

**Componentes clave:**

* Subnets
* NICs
* IP ranges

**Regla importante:**

> Todo lo relacionado (VM, NIC, VNet) debe estar en la misma región.

---

## 4. Diseño de redes: patrones principales

### 🟢 1. Red única (single VNet)

* Simple
* Menos control
* Uso limitado en entornos grandes

Ejemplo:

* Subnet web
* Subnet database
* NSG controla tráfico

---

### 🟡 2. Múltiples VNets con peering

* Separación por workloads
* Conectividad controlada
* Escalabilidad media

---

### 🔵 3. Hub-and-Spoke (recomendado)

**Arquitectura estándar enterprise**

* Hub = servicios compartidos
* Spokes = workloads aislados

**Hub contiene:**

* Firewall
* VPN / ExpressRoute gateway
* Bastion

**Spokes contienen:**

* Apps
* VMs
* PaaS aislado

**Idea clave:**

> El hub controla la seguridad centralizada; los spokes escalan de forma independiente.

---

## 5. Peering entre VNets

**Objetivo:** Conectar redes privadas dentro de Azure.

* Conexión privada sobre backbone de Azure
* Baja latencia
* Alta velocidad

**Características:**

* No hay internet público
* Puede ser cross-region
* Puede ser cross-subscription

---

## 6. Seguridad de red

### 🔐 NSG (Network Security Groups)

* Controla tráfico a nivel subnet o NIC
* Reglas inbound/outbound

### 🧩 ASG (Application Security Groups)

* Agrupa VMs por rol lógico
* Simplifica reglas NSG

### 🧱 Azure Firewall

* Inspección centralizada
* Control de tráfico entre redes

### 🌐 DDoS Protection

* Protege contra ataques de saturación

---

## 7. Enrutamiento de red

**Objetivo:** Controlar hacia dónde viaja el tráfico.

### Tipos:

* System routes (automáticas)
* User Defined Routes (UDR)

**Casos típicos:**

* Forzar tráfico a firewall
* Inspección centralizada
* Control de tráfico entre spokes

**Idea clave:**

> Routing = control del camino del tráfico.

---

## 8. Salida a internet (Egress)

**Opciones:**

| Método           | Característica           |
| ---------------- | ------------------------ |
| Public IP por VM | Simple pero no escalable |
| Load Balancer    | Intermedio               |
| NAT Gateway      | Recomendado              |

**NAT Gateway:**

* Escalable
* Centralizado por subnet
* IP estable
* Más seguro

---

## 9. Conectividad híbrida

### 🔵 VPN Gateway

* Conexión sobre internet
* Site-to-site / point-to-site
* Flexible y más barato

---

### 🟣 ExpressRoute

* Conexión privada
* No usa internet público
* Alta confiabilidad
* Baja latencia

**Comparación clave:**

| VPN        | ExpressRoute     |
| ---------- | ---------------- |
| Internet   | Private circuit  |
| Flexible   | Enterprise-grade |
| Más barato | Más caro         |

---

## 10. Topología híbrida recomendada

**Modelo típico:**

* Hub VNet

  * VPN Gateway
  * ExpressRoute
  * Firewall
* Spokes conectados por peering

---

## 🎯 Escenarios prácticos

### Escenario 1: Empresa simple

* Una sola VNet
* Subnets por capa

---

### Escenario 2: Empresa mediana

* VNets separadas
* Peering

---

### Escenario 3: Enterprise global

* Hub-and-spoke
* Firewall central
* ExpressRoute + VPN failover

---

## 🧠 Idea final del módulo

* VNet = unidad básica de red
* Subnets = segmentación
* Peering = conectividad privada
* Hub-and-spoke = arquitectura enterprise
* NAT + Firewall = control de tráfico
* VPN / ExpressRoute = conexión híbrida

