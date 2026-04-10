## 🧭 Escenarios donde aplica **Reliability**

### 🚨 1. Fallo de un servidor o máquina virtual

* Un nodo deja de responder o se cae
* El sistema **redirige tráfico automáticamente**
* Se mantiene el servicio sin interrupción visible

👉 Ejemplo Azure:

* Availability Zones
* Load Balancer
* Auto-healing en VM Scale Sets

---

### 🔄 2. Caída parcial de un servicio crítico

* Una API deja de responder
* Otra instancia toma el control
* El usuario sigue operando sin notar el problema

👉 Ejemplo:

* App Service autoscaling
* Traffic Manager failover

---

### ⚡ 3. Picos de demanda inesperados

* Aumenta tráfico repentinamente
* El sistema escala automáticamente
* Evita caída por saturación

👉 Ejemplo:

* Azure Autoscale
* AKS scaling

---

### 🌍 4. Fallo de una región completa

* Una región de Azure deja de estar disponible
* El sistema cambia a otra región
* Continuidad del servicio asegurada

👉 Ejemplo:

* Geo-redundancy
* Azure Site Recovery

---

### 💾 5. Corrupción de datos o error de aplicación

* Se detecta inconsistencia
* Se restaura versión estable automáticamente
* Se minimiza impacto al usuario

👉 Ejemplo:

* Backups automáticos
* Point-in-time restore

---

### 🔧 6. Actualizaciones o mantenimiento sin downtime

* Se actualiza la plataforma
* Se mantiene servicio activo durante el cambio
* No hay interrupción perceptible

👉 Ejemplo:

* Blue/green deployment
* Rolling updates

---

## 🧠 resumen simple (para slide si querés uno extra)

> Reliability aplica cuando el sistema debe seguir funcionando correctamente pese a fallos, carga extrema o interrupciones en componentes críticos.

