# Resumen Costos

| Modelo | Tier | Submodelo | Hardware | Replicación / Failover Group | Escalamiento | Costo Normalizado | Caso de uso |
|--------|------|-----------|----------|-------------------------------|--------------|-------------------|-------------|
| DTU | Basic | N/A | Fijo | Sin réplica | No | 1 | Dev/Test, cargas mínimas |
| DTU | Standard S0 | N/A | Fijo | Sin réplica | No | 2 | Web apps pequeñas |
| DTU | Standard S0 | N/A | Fijo | Con réplica | No | 4 | DR simple, cargas moderadas |
| DTU | Premium P1 | N/A | Fijo | Sin réplica | No | 110 | OLTP crítico, baja latencia |
| DTU | Premium P1 | N/A | Fijo | Con réplica | No | 221 | DR crítico, alta disponibilidad |
| vCore | General Purpose | Provisioned | Gen5 | Sin réplica | Sí | 74 | Producción estándar |
| vCore | General Purpose | Provisioned | Gen5 | Con réplica | Sí | 148 | HA multi‑región costo‑eficiente |
| vCore | General Purpose | Provisioned | Fsv2 | Sin réplica | Sí | 89 | CPU alta frecuencia, APIs rápidas |
| vCore | General Purpose | Provisioned | Fsv2 | Con réplica | Sí | 178 | HA + performance CPU |
| vCore | General Purpose | Provisioned | DC-series | Sin réplica | Sí | 104 | Datos sensibles, confidential computing |
| vCore | General Purpose | Provisioned | DC-series | Con réplica | Sí | 208 | HA + confidential computing |
| vCore | General Purpose | Provisioned | M-series | Sin réplica | Sí | 223 | Catálogos enormes, memoria intensiva |
| vCore | General Purpose | Provisioned | M-series | Con réplica | Sí | 446 | HA + memoria extrema |
| vCore | General Purpose | Serverless | Gen5 (Fijo) | Sin réplica | Sí | 76 | Cargas variables, ahorro automático |
| vCore | General Purpose | Serverless | Gen5 (Fijo) | Con réplica | Sí | 153 | HA + cargas intermitentes |
| vCore | Business Critical | Provisioned | Gen5 | Sin réplica | Sí | 200 | OLTP crítico, baja latencia |
| vCore | Business Critical | Provisioned | Gen5 | Con réplica | Sí | 400 | HA crítico multi‑región |
| vCore | Business Critical | Provisioned | Fsv2 | Sin réplica | Sí | 240 | OLTP crítico + CPU alta frecuencia |
| vCore | Business Critical | Provisioned | Fsv2 | Con réplica | Sí | 480 | HA + performance CPU extremo |
| vCore | Business Critical | Provisioned | DC-series | Sin réplica | Sí | 280 | OLTP crítico + confidential computing |
| vCore | Business Critical | Provisioned | DC-series | Con réplica | Sí | 560 | HA + seguridad máxima |
| vCore | Business Critical | Provisioned | M-series | Sin réplica | Sí | 600 | OLTP crítico + memoria masiva |
| vCore | Business Critical | Provisioned | M-series | Con réplica | Sí | 1200 | HA + memoria extrema |
| vCore | Hyperscale | Provisioned | Gen5 (Fijo) | Sin réplica | Sí | 81 | Bases enormes, crecimiento rápido |
| vCore | Hyperscale | Provisioned | Gen5 (Fijo) | Con réplica | Sí | 162 | Lecturas masivas, scale‑out |

# Nota sobre DTU Premium

Dale, Esteban. Vamos a lo importante, sin vueltas y con criterio de arquitecto/FinOps:

---

# 🎯 **¿Por qué DTU Premium es más caro?**

Porque **Premium usa hardware distinto** y una arquitectura que *no existe* en Basic/Standard:

### ✔️ 1. **Storage local SSD súper rápido (local SSD)**  
No es el storage remoto estándar de Azure SQL.  
Premium usa **SSD local** → latencias mucho más bajas.

### ✔️ 2. **Más IOPS y throughput**  
Premium está pensado para **OLTP de alta exigencia**, no para workloads comunes.

### ✔️ 3. **Más recursos por DTU**  
Un DTU de Premium **no es igual** a un DTU de Standard.  
Tiene más CPU, más memoria, más IOPS.

### ✔️ 4. **Alta disponibilidad interna más robusta**  
Premium tiene un modelo de HA más parecido a Business Critical.

👉 **Por eso es caro: Premium es “el Business Critical del mundo DTU”.**

---

# 🎯 **¿Tiene sentido usar Premium hoy?**

**Casi nunca.**  
Y te lo digo directo:

### ✔️ **DTU es un modelo viejo**  
Microsoft no lo va a deprecar mañana, pero **no evoluciona**.

### ✔️ **Premium solo tiene sentido si ya estás en DTU y no querés migrar a vCore**  
Ejemplo típico:

- Tenés una app legacy  
- No querés tocar nada  
- Estás en Standard  
- Necesitás más IOPS o menor latencia  
- No querés migrar a vCore por compatibilidad o riesgo

Entonces sí: **Premium P1** es un “upgrade rápido”.

### ✔️ **Si estás creando algo nuevo → NO uses Premium**  
Siempre vCore.

---

# 🎯 **¿Cuándo usar Premium en vez de vCore?**

Solo en estos casos:

### ✔️ **1. Tenés una base DTU existente y querés mejorar performance sin migrar**  
Premium es un “drop‑in upgrade”.

### ✔️ **2. Tu workload es chico pero muy sensible a latencia**  
Premium P1 puede ser más barato que BC 2 vCores.

### ✔️ **3. No querés cambiar el modelo de licenciamiento**  
DTU = precio fijo, simple, sin sorpresas.

### ✔️ **4. No querés recalcular vCores, memoria, IOPS, etc.**  
Premium es “subir un escalón” y listo.

---

# 🎯 **¿Qué ventaja tiene Premium sobre vCore?**

### ✔️ **Ventaja real: simplicidad**  
No elegís hardware, no elegís vCores, no elegís storage.  
Es un “paquete cerrado”.

### ✔️ **Ventaja puntual: puede ser más barato que BC**  
Para cargas OLTP chicas pero sensibles a latencia, Premium P1 puede costar menos que Business Critical 2 vCores.

### ✔️ **Ventaja operativa: cero migración**  
Si ya estás en DTU, pasar a Premium es inmediato.

---

# 🎯 **¿Cuándo NO usar Premium?**

Siempre que puedas elegir:

- **General Purpose** → workloads normales  
- **Business Critical** → OLTP crítico  
- **Hyperscale** → bases grandes  
- **Serverless** → cargas variables

Premium queda como un **tier legacy**.

---

# 🧠 **Resumen ultra corto**

> **Premium es caro porque usa SSD local, más IOPS, más CPU y un modelo de HA superior.  
> Hoy solo tiene sentido si ya estás en DTU y querés mejorar performance sin migrar a vCore.  
> Para workloads nuevos → siempre vCore.**

---

Si querés, te armo una **tabla comparativa Premium vs Business Critical vs GP**, con casos de uso y costos normalizados.
