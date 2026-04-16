# 🧭 **Introducción**
En Azure, un App Service puede operar en tres modos:

- **Público**  
- **Público + VNet Integration** (OUTBOUND privado)  
- **Privado (Private Endpoint)** (INBOUND privado)

Y según eso, cambia si necesitás:

- **Front Door** (capa global)  
- **Application Gateway** (capa regional)  
- **Private Endpoint** (inbound privado)  
- **VNet Integration** (outbound privado)

La regla que ordena todo:

> **Private Endpoint = inbound privado.  
> VNet Integration = outbound privado.  
> Front Door solo necesita App Gateway cuando el backend es privado.**

Con eso, vamos a los escenarios.

---

# 🟦 **ESCENARIO 1 — App Service PÚBLICO + Front Door + VNet Integration (acceso a servicios privados)**  
*(Sin App Gateway)*

## 🧩 **Cuándo se usa**
- App Service **público**, pero **restringido solo a Front Door**.  
- Querés **WAF global**, POPs, CDN, failover multi‑región.  
- El App Service necesita conectarse a **SQL/Storage/Redis privados**.  
- No querés usar App Gateway.

## 🔌 **Conectividad dentro de la VNet**
- App Service usa **VNet Integration** para acceder a Private Endpoints de SQL/Storage/etc.  
- El App Service **sigue siendo público**, pero **blindado** (solo Front Door entra).

```
Front Door → App Service (público, restringido)
App Service → VNet Integration → Private Endpoint → SQL/Storage
```

## ⭐ Pros
- Arquitectura simple.  
- WAF global + CDN + POPs.  
- App Service accede a servicios privados.  
- Sin App Gateway → menos costo.

## ⚠️ Contras
- Backend sigue siendo público (aunque restringido).  
- No sirve si necesitás inbound privado.

## 🛠 Pasos Azure
1. Crear Front Door.  
2. Backend = App Service público.  
3. App Service → Access Restrictions → permitir solo Front Door.  
4. App Service → habilitar **VNet Integration**.  
5. Crear Private Endpoints para SQL/Storage.  
6. Probar conectividad privada.

---

# 🟩 **ESCENARIO 2 — App Service PRIVADO (Private Endpoint) + App Gateway + Front Door + VNet Integration**  
*(Patrón enterprise completo)*

## 🧩 **Cuándo se usa**
- App Service **privado** (Private Endpoint).  
- Querés exponerlo a Internet **solo por Front Door**.  
- Necesitás **zero trust**, compliance, WAF global + regional.  
- App Service necesita conectarse a **otros servicios privados** (SQL/Storage) por VNet Integration.

## 🔌 **Conectividad dentro de la VNet**
- App Service recibe tráfico **inbound privado** por su **Private Endpoint**.  
- App Service usa **VNet Integration** para acceder a SQL/Storage privados.

```
Front Door → App Gateway → Private Endpoint → App Service
App Service → VNet Integration → Private Endpoint → SQL/Storage
```

## ⭐ Pros
- Backend 100% privado.  
- Máxima seguridad.  
- WAF global + WAF regional.  
- Multi‑región real.

## ⚠️ Contras
- Es el patrón más caro.  
- Más complejo de operar.

## 🛠 Pasos Azure
1. App Service → habilitar **Private Endpoint**.  
2. App Service → habilitar **VNet Integration**.  
3. Crear App Gateway en la VNet.  
4. Backend del AppGW = Private Endpoint del App Service.  
5. Crear Front Door.  
6. Backend del FD = App Gateway.  
7. Configurar WAF global + regional.  
8. Crear Private Endpoints para SQL/Storage.  
9. Probar conectividad privada.

---

# 🟧 **ESCENARIO 3 — App Service PRIVADO (Private Endpoint) + App Gateway con IP pública (SIN Front Door) + VNet Integration**  
*(Patrón regional clásico)*

## 🧩 **Cuándo se usa**
- App Service **privado** (Private Endpoint).  
- Querés exponerlo a Internet desde **una sola región**.  
- No necesitás POP global, CDN ni multi‑región.  
- App Service necesita conectarse a **SQL/Storage privados**.

## 🔌 **Conectividad dentro de la VNet**
- App Service recibe tráfico **inbound privado** por Private Endpoint.  
- App Service usa **VNet Integration** para acceder a SQL/Storage privados.

```
Internet → App Gateway (IP pública) → Private Endpoint → App Service
App Service → VNet Integration → Private Endpoint → SQL/Storage
```

## ⭐ Pros
- Backend privado sin exposición directa.  
- Arquitectura más simple que FD + AppGW.  
- Menor costo que Front Door.

## ⚠️ Contras
- Sin POP global.  
- Sin CDN.  
- Sin failover multi‑región.

## 🛠 Pasos Azure
1. App Service → habilitar **Private Endpoint**.  
2. App Service → habilitar **VNet Integration**.  
3. Crear App Gateway con **IP pública**.  
4. Backend del AppGW = Private Endpoint del App Service.  
5. Crear Private Endpoints para SQL/Storage.  
6. Probar conectividad privada.

---

# 🧠 **Resumen final (tabla comparativa)**

| Escenario | App Service | Inbound | Outbound | ¿Front Door? | ¿AppGW? | Acceso a SQL/Storage privados |
|----------|-------------|---------|----------|--------------|---------|-------------------------------|
| **1. Público + FD + VNet Integration** | Público | FD → AS | VNet Integration | ✔ | ❌ | ✔ (via VNet Integration) |
| **2. Privado + AppGW + FD + VNet Integration** | Privado (PE) | FD → AppGW → PE | VNet Integration | ✔ | ✔ | ✔ (via VNet Integration) |
| **3. Privado + AppGW (IP pública) + VNet Integration** | Privado (PE) | Internet → AppGW → PE | VNet Integration | ❌ | ✔ | ✔ (via VNet Integration) |

