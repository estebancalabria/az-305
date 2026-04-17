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

### Vision Arquitecural de Monitoring

* Definir la infraestructura para logiing
     * Tratar de centralizar uno o pocos log workspace
          * Ojo con tener muchos, generalmente no esta asociado a una buena practica
          * Excepcion de logs especificos de cargas de trabajo (igual uno por carga de traba)
          * Excepcion considerar el tema de separar logs por regiones de ultima
          * Ojo que el portal suele contradecir esa buena practica es recomendable asesgurarla con unas policy
     * Tener un Resoruce Group para logiing es una practica habitual
          * Porque no un MG en el MG de platform <<
          * Porque no una subscripcion especial para lo de logiing <<
* Definir la meotodologia de logging
     * Que vamos a mirar
     * Objetivo
     * Cuando
          * En que momento quiero grabar logs para optimizar costos
* Definir estrategias de repuesta ante situaciones que puedan pasar
     * Configurar las alertas


* Consideraciones y Buenas practicas
     * Salvo el activity Log de cada Recursos los Logs operacionales no se guardan por si solos en el log analitics
          * Tengo que hacerlo explicitamente
          * 
<img width="1824" height="241" alt="image" src="https://github.com/user-attachments/assets/9f0d49dc-dd07-4447-98da-d21adc14a4ca" />

     * La ingesta de logs no es costosa de por si pero la cantidad de logs se dispara exponencialmente
     * A niveo operacional el Activity Log a nivel subscripcion es un buen lugar para estar atento << Es gratis
     * La ingesta de logs (el tiempo que tarda en aparecer en mi log analytics) no es inmediata (puede tardar 1-10 minutos)
     * Si neesito analizar logs en Casi Real Time voy a usar Event Hub

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


## Caso de Estudio (Logging en tiempo Real)

* Actualmente se guarda el Activity Log de la subscripcion en un workspace
* Se observa que hay oepraciones criticas que hace un usuario y necesito enterarme y responder justo en el momento que las realiza

<img width="745" height="187" alt="image" src="https://github.com/user-attachments/assets/7915af37-d126-4512-b7e3-1c2d86639d4a" />

* Propuesta

<img width="905" height="341" alt="image" src="https://github.com/user-attachments/assets/7eba3473-2186-4efa-ae2d-332fcbfc8051" />


# Buisiness Conuity 

# Migracion (WAF) - Tools

# IA 

# Tips Certificacion

* Deacoplar, Cuello de Botella   ======>     (Bottleneck)Service Bus/Queues 
* Carga Variable/Impredecible    ======>     Serverless
* Mandar Mails ====> Logic Apps  ======>     SendGrid (La tecnologia de MS en Azure para mandar mails)
* Real Time  =====> Event Hub
