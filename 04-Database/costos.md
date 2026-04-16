# Resumen Costos

| Modelo | Tier | Submodelo | Hardware | Replicación / Failover Group | Escalamiento | Costo Normalizado | Caso de uso |
|--------|------|-----------|----------|-------------------------------|--------------|-------------------|-------------|
| DTU | Basic | N/A | Fijo | Sin réplica | No | 1 | Dev/Test, cargas mínimas |
| DTU | Basic | N/A | Fijo | Con réplica | No | 2 | DR barato, baja criticidad |
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
