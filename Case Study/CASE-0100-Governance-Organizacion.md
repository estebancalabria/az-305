# 🧩 Caso de estudio: Diseño de una solución de gobernanza

## 🏢 Contexto

* **EstebanCalabria Industries** está planificando definir en su estrategia de gobernanza en Azure.
* Realizar un asesoramiento como arquitecto de soluciones Azure, con el objetivo de definir recomendaciones, al y responder a una serie de requerimientos clave.

---

## 📋 Situacion Actual

EstebanCalabria Industries cuenta con dos unidades de negocio principales:

* Apparel (Indumentaria)
* Sporting Goods (Artículos deportivos)

Cada unidad de negocio está compuesta por tres departamentos:

* Desarrollo de Producto
* Marketing
* Ventas

```mermaid
graph TD
    A[EstebanCalabria Industries]

    A --> B[Apparel (Indumentaria)]
    A --> C[Sporting Goods (Artículos deportivos)]

    B --> B1[Desarrollo de Producto]
    B --> B2[Marketing]
    B --> B3[Ventas]

    C --> C1[Desarrollo de Producto]
    C --> C2[Marketing]
    C --> C3[Ventas]
```

## 📋 Requisitos

* Cada unidad de negocio y sus respectivos departamentos deben poder **gestionar y monitorear sus propios costos en Azure**.
* Al mismo tiempo, el equipo de **IT corporativo** necesita contar con una **visión global de los costos de toda la organización**, permitiendo generar reportes consolidados.


## 📊 Enunciado

* ¿De qué formas podría EstebanCalabria Industries organizar sus **suscripciones y management groups**?
* ¿Cuál de esas opciones sería la más adecuada para cumplir con los requisitos planteados?
* Diseñar **dos jerarquías alternativas** y explicar el proceso de toma de decisiones.


