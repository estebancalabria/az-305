# Clase Cuatro - 17 de Abril del 2026

# Repaso con valor agregado

* Networking (Relacion con Aplicaciones y Seguridad)
      * Si alguien abre un puerto en una ip publica aparece en   =====>   ???
      * WAF
          * Front Door (A nivel Mundial / CDN)
          * Application Gateway - WAF/LB (A nivel conectividad en nuestra VNET)
          * DDos (Lo menciono ahora no lo mencione antes)
* Integracion
  * Datos
      * Almacenamiento
          * Data Lake
      * Ingesta
          * Data Factory
          * Event Hub (si es real time)
      * Manipulacion
          * Data Bricks
      * Analitica
          * Synapse Analytics
      * Presentacion
          * PowerBI integracion pulida con Azure
  * Applicaciones (Arquitectura Dev)
    * Mensajes (Desacoplar apps)
        * Service Bus
            * Compatiblidad con RabbitMQ
            * Modo 1 a 1 (queue), modo (1 a N) topics
            * Procesamiento en paralelo
            * Fifo
        * Storage Queue
    * Eventos
        * Event Grid (azul)
            * Los Triggers de Azure
            * Solucion tambien la podemos aprovechar para nuestas Apps (Az-204)
        * Event Hub (verde/amarillo)
            * Ingesta Masiva de eventos
            * Telemetria en tiempo Real
            * Decomprimir cargas de trabajo (ej: presion una BD)
            * Real Time
      * Otros servicios
        * Logic Apps
        * Apim (Api Management)
          
# Excelencia Operacional

## Monitoring 

* Metodologico
  * Definida la estragia de Monitoreo

### Tipo de Monitorio

* Monitoreo de Seguridad
    * Entra ID
    * Tiene sus propia herramientas
* Monitoreo en Networking
    * Tiene su se de herramientas puntuales
* Monitoreo Operacional
    * Que pasa que en azure
    * Que se esta usando
    * Quien cada cosa
    * Que recursos (memoria, cpu, red) estamos consumiendo 
* Monitoreo de costos
    * Optimizacion de Costos
    * Tienen sus propias herramientas
        * Cost Analysis
        * Budgets
* Monitore de Aplicacion
    * Orientado a una carga de trabajo Especifica
        * AppService
        * Kubernetes
        * SQL Server
        * Function App
    * Un SDK paraticular para que los DEV orqueten su propio logiing

### Recursos de Azure

* Application Insiguts
* Azure Monitor
    * Coordina la ingesta de Logs
    * Este servicio No Guarda Informacion
    * Es un servicio unico que ya esta funcionando
* Log Analytics
    * Persiste nuestros Logs
* Lenguaje de Consulta
  * KQL
* Application Insights
  * SDK (para devs)
  * Monitoring pre Condigurado
  * Tableros y Vistas Ya armados
* Azure Workbook
  * Visualizacion y Dashboards
* Activity Log
  * Log Individual de Cada Servicio

<img width="758" height="670" alt="image" src="https://github.com/user-attachments/assets/993a25f3-018c-4f48-aec7-f614a239c4fb" />


# Buisiness Conuity 

# Migracion (WAF) - Tools

# IA 

# Tips Certificacion

* Deacoplar, Cuello de Botella   ======>     (Bottleneck)Service Bus/Queues 
* Carga Variable/Impredecible    ======>     Serverless
* Mandar Mails ====> Logic Apps  ======>     SendGrid (La tecnologia de MS en Azure para mandar mails)
* Real Time  =====> Event Hub
