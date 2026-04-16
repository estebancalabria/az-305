# Clase Tres - 16 de Octubre del 2026

# Repaso Ejecurito

* Caso de estudio de Compute
* Principios de WAF aplicados a cada tema
* Storage
    * Escalabilidad
    * Governanza
      * Inmutabilidad
    * File Share
    * Blobs
    * Redundancias
    * Critetio cuando aplicar cada uno
    * Compliance
    * Moitoring
    * Costos
      * Calculadora de costos
      * Compativa de costos
* Bases de Datos
  * SQL
    * Optimizacion de costos
  * CosmoDB

# Actualizacion con la clase pasada

* Tabla de costos
  * https://github.com/estebancalabria/az-305/blob/main/04-Database/costos.md

# Data Integration

* Tiene que ver con
   * Data Science
   * Mahine learning
   * Power BI
   * Toma de decisiones
   * Anlitica de datos en tiempo real
 
* Proceso de Intergracion de Datos
   * Generacion de datos (bases de datos, api externas para sacarles dates, documentos semi-estructurado)
      * Ingesta de datos
         * Almacenamiento (Data Lake = Blob + HDFS + napescapce jeraquicos)
            * Procesamiento y transformacion (ETL)
              * Analitica y enriquecimiento (ML, Consultas)
                 * Exposicion : Generar dashboars interactivos con esos esos datos
  * Gobernanza
     * Que puede ver cada uno
     * Microsft PureView
        * https://www.microsoft.com/es-es/security/business/microsoft-purview

## Decisiones Arquitectura

* Definir la estructura de carpetas y permisos en el DataLake para governar los dos
* No conviene trabajar directamente sobre los datos de produccion
* Implementar el proceso anterior en servicios de Azure
* Empezaria a pensar en estos servicios
   * Cuando no quiero inferir en la performance de produccion para la analyticoa
   * Cuando estoy hablando de informacion en el orden de los GB

## Herramientas de Azure

### Almacenamiento

* Data Lake 2
      * >>>> Delta Lake  :: Data Lake Mejorado con manejo de versiones

* Almacenamientos
   * Bronze
      * Ejemplos : Datos json, csv,... sin relacion
   * Plata
      * Ejemplos : Unificas los datos en un formato unico (Ej  parquet), definis un esquema, una especie de normalizacion, los filtras
   * Gold
      * Ejemplo : Los enriqueces con infomacion estras, le das un pulido final, etc

### Ingesta

* Data Factory
   * Mover datos desde todas mis fuentes al Data Lale
   * Se maneja desde su propio portal
      * https://adf.azure.com/

### Procesamiento de datos (ETL)

* Data Bricks
   * https://spark.apache.org/
* Tiene su propio portal
   * https://adb-xxxxxxxxxxxxxx.azuredatabricks.net/
* Este recurso lo necesito principalmente cuando voy a trabajar con Treas/Gigas de datos, los quiero trasnformar, lo quiero hacer de manera eficiente

### Analitica

* Synapse Analytics

### Resumen Proceso

<img width="1146" height="682" alt="image" src="https://github.com/user-attachments/assets/4b768222-838a-4291-be27-02d5d6d429ae" />

---

# Arquitectura de Apps (Messaging)

* Desde la vision de arquitectura de desarrollo de Software hubo esta evolucion

<img width="971" height="558" alt="image" src="https://github.com/user-attachments/assets/cda17fc8-4769-4a83-9a38-d9e77c933937" />

> [!NOTA]
> Muchas decisiones que previamente tomaba el programador dentro delo codigo se elevaron a cuestiones de infraestructura
> (Ahi entra el arquitecto Azure)

## Envio de Mensajes y respuesta a eventos

* Hay dos tipos de comunicacion desacolpada
   * Eventos
      * "Se crea un blob en un stroge"
         * Y yo quiero que cuando pase eso una funcion app calcule el hash del archivo y lo guarde en una base datos
      * Ocurren todo el tiempo en la operatia
   * Mensajes
      * "El cliente realiza un pedido en mi app y quiero notificar a los interesados para orquestar los pagos y la entrega"
      * Estan mas orientado al negocio y lo que hace mi aplicacion. Los necesito para sincronizar aplicaciones

## Servicios de integracion que hay en Azure

* Mensajes
   * Azure Storage Queues
   * Service Bus
      * Solucion mas completa que las Queues
         * Aseguran el FIFO (Fist In Fitst Out)
         * Dead lettering para los mensajes que no se procesaron
         * Procesamiento de entrega en paralelo
      * Comunicacion ASyncronica
* Eventos
   * Event Grid
      * Informalmente lo defino como el sistema de triggers de Azure
   * Event Hub
* Otros servicios de Integracion
   * Api Management
   * Logic Apps 

> [!NOTE]
> Este es un punto importante donde el Arquitecture de Azure puede sentarse con el Arquitecto de Sowtware y plantear soluciones modernizadas que contemplen los principios del WAF a nivel tanto aplicacion como arquitectura en Azure

<img width="1076" height="215" alt="image" src="https://github.com/user-attachments/assets/c8d73f15-0c06-49ca-a5fa-6434b6f41f4d" />

## Caso practico Event Grid y Service Bus

🏢 Contexto
EstebanCalabria Industries quiere actualizar su sitio web para que los clientes puedan subir fotos de los productos que adquirieron.
La empresa considera que las imágenes de clientes ayudan a aumentar confianza y conversión.
Ya existe una API interna que realiza el escaneo de las imágenes para detectar contenido que pueda ser inapropiado o generar problemas legales.
Se busca una solución serverless, escalable y de bajo costo que pueda manejar picos de carga y notificar al cliente una vez que su imagen sea aprobada.
Una vez que la foro esta aprobada voy a guardar su descripcion y ubicacion en mi base de datos de productos
Voy a mandar un correo para avisarle al usuario que su imagen se proceso con exito.
📋 Situación Actual
Las cargas de imágenes son irregulares a lo largo del día.
El software de escaneo interno puede ser un cuello de botella durante picos de carga.
Se requiere que todos los archivos sean procesados y que la base de datos del catálogo se actualice correctamente.
La empresa desea minimizar costos usando soluciones serverless y pagar solo por lo que se use.

### Solucion Propuesta

<img width="1180" height="420" alt="image" src="https://github.com/user-attachments/assets/41486dbe-4fae-4086-ae99-1718cab7d060" />

* Analisis de la solucion propuesta...
   * Supongamos que al implementar esa solucion la funcion que analiza imagenes tiene cuellos de botella. Por momentos la llamo tanto que
      * Se cuelta
      * Analizo  escalar (mas costo)
      * El recurso de computer vision acepta una cantida de transacciones por unidad de tiempo

* Mejora propuesta:

<img width="1201" height="408" alt="image" src="https://github.com/user-attachments/assets/869775d6-beed-4885-8731-a50dc8e2d098" />

> [!NOTA]
> Muchas veces cuestiones de arquitectura donde evaluamos que la soluciones es escalar un servicio, muchas veces la respues viener por otro lado y podes optimizar costos (desde el WAF) analizando opciones a nivel de aquitectura antes que de escalado.

## Service Bus. Caso practico

<img width="838" height="379" alt="image" src="https://github.com/user-attachments/assets/73c32d27-c2fb-40b0-abf1-21b80c035413" />

* La aplicacion de Facturacion esta saturada, se llama desde muchos lugares y tiene cuello de botella. Muchas veces se cuelta
* Se escala y el costo de escalado esta subiendo mucho
* Las reglamentaciones hacen que la aplicacion de facturacion deba actualizarse todo el tiempo e implica recompilar tambien la de pedidos
* El dia de maniana se necesita incorporar otra app de delivery en el proceso sin depender de modificar la app de pedidos
* Tengo dos aplicaciones que terminan estando altamente acopladas
* 
Solucion Propuesta

<img width="851" height="388" alt="image" src="https://github.com/user-attachments/assets/e33e5d65-bfaa-4c16-a687-0cd651bcefcd" />


# Caso practico Event Hub

* Event Hub
   * Streaming de Eventos Masivo (Varios eventos por segundo)
   * Telemetria en tiempo Real
   * Analitica en timempo Real
   * Millones de Eventos por segundo
   * Relacionado con
      * Iot Hub
      * Stream Analytics
   * Un regulador de ritmo para que no colapsen los sistemas

 * Ejemplos
    * LA final de bailando por un suenio (resultados poco verificables)
       * Queres ver en tiempo real la votacion
    * El registro de trafico por las cabinas de peajes

* Escenario Propuesto
  
<img width="933" height="227" alt="image" src="https://github.com/user-attachments/assets/0899e608-2046-4fcf-9e40-f9282854dd41" />

* Para este escenario existe Event Hub

<img width="1047" height="209" alt="image" src="https://github.com/user-attachments/assets/92265bd3-2fe3-4f4f-bb05-b277cf462713" />

### Escenearios de Telemetria en tiempo real

<img width="864" height="367" alt="image" src="https://github.com/user-attachments/assets/756251d5-4b5d-4d07-ae1e-03acbd894831" />

* En estos escenarios tambien se usa el Event Hub

--

## Api Management

* Microservicios, API backend
   * Monitoring
   * Limite de uso
   * Autenticacion
   * Vesionado
   * Cache
   * El despliegue en varios dominios disintos
      * https://learn.microsoft.com/en-us/azure/api-management/api-management-policies#authentication-and-authorization
* Ya sea desplegando una api en
   * App Service
   * Kubernetes
   * Function App

* El api management resuelve todas las cuestiones transversales (monitoreo, autenticacion) en un sericio
* Es un proxy que intecepta los request http y le aplica ciertas reglas (monitoring, autenticacion, etc)

* Antes

<img width="711" height="496" alt="image" src="https://github.com/user-attachments/assets/5f519c1f-43bf-4202-8f13-f4a0a5485eb7" />

* Problemas
   * Dominions distintos
   * Logica de auth distribuida
      * Que pasa si el dia de maniana quiero implenentar Entra ID para todos?
   * Logica de Log independiente por proyecto
   * Tengo cuestiones transversales replicada en los 3 proyectos

* Despues

<img width="889" height="497" alt="image" src="https://github.com/user-attachments/assets/b77112bb-2a88-4137-b672-70bfc7ea21db" />

# Networking

## Contexto


<img width="588" height="704" alt="image" src="https://github.com/user-attachments/assets/93580d4b-9800-4ff3-bcf1-e1151f6755ad" />

* En este diagrama puedo ver un ejemplo de arquitectura de red tradicional
   * Net
   * Subnet
   * NSG
   * VNet Peering (Conectar dos VNet)
   * VPN Gateway (en su propia subnet)

## Exscenario

* Despliego un APP Service y un Api Management sin definir/preocuparme por la parte de las redes

<img width="629" height="322" alt="image" src="https://github.com/user-attachments/assets/22ff8fe0-70ce-4006-a74a-b9dbab23aa0a" />

* Rieggos
   * Que aprovechen un exploit de la app
      * SQL Injection
   * Forzar carga sobre una app para que escale automaticamente
      * Mas Costo
      * Ataque DDos para que la app se sature

### WAF (Web Application Firewall)

* Front Door
      * Analiza el trafico de Internet a Mi red
      * Detectas vulnerabilidades habituales
              * Un request donde en el body le pones 'OR 1=1' <<< LO Bloquea << SQL Inyection
              * 1000 veces el mismo request en 1 minuto, 1 primero pasa, los 999 devuevle un 403
* Aplication Gateway
      * WAF pero para la red privada privado


## Networking en en contexto de Arquitectura

<img width="1028" height="509" alt="image" src="https://github.com/user-attachments/assets/28053588-9131-4583-b6c4-4c7eb68cd850" />



# Tip para el examen

* Casi matematico
   * Siempre que se hable Carga de trabajo irregular (a veces se usa mucho y otras poco, aplica DB, compute, todo)  ===>  Serververless (vs provisioned)
