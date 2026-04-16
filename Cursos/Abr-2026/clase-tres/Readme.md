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

## Caso practico

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


## Networking en en contexto de Arquitectura



# Auth



# Tip para el examen

* Casi matematico
   * Siempre que se hable Carga de trabajo irregular (a veces se usa mucho y otras poco, aplica DB, compute, todo)  ===>  Serververless (vs provisioned)
