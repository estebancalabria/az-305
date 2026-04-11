# 📘 Azure Subscriptions y Billing — Guía didáctica completa

## 🧭 Contexto general (qué estuvimos viendo)

Cuando una empresa empieza a usar :contentReference[oaicite:0]{index=0}, no crea “una suscripción suelta”, sino que se construye una estructura completa de:

- Identidad (quién es la empresa)
- Facturación (quién paga)
- Suscripciones (dónde se usan los recursos)
- Organización (cómo se gobierna todo)

---

# 🏢 1. Punto de partida de una empresa en Azure

Una empresa que quiere usar Azure normalmente empieza desde:

👉 https://portal.azure.com  
(o https://azure.microsoft.com)

Desde ahí ocurre el onboarding inicial.

---

## 🧱 1.1 Qué se crea automáticamente

Cuando la empresa se registra por primera vez:

### Se crea un **Tenant**
Basado en :contentReference[oaicite:1]{index=1}

El tenant es:
- La identidad de la empresa
- Donde viven usuarios, grupos y roles
- El “root” organizacional de Azure

---

### Se crea también:

- 💳 Billing Account (facturación)
- ☁️ Subscription inicial (uso de Azure)

---

# 🧱 2. Estructura base real

```text
Microsoft Entra ID (Tenant)
│
├── Billing Account
└── Subscription inicial (Default)
````

---

# 💳 3. ¿Qué es una Billing Account?

Es el nivel donde se define:

* Quién paga Azure
* Cómo se paga (tarjeta, factura o contrato)
* Cómo se agrupan las suscripciones

👉 Importante:

* No es lo mismo que una suscripción
* Una billing account puede tener muchas suscripciones

---

## 🧾 Ejemplo real

```text
Billing Account (Empresa)
│
├── Subscription DEV
├── Subscription TEST
└── Subscription PROD
```

---

# ☁️ 4. ¿Qué es una Subscription en Azure?

Una subscription es:

👉 Un contenedor de recursos donde se despliega todo lo técnico:

* Máquinas virtuales
* Bases de datos
* APIs
* Storage
* Redes

---

## 🎯 Características clave

* Tiene un límite de recursos y cuotas
* Tiene su propio control de costos
* Tiene su propio nivel de seguridad (RBAC)
* Se factura dentro de una billing account

---

# 🧭 5. ¿Conviene usar varias suscripciones?

👉 Sí, es una **mejor práctica estándar**

## 🟢 Beneficios

### 🔐 Seguridad

* DEV no afecta PROD
* Menor riesgo de errores críticos

### 💰 Costos

* Separación clara de gastos
* Control por entorno

### 🧪 Gobernanza

* Políticas distintas por entorno
* DEV más permisivo / PROD más restrictivo

---

## 🏗️ Arquitectura típica

```text
Tenant (Entra ID)
│
├── Subscription DEV
├── Subscription TEST
└── Subscription PROD
```

---

# 💸 6. ¿Cada suscripción tiene su tarjeta?

❌ No.

## Modelo real:

```text
Billing Account → define el pago
Subscriptions → consumen recursos
```

---

## 🟢 Caso normal

Una sola tarjeta o contrato:

```text
Billing Account (Visa Empresa)
│
├── DEV
├── TEST
└── PROD
```

👉 Resultado:

* Una sola factura
* Desglose por suscripción

---

## 🟡 Caso avanzado

Separación de billing:

* DEV en una billing account
* PROD en otra

👉 Solo en casos especiales (multi-empresa o centros de costo separados)

---

# 🏢 7. Tipos de suscripciones en Azure

## 1. Pay-As-You-Go

* Pago por uso
* Ideal para empezar

## 2. Dev/Test

* Descuentos para entornos no productivos
* Uso restringido (no producción)

## 3. Enterprise Agreement (EA)

* Contrato corporativo grande
* Precios negociados

## 4. Microsoft Customer Agreement (MCA)

* Modelo moderno de facturación empresarial

## 5. Cloud Solution Provider (CSP)

* Azure gestionado por partner
* Soporte incluido del partner

---

# 💳 8. ¿Cómo se crea una Billing Account?

## 🟢 Caso 1 (más común)

Se crea automáticamente cuando:

* creás la primera suscripción
* agregás método de pago

👉 Azure la genera solo

---

## 🧱 Estructura creada automáticamente:

```text
Billing Account
├── Billing Profile (forma de pago)
└── Invoice Sections (segmentación de factura)
```

---

## 🟡 Caso 2 (empresa)

* Se crea desde contrato EA / MCA / CSP
* La gestiona Microsoft o un partner
* La empresa no la crea manualmente desde cero

---

# 🚀 9. Flujo real de una empresa usando Azure

## 🧭 Paso a paso

### 1. Decisión

“Vamos a usar Azure”

---

### 2. Registro inicial

* Entra a portal.azure.com
* Email corporativo

---

### 3. Identidad

Se crea el tenant (Entra ID)

---

### 4. Facturación

Se crea billing account

---

### 5. Primera suscripción

* DEV o default
* con método de pago

---

### 6. Escalado

Se crean más suscripciones:

* DEV
* TEST
* PROD

---

### 7. Gobernanza (nivel empresa)

Se agregan:

* Management Groups
* Azure Policies
* RBAC
* Security baseline

---

# 🏗️ 10. Arquitectura final típica (empresa madura)

```text
Tenant (Entra ID)
│
├── Management Group: Platform
│   ├── Shared Subscription
│
├── Management Group: Dev
│   ├── DEV Subscription
│
├── Management Group: Prod
│   ├── PROD Subscription
│
└── Management Group: Security
```

---

# 🎯 Resumen final

✔ Una empresa no “compra suscripciones”, construye un entorno
✔ Todo empieza en el tenant (Entra ID)
✔ Billing account controla el pago
✔ Subscriptions contienen los recursos
✔ Lo normal es separar DEV / TEST / PROD
✔ En empresas grandes todo se gestiona con contratos (EA/MCA/CSP)

---

# 💡 Idea clave mental

> Azure no es “una cuenta con recursos”
> es una **estructura organizacional completa de identidad + billing + gobernanza**

---


