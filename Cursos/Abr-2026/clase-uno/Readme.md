# Clase Uno - 14 de Abril de 2026

# Introducciones

## Contacto

* mct.esteban.calabria@gmail.com
* https://www.linkedin.com/in/esteban-calabria-7a44401a/
* https://www.instagram.com/p/DXALqnolUCC/?img_index=1

## Forma de trabajo

* Todas las clases quedaran registradas en es github para que alukmno pueda volvar los apuntes a una herramienta tipo:
    * https://notebooklm.google.com/
* Completar el formulario de Evaluacion del Asistente
    * https://forms.gle/n5aM1CgBgxrhova47

## Programa

* Todo basado en
   * CAF : Cloud Adoption Framework
      * Metodologico
         * https://azure.microsoft.com/es-es/solutions/azure-essentials/cloud-adoption-framework
   * WAF : Well Architecture Framework
      * Arquitectural
         * https://learn.microsoft.com/en-us/azure/well-architected/

### CAF (Cloud Addoption Framework)

   * Strategy
   * Planify
   * Ready
   * Adopt
   * Gobern
   * Manage

 ### Strategy

 * Preguntas para tener datos reales de lo que se quiere
 * "Educar" a la generencia para poder llevar la vision a lo tecnico
 * KPI : Metricas : Key Performance Index
       * Ej : Cuanto Gasto ahora, cuanto quiero gastar
      * Yo ya se que tengo tengo que ir en Azure al "Cost Management"
* ROI : Return of Investmen
* Bajada a tierra
      * Informar los trade-off-decisiones arquitecturales
* Gobernanza 

> [!NOTE]
> Si hay que migrar una aplicacion critica a Azure : costos, seguridad o arquitectura?


* Recursos Azure Involucrados
   * Cost Management + Billling
   * Regiones
      * Hay regiones que varia el costo del recurso y la disponibilidad
      * Compliance a nivel region
   * Resource Groups
   * Management Groups
   * Subcripciones
      * OJO: Evaluar no tener una subscripcion para todo sino separarla por entorno
   * Policy
   * Resource Tagging
   * RBAC - Entra ID

### Plan


# Gobernanza y costos

# Temas Relevantes

> [!NOTA]
> Evaluar no tener una suscripcion para todos

> [!NOTA]
> La estructura de Azure debe habilitarme una trazabilidad que me permita evalyar costos y operatividad siempre alineado con la estrategia del CAF

> [!NOTA]
> Considerar la importancia del Resource Tagging para temas de trazabilidad y costos. Polity para hacer el enforcement de esos Resource Tagging

## Caso de estudio

* Pernsar en el siguiente Orden
   * Maganagement Group
   * Subscripciones
   * Resource Groups
   * Transversal
      * Resource Tagging

* Estrategias
   * Dividir por Unidad de Negocio
   * Dividir por Entornos (PRueba/Produccion)
   * Dividir por Geografia 
   * Hibrido
   * Considerar una Subcripcion y/o management Group sandbox

* Para hacer diagramas de Arquitectura
   * http://draw.io/

* Propogo una estructura sobre la que trabajar

  <img width="590" height="513" alt="image" src="https://github.com/user-attachments/assets/b57d2cb0-49d7-4c50-8611-a4a5cbb6528c" />

* Recap
   * Unidad De Negocios ---> MG
   * Platform MG ----> MG
   * Cargas de Trabajo ----> Subcripcion
         * https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/subscription-vending
   * Transversal : Resource Tagging
   * Trade-off
       * Mas Granularidad ---> Mas Control + Mas Complejidad
       * Menis Granularidad ----> Mas Simple y menos Governance
   

## Cost Management + Billling
      * Buggets
      * Alertas
      
## Regiones
      * Hay regiones que varia el costo del recurso y la disponibilidad
      * Compliance a nivel region
      
## Resource Groups

## Management Groups

## Subcripciones
      * OJO: Evaluar no tener una subscripcion para todo sino separarla por entorno
   * Resource Tagging
