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

 > [!NOTA]
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

# Base de Datos

# Integracion de Datos
