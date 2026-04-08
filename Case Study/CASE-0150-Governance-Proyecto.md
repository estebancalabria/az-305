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

## 🚀 Nuevo proyecto de desarrollo

La empresa está iniciando un nuevo proyecto orientado a la recopilación de feedback de clientes.

El CFO ha definido los siguientes requisitos:

* Todos los costos asociados al proyecto deben poder **identificarse y rastrearse claramente**.
* Durante la fase de testing, las cargas de trabajo deben ejecutarse en **máquinas virtuales de bajo costo**.
* Las máquinas virtuales deben seguir una **convención de nombres que permita identificar su pertenencia al proyecto**.
* Cualquier incumplimiento de las reglas de consistencia de recursos debe ser **detectado automáticamente**.

---

## 🧠 Enunciado

* ¿Qué opciones existen para **rastrear los costos** del nuevo proyecto?
* ¿Cómo garantizarías el cumplimiento de los requisitos relacionados con:

  * el tamaño de las máquinas virtuales
  * la convención de nombres
* Proponer **al menos dos enfoques distintos** para cumplir con estos requisitos y justificar la elección final.

---

### 🏗️ Arquitectura

* ¿Cómo aplicarías los principios del **Well-Architected Framework** para diseñar una solución:

  * de alta calidad
  * estable
  * eficiente

---

Cuando quieras, en el siguiente paso armamos:
👉 tu guía docente (qué decir + qué mostrar en Azure en cada parte).
