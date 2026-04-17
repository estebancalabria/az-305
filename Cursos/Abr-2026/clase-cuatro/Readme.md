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
* Azure Workbook
  * Visualizacion y Dashboards
* Activity Log
  * Log Individual de Cada Servicio
* Network Watcher

<img width="758" height="670" alt="image" src="https://github.com/user-attachments/assets/993a25f3-018c-4f48-aec7-f614a239c4fb" />


## Caso de Estudio (Logging en tiempo Real Operativo)

* Actualmente se guarda el Activity Log de la subscripcion en un workspace
* Se observa que hay oepraciones criticas que hace un usuario y necesito enterarme y responder justo en el momento que las realiza
* CASO EXCLUSIVO PARA LOGS OPERACIONALES

<img width="745" height="187" alt="image" src="https://github.com/user-attachments/assets/7915af37-d126-4512-b7e3-1c2d86639d4a" />

* Propuesta

<img width="905" height="341" alt="image" src="https://github.com/user-attachments/assets/7eba3473-2186-4efa-ae2d-332fcbfc8051" />

## Monitoreo de Apps

* Application Insights
   * SDK (para devs)
   * Monitoring pre Condigurado
   * Tableros y Vistas Ya armados
   * **Live Motrics: Monitoreo en tiempo Real**

## Monitoreo de Redes

* Network Watcher
    * Topology
        * Grafico de toda la Red
    * Connection Montor
        * Creas un monitor que evalua latecia, disponibilidad,
    * IP Flow Verify
        * Es como un test-connection para chequear de forma rapido una conexion
    * NSG diagnostics
        * Detalla para una conexion que reglase del NSG aplican
    * ...

# EntraID y Monitoreo de Usuarios

## Caso de Estudio 

### Caso 1 : Integracion Cloud-On-Premise

* Situacion Actual
    * Tengo un Active Directory On Premise y Un entorno Azure. Tengo doble esfuerzo de Mantenimiento
* Buena Practica
    * No es necesario dejar el AD Local pero si utilizar una herramienta que los mantenga sincronizado
    * Entra ID connect
 
### Casoo 2 : Usuario Externo

* Situacion Actual
    * Tengo un usuario que viene de otra empresa y necesito darle persmisos para que utilize mi entorno Azure
    * El administrador de usuarios le crea un usauario nuevo (con create User) en Azure y ahi administra el RBAC
* Buena Practica
    * No crear usuarios nuevos de organizaciones externa sino usar el Entra B2B Connect para invitarlo
    * Solo con su correo
    * El usuario mantiene su usuario y su passowrd
 

### Caso 3 : Usuario que se va de la empresa

* Situacion Actual
    * Los usuarios que se van de la empresa quedan en el Active Directory
* Buena practica
    * Implementar un offboarding process
        * Desabilitar el usuario
        * Revoke de Sign Session
        * VPN
        * https://learn.microsoft.com/en-us/entra/id-governance/tutorial-scheduled-leaver-portal
        * Automatizar el proceso de OffBoaring con el Lifecycle workflows
    * Hacer "Acces Reviews" detntro de la parte de "Identity Governance" periodicos
      
* Situacion Actual
    * Tengo 10 aplicaciones y se hace engorro darle de baja en casa una de las 10 aplicaciones
    * Cada aplicacion tiene su propio login con su propia logica de login
* Buena Practica
    * Implementar autenticacion usando SSO con el entra para no tener que multiplicar el esfuerzo de manteniminto

## Caso 4 : Usuario que necesita permidos o accesos

* Situacion Actual
    * Un usuario que trabaja en un proyecto necesita permisos que no tiene para realizar una tarea X
    * El administrador le da permisos al usuario (y se anota en un postit para acordarse de revocarselos mas adelantes)
* Buena practica
    * Habilito al usuario permisos temporalmente mediante el PIM
 
* Situacion Actual
    * Un usuario se conecta a una VM unas pocas horas en horario de oficila
    * La VM no se apaga (hace algo critico)
    * El puerto de la VM esta expuesto a ataques por fuerza bruta todo el tiempo en Internet
* Buena Practica
    * Configurar el JIT (Just In Time) access para la VM por tiempo limitao cuando lo necesita con control
    * https://learn.microsoft.com/es-es/azure/defender-for-cloud/enable-just-in-time-access
    * Otras Akternativas : VPN, JAM server, etc...

## Caso 5 : Usuario que necesita varios permisos

* Situacion Actual
    * Un usuario necesita permisos para acceder a una seri de recursos y aplicaciones
    * Esos mismos requerimientos se suelen repetir para distintos usuarios
    * El administrador se pasa toda una tarde asignando los permisos
* Buenar  practicas
    * Configurar un Access Package y manejarlo como una unica asignacion
 
### Casos 6 : Usuarios que se conectan de distintos lugares

* Situacion Actual
    * Los usuarios se conectan al portal desde muchas ubicaciones distintas
    * Alguna vez un usuario que se le rompio la computadora fue al cybercafe y dejo abierto el portal de azure y se metio un curioso e hizo lio
* Buena Practica
    * Configurar el cotional Access para
    * Habilitar MFA para dispositivos y ubicaciones desconoidas
    * Configurar la persistencia de sesion

* Situacion Actual
    * Investigando los logins se observan conexiones desde paises de Europa del Este y mi empresa esta en LATAM
* Buena practica
    * Identificar Logueos riesgosos en la opcion de "Identity Protection"

### Caso 7 : Un usuario nuevo con cara de bueno

* Situacion Actual:
    * Entra un empleado a la empresa y tiene cara de bueno y confiable
    * Ademas sabe mucho de Azure y parece ser un referente del tema
    * El administrador le crea un usuario en el EntraID con el rol de Contributor
* Buenas practicas
    * Hay que relevar bien cuales var a ser sus roles y que permisos exactos necesitan
    * Zero Trust
        * Cada request es verificado exhaustivamente antes de dar permiso
        * Aplicar el pricipio Least Prvilege Access : Darle el acceso que necesita, ni mas ni menos
     

### Configuracion del Defender

* Evaluar periodicamente la recomendaciones del Defender

# Buisiness Conuity 

# Migracion (CAF) - Tools

* Azure Migration Framework
    * Evaluacion
        * Calculadora de Costos
            * https://azure.microsoft.com/en-us/pricing/calculator/
    * Migracion
        * Azure Migrate
            * https://learn.microsoft.com/en-us/azure/migrate/concepts-assessment-overview?view=migrate
        * App Service Miragion assistant
            * https://learn.microsoft.com/es-es/azure/app-service/app-service-asp-net-migration
        * Asitente de migracion de SQL
            * https://learn.microsoft.com/es-es/sql/ssma/sql-server-migration-assistant?view=sql-server-ver17
        * Base de Datos
            * Azure Database Migration Service (En Azure)
        * Almacenamiento
            * Azure Storage Explorer
            * AzCopy
            * Azure Storage Mover
                * https://learn.microsoft.com/es-es/azure/storage-mover/service-overview
            * Azure Data Box
                * https://azure.microsoft.com/es-es/products/databox
    * Optimizacion
    * Monitoreo
        * Windows
            * Azure Monitor Agent
                * Te permite integrar logs del sistema operativo dentro de tu Log analytics Workspace
                    * https://learn.microsoft.com/en-us/azure/azure-monitor/agents/azure-monitor-agent-overview
                    * https://learn.microsoft.com/en-us/azure/azure-monitor/agents/azure-monitor-agent-manage?tabs=azure-portal


# Tips Certificacion

* Deacoplar, Cuello de Botella   ======>     (Bottleneck)Service Bus/Queues 
* Carga Variable/Impredecible    ======>     Serverless
* Mandar Mails ====>     Logic Apps  ======>     SendGrid (La tecnologia de MS en Azure para mandar mails)
* Real Time    =====>    Event Hub
* Tip          ========> Darlo en Ignes

* Preguntas
    * Varias Respuestas
    * Drag and Drop
    * Completar un combot
* Caso de Estudio   << Dejar al menos 15 minutos para esto!...
    * Preguntas

* Link para rendir
    * https://learn.microsoft.com/en-us/credentials/certifications/exams/az-305/
