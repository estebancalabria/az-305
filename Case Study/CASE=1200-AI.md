# 🧠 Laboratorio: Selección de herramientas de IA para desafíos empresariales

## 🏢 Contexto

* **Esteban Calabria Industries** es una empresa global de retail que opera tanto e-commerce como tiendas físicas en Norteamérica y Europa.
* Está experimentando un crecimiento rápido y enfrenta desafíos en:

  * Experiencia del cliente en línea.
  * Productividad de los empleados.
  * Gestión de inventario y predicción de demanda.
* La dirección aprueba un **programa de adopción de IA por fases**, alineado con el **Cloud Adoption Framework para IA**:

  * Obtener ganancias de productividad rápido.
  * Construir una base escalable y gobernada para soluciones de IA más avanzadas.

---

## 📋 Objetivos del laboratorio

1. Revisar la guía **“Create your AI strategy”** del Cloud Adoption Framework.
2. Analizar desafíos empresariales y mapearlos a herramientas de Azure AI (SaaS, PaaS, IaaS).
3. Explicar la elección de la herramienta para cada caso y sus beneficios.
4. Comprender cómo equilibrar **rapidez, personalización, costos y control** en soluciones de IA.

---

## 📊 Actividades del laboratorio

### 1️⃣ Desafío 1: Productividad de empleados con SaaS AI

**Problema de negocio:**
Los empleados de ventas, marketing, finanzas y RRHH pasan mucho tiempo en tareas rutinarias: redactar emails, resumir reuniones y buscar documentos internos.

**Solución:** Microsoft 365 Copilot (SaaS)

**Por qué SaaS:**

* **Resultados rápidos:** No requiere infraestructura ni gestión de modelos.
* **Baja barrera de adopción:** Se integra en herramientas que los empleados ya conocen.
* **Gobernanza integrada:** Acceso controlado con Microsoft Entra ID y permisos existentes.
* **IA responsable por defecto:** Datos permanecen dentro del tenant de Microsoft 365, cumpliendo normativas.

**Resultado esperado:**

* Reducción del tiempo en tareas rutinarias.
* Mejores resúmenes de reuniones y documentos.
* Confianza organizacional en la adopción de IA.

**Actividad práctica sugerida:**

1. Revisar cómo se integra Copilot en Word, Excel y Teams.
2. Simular un caso de uso: generar un resumen de reunión a partir de notas de Teams.
3. Analizar métricas de tiempo ahorrado y productividad.

---

### 2️⃣ Desafío 2: Chat inteligente para clientes con PaaS AI

**Problema de negocio:**
El sitio e-commerce carece de un chat inteligente escalable que pueda responder preguntas sobre productos, devoluciones y estado de pedidos.

**Solución:** Azure AI Foundry + Azure OpenAI (PaaS)

**Por qué PaaS:**

* **Personalización:** Chat basado en catálogo de productos, FAQs y documentos de políticas.
* **Operaciones gestionadas:** Azure maneja escalado, disponibilidad y parches.
* **Seguridad:** Modelos y datos dentro de la suscripción de Azure.
* **Flexibilidad:** Soporta APIs generativas y no generativas.

**Arquitectura sugerida:**

* **Azure OpenAI** → generación de lenguaje natural.
* **Azure AI Search** → referencias en datos aprobados.
* **Azure Container Apps** → hosting del chatbot.
* **Private endpoints / red controlada** → acceso seguro a datos.

**Resultado esperado:**

* Respuestas más rápidas y precisas para clientes.
* Mayor satisfacción y conversión.
* Protección de datos sensibles.

**Actividad práctica sugerida:**

1. Diseñar un chatbot simple usando Azure OpenAI con documentos internos como base.
2. Configurar un pipeline RAG (Retrieval-Augmented Generation) para respuestas.
3. Simular consultas de clientes y medir precisión y relevancia.

---

### 3️⃣ Desafío 3: Predicción de inventario con PaaS ML

**Problema de negocio:**
Los niveles de inventario se basan en reglas históricas, lo que causa sobrestock y faltantes.

**Solución:** Azure Machine Learning (PaaS)

**Por qué Azure ML:**

* **Ciclo completo ML:** Preparación de datos, entrenamiento, despliegue y monitoreo.
* **Predicción y forecasting:** Ideal para casos no generativos.
* **Listo para empresa:** Control de roles, versionado de modelos, seguimiento de experimentos.
* **Integración:** Con servicios de datos existentes en Azure.

**Resultado esperado:**

* Pronósticos de demanda más precisos.
* Reducción de exceso de inventario.
* Mejora en ingresos y eficiencia operativa.

**Actividad práctica sugerida:**

1. Crear un dataset de ventas históricas y promociones.
2. Entrenar un modelo de predicción de demanda.
3. Desplegar modelo como endpoint y simular predicciones en tiempo real.

---

## 🛠 Recomendaciones docentes

* **Discusión:** Cada estudiante debe explicar por qué eligió SaaS, PaaS o IaaS para un caso de negocio específico.
* **Comparación de alternativas:** Qué pasaría si usaran IaaS para los tres desafíos.
* **Ética y cumplimiento:** Cómo garantizar IA responsable y cumplimiento de GDPR o regulaciones locales.

---

## ✅ Pilares del Well Architected Framework

| Pilar                  | Cómo se aplica                                                                    |
| ---------------------- | --------------------------------------------------------------------------------- |
| Confiabilidad          | Servicios PaaS gestionados y geo-replicación de datos.                            |
| Seguridad              | Azure AD, Private Endpoints, RBAC y políticas de compliance.                      |
| Optimización de costos | SaaS para productividad, PaaS para chat e inventario evita infraestructura extra. |
| Eficiencia operativa   | Monitoreo y pipelines RAG, experiment tracking en ML.                             |
| Rendimiento            | Escalado automático y contenedores para chat; ML optimizado para batch y online.  |

