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

* Realizamos un invetario de lo que tenemos
* Realizamos un invetario de lo que queremos
* Subdivimos el inventario en partes
* Priorizamos el orden en migrar
   * Por prioridad estragica
   * Por impacto
* Evluamos lo necesario para capacitar al equipo en lo nuevo
* Planificamos la implmentacion por etapas
      * Etapas mas cortas... mas control
   * 6R
      * Refactor
      * Rehost
      * Reachitect
      * Rebuild
      * Replace
      * Retire
 
* Caso de Ejemplo

* Tengo una APP On premise que quiero migrar a la nube
   * Refactor <<<
   * Rehost <<<<  VM en la nube
   * Reachitect  <<< Pasar la arquitectura de un Iass un Paas  <<< Az204
   * Rebuilt <<< La paso a un APP Service
   * Replace <<< Remplazo la VM y el OnPremise por el AppService
   * Retiro << La VM y el on Premise

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

## Uso de IA

* Suelo utlizar la IA de la siguiente manera
   * Le pego el Diagrama de arquitectura que hice con draw.io
   * Armo un prompt de esta manera
  
```
Contexto : "EstebanCalabria Industries cuenta con dos unidades de negocio principales:

Apparel (Indumentaria)
Sporting Goods (Artículos deportivos)
Cada unidad de negocio está compuesta por tres departamentos:

Desarrollo de Producto
Marketing
Ventas
"
1) Analizame Trade-off de mi arquitectura propuesta
2) Evaluame aspectos que tenga que considerar y pueda estar teniendo en cuenta
3) Dame alternativas distintas y decime pro y contras en cada caso. Alineame tu repuesta con los frameworks CAF (Cloud Adoption Framework) y WaF (Well Achitect Framework)
4) Dame preguntas adicionales que deba hacerme para refinar la arquitectura propuesta
```

* Me tiro esta propuesta

> https://copilot.microsoft.com/conversations/join/DgAukZv1gV1VJV2jpynUf

> [!NOTA]
> Otra propuesta CON IA
> Pasarle el diagrama de su arquitectura como la tienen y lo mismo pedir tradeOffs, alternativas, alineacion con CAF y WAF y preguntas

* Generacion de propuestas iniciales con DiagramGPT
> https://www.eraser.io/diagramgpt

> [!NOTA]
> Validar todo lo que hace la IA no siempre es optimo y tiene el criterio

## Policy

* La definicion de la policy la puedo describir con un json
* No tengo que conocer el lenguaje ya que copilot me permite generar policies como la que sigue
* "Restringir la creacon re Resource Groups solo a lso que empiecen con el prefijo rg-

```json
{
  "properties": {
    "displayName": "Los Resource Groups deben comenzar con el prefijo rg-",
    "policyType": "Custom",
    "mode": "All",
    "description": "Obliga a que todos los Resource Groups comiencen con el prefijo rg-",
    "metadata": {
      "category": "Resource Groups"
    },
    "version": "1.0.0",
    "parameters": {},
    "policyRule": {
      "if": {
        "allOf": [
          {
            "field": "type",
            "equals": "Microsoft.Resources/subscriptions/resourceGroups"
          },
          {
            "not": {
              "field": "name",
              "match": "rg-*"
            }
          }
        ]
      },
      "then": {
        "effect": "deny"
      }
    }
  }
}
```

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

---


# WAF (Well Achiteted Framework)

* Seguridad
* Confiabilidad
* Optimizacion Costo
* Performance
* Operaciones
   * Monitoring
   * Automatizacion
   * IAC


# Modulo 2 - Opciones de Computo

## Eleccion de Opciones de Computo

<img width="808" height="536" alt="image" src="https://github.com/user-attachments/assets/58684541-e2ab-4736-8fdb-35f051b1735a" />

