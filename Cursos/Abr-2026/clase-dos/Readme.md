# Clase Dos - 15 de Abril

# Resumen Ejecutivo

* CAF (Cloud Adoption Framework)
* WAF (Well Architected Framework)
* 6R
* Gobernanza
    * Administracion de Costos << Especialmente importante
* Compute
* IA
  * Diagramacion
  * NotebookLM
  * Copilot : "Como oriento los prompt para alinearlos con los que vemos en el curso"

# Caso de Estudio de Compute

## Enunciado 

#### 🏢 Contexto
* EstebanCalabria Industries desea modernizar su aplicación de catálogo de productos y migrarla a la nube.
* La aplicación actual tiene una configuración 3-tier: Front-end (.NET Core), Middle-tier (business logic), Back-end (SQL Server).
* El equipo de TI solicita recomendaciones sobre servicios de Azure para mejorar rendimiento, escalabilidad y eficiencia.*

#### Situación Actual

* Front-end: Aplicación web .NET Core en IIS.\
* Durante picos: 1.750 clientes/hora.
* Problema: Durante ofertas y feriados, los servidores alcanzan el límite de rendimiento.
* Off-peak: servidores inactivos gran parte del tiempo.
* Middle-tier: Procesa solicitudes de soporte (75–125 solicitudes/hora).

* Problema: Las solicitudes se acumulan en cola, tiempos de espera largos.
* Back-end: Base de datos SQL Server para pedidos.

* Rendimiento actual adecuado.
* Restricción: Todos los recursos deben permanecer en una sola región por requerimientos legales.

#### Detalle Enunciado

* Front-end tier: Qué servicio de Azure recomiendas y por qué.

* Middle-tier: Qué servicio de Azure recomiendas y por qué.

* ¿Cómo incorporás los pilares del Well-Architected Framework para lograr una arquitectura:
  * de alta calidad
  * estable
  * eficiente

---

### Escalamiento (Perfomance)

* Pregunta : Escalamiento Horizontal o Vertical
    * Primero hay que ver si la aplicacion soporta bien escalamiento horizontal (Lo hablan con el dev)
        * No te de queda otra que el escalamiento vertical
    * Eveluamos el plan adecuadoo --->  primero evaluar escalamiento horizontalmente --->  luego vertical
      * Horizontal
          * Cantidad de usuarios en paralelo
      * Vertical
          * Los requerimientos de la app

#### Cuello de botella en el middleware (Cost Optimization)

* Muchas veces cuando hablamos de API el problema del cuello de botella no se debe a la cantidad de usuarios sino a la naturaleza de lo que queremos procesar
* Hay operaciones que son computacionalmente intensivas, tardan tiempo, No siempre la solucion es el escalamiento
* Tenemos que evaluar de convertir procesos sincronicos en Asincronicos
    * Eveluar servicios de mensajeria

 > [!NOTE]
> No todos los problemas de performance se solucionan escalando. Muchas veces podemos optimizar mucho los costos evaluando nuestra arquitectura actual y modernizandola
 

### Seguridad

* Los datos sensibles como el connectio string es recomendable guardarlos en un key Vault
  * En este caso  : Es conveniente un Key Vault para esta carga de trabajo
  * Criterio en este caso : Si tengo un key vault para todo en este caso no voy a poder evaluar el uso individual (en costos, throughput) para esta carga de trabajo en particular

### Excelencia Operacional

* Considerar el recurso de App Confugration para que distintos entornos (frontend, backend, middleware) copartan configuracion y no haya duplicar la carga de trabajo y no se propenso a errores

### Bajada a la realidad y REcomendaciones

* El enunciado es de juguete. Lo primero es recolectar mas informacion para poder tomar decisiones mas acertadas (appService vs functionapp vs container para middlewarE)
* Plantear 2 o 3 alternativas para evaluar trade of
* Utilizar la IA para que me ayude a pensar (darle a vueltas al asunto) para encontrar o la opcion mas adecuada o las preguntas que me faltan hacer
* LA Ia me tiro este analisis
    * https://copilot.microsoft.com/conversations/join/3GfkGi32ZoX5VSL1fd5rW
  
# Storage

## Opciones de Almacenamiento de datos no estructurados

* Storage Account
   * Blob
   * Blob especial DataLake
      * Es un deposito de datos especial para big data y data anlytics
      * Es un blob que le habilitan compatibilidad HDFS
         * https://hadoop.apache.org/
      * Habilita namespaces jerarquicos
         * Permite oranizar tus datos en carpetas como nuestro filesystem y aplicarle permisos RBAC (gobernanza de datos) mas granulares
   * FileShare
   * Tables <<< Opcion muy economica cuando no es del todo necesario llegar un SQL server
   * Queues <<< Es la opcion economica del Service Bus
* Disks

## File Share

* Utiliza el Protovolo SMB
   * Disco compartido a niveo organizacion
   * Para compartir informacion entre maquinas virtuales

## Reliability

* Ver azure Datacenter Tour
   * Busca en youtube "Azure Datacenter Tour"
      * https://www.youtube.com/watch?v=80aK2_iwMOs
* Redundancia
   * LRS (Localy Redundant Storage)
   * ZRS (Zone Redundant Storage)
   * GRS (Geo-Redundant Storage)
      * Replicacion asyncrona
      * RA-GRS
   * GZRS
      * RA-GZRS
    
## Performance y disponiblidad (Optimizacion de Costos)

* Ver tambien lo de los acces tiers ma abajo
* Decidir
   * Standard (HDD para la mayoria de los casos)
   * Premiun (SDD) para cargas sensibles a latencia
* Elegir el tipo de cuentas considerando el tradeoff entre costos y rendimientos
   * Tiene que ver con la organizacion de las cuentas de almacenamientos
      * Caos y la ma tenibilidad

## Compliance

* Cada region esta reglamentada segun las leyes del lugar donde este.
* Hay que ver las reglamentaciones de cada lugar en cuanto a sensibilidad de datos para elegir la region
* Seguridad, Privacidad y Gobernabilidad de los datos
   * https://www.microsoft.com/es-es/security/business/microsoft-purview
* WONRN (Write Once, Read Many)

<img width="1568" height="471" alt="image" src="https://github.com/user-attachments/assets/b37fbe3e-427a-4feb-a302-777263d23a94" />

## Cost Optimization

* Acess Tiers
   * Hot
      * Mas caro el almacenamiento y optimizado para que sea rapido
   * Cool (minimo 30 dias)
   * Cold (minimo 90 dias)
   * Archive (minimo 180 dias)
      * Extremadamente barato el almacenamiento pero es caro y lento el acceso (info no disponible en forma inmediata)
      * Para datos que debeo mantener por complience

        
* Arquitectura (Optimizacion de costos)
   * Azure Blob Lifecycle definition
   * Definir una estrategia de manejo de datos
   * Ejemplo
      * Los datos que no se acceden en 90 pasan automaticamente al tier de COOL
            * Evaluar que datos se conservan o que datos no
      * Si no se acceden por 180 dias se pasan automanticamente al tier de COLD

> [!NOTE]
> Es importante para Arquitectura en relacion a la optimizacion de costos definir el ciclo de vida de nuestros blobs para optimizar costos.

> [!WARN]
> OJO. Si pones un blob por ejemplo en cool no tener que borrarlo por 30 dias. Si lo borras antes tenes un Deletion Penalcy que te puede cobrar azure

* El costo de almacenamiento por tener los datos en azure es generalmente economico pero es un costo fijo que depende en parte de la cantidad de GB que tengamos almacenados en la nube

* Para ver costos usamos
   * https://azure.microsoft.com/en-us/pricing/calculator/

# 📊 TABLA COMPARATIVA — COSTO FIJO NORMALIZADO  
### (Hot LRS = 1 USD)

| Tipo de cuenta | Tier | Redundancia | Precio real (USD/GB/mes) | Costo relativo (Hot LRS = 1) |
|----------------|------|-------------|---------------------------|-------------------------------|
| Standard | Hot | **LRS** | 0.018 | **1.00** |
| Standard | Hot | ZRS | 0.023 | **1.28** |
| Standard | Hot | GRS | 0.036 | **2.00** |
| Standard | Hot | GZRS | 0.046 | **2.55** |
| Standard | Cool | LRS | 0.010 | **0.56** |
| Standard | Cool | ZRS | 0.013 | **0.72** |
| Standard | Cool | GRS | 0.020 | **1.11** |
| Standard | Cool | GZRS | 0.026 | **1.44** |
| Standard | Cold | LRS | 0.0045 | **0.25** |
| Standard | Cold | ZRS | 0.006 | **0.33** |
| Standard | Cold | GRS | 0.009 | **0.50** |
| Standard | Cold | GZRS | 0.012 | **0.67** |
| Standard | Archive | LRS | 0.00099 | **0.055** |

## Seguridad

* Poder habilitar el Soft Delete
* Resource Group lock Storage Account

## Operation Excelence 

 * Necesitamos un registro de los cambios por los que va pasando un blob para rollback, seguimiento de errores analisis foreses
    * Blob Change Feed
    * Blob Versioning
* No mezclarlo con lo del Activity Log

# Base de Datos

# Integracion de Datos
