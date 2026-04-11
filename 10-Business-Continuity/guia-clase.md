## 🧠 1. Conceptos clave

* **Alta disponibilidad (HA):** evita caídas dentro de la misma región (zonas, balanceadores).
* **Recuperación ante desastres (DR):** recupera en otra región si todo falla.
* **Backup:** protege contra borrado, corrupción o ransomware.

### Métricas importantes:

* **RTO (Recovery Time Objective):** cuánto tiempo puede estar caído el sistema.
* **RPO (Recovery Point Objective):** cuánta pérdida de datos es aceptable.

---

## 💾 2. Azure Backup

Azure Backup es el servicio central para copias de seguridad.

* Funciona con **snapshots + copia a vault**
* Permite restauración granular o completa
* Soporta:

  * VMs
  * archivos
  * bases de datos
  * cargas híbridas

📦 Usa:

* **Recovery Services Vault** / **Backup Vault** como contenedores de gestión y seguridad

---

## ☁️ 3. Protección por tipo de almacenamiento

### 🪣 Azure Blob Storage

Azure Blob Storage

Protecciones en capas:

* Soft delete (blob y contenedor)
* Versionado
* Snapshots
* Point-in-time restore
* Resource locks
* Change feed

👉 Permite “volver atrás en el tiempo” si hay corrupción o borrado accidental.

---

### 📁 Azure Files

Azure Files

* Snapshots de file share
* Backup gestionado con Azure Backup
* Restauración a nivel de archivo o share completo
* Integración con AD para control de acceso

---

### 🗄️ Azure SQL

Azure SQL Database

Backup automático:

* Full backup semanal
* Diferenciales diarios
* Logs cada 5–10 min

Capacidades:

* Point-in-time restore
* Geo-restore
* Long-term retention (hasta años)

---

## 🖥️ 4. Backup de máquinas virtuales

* Snapshots locales (restauración rápida)
* Backups en vault (retención larga)
* Consistencia:

  * file-system consistent
  * app-consistent (ej: SQL en VM)

---

## 🔄 5. Disaster Recovery (DR)

Azure Site Recovery

* Replica workloads entre regiones o on-premises → Azure
* Permite:

  * Failover (cambio a región secundaria)
  * Failback (volver al origen)
* Usa planes de recuperación orquestados

📌 Ideal para:

* caídas regionales
* continuidad de negocio
* migraciones controladas

---

## 🧩 6. Patrón recomendado

* **Azure Backup** → “volver atrás en el tiempo” (corrupción, borrado, ransomware)
* **Azure Site Recovery** → “seguir funcionando” (caída de región)

👉 Se complementan, no se reemplazan.

---

## 🧭 7. Idea arquitectónica clave

Una estrategia completa de resiliencia siempre combina:

* HA (dentro de región)
* Backup (protección de datos)
* DR (continuidad entre regiones)
* Seguridad (soft delete + locks + aislamiento)

