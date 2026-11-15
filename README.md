📊 Análisis de Datos End-to-End: E-Commerce Brasileño (Olist)

<img width="640" height="491" alt="image" src="https://github.com/user-attachments/assets/fcb6c8ea-577b-4007-aa2e-60c497e3eb96" />

<img width="640" height="445" alt="image" src="https://github.com/user-attachments/assets/0d97e6e1-d88f-4965-a3c5-0cd4c8fc0bff" />


## 📌 Contexto del Proyecto
Este proyecto es un análisis integral de datos reales del e-commerce brasileño **Olist**, abarcando más de 100,000 pedidos. El objetivo principal fue ejecutar un ciclo completo de análisis de datos para identificar los factores logísticos que impactan la satisfacción del cliente y evaluar el comportamiento de ventas.

## 🛠️ Stack Tecnológico y Habilidades Aplicadas
* **Python (Pandas):** Limpieza de datos, manejo de valores nulos (imputación) y estandarización de formatos.
* **SQL (Consultas Avanzadas):** Uso de CTEs (`WITH`), `JOINs` complejos y Window Functions (`DENSE_RANK()`) para segmentación y métricas de usuarios.
* **Excel:** Análisis Exploratorio de Datos (EDA) rápido mediante tablas dinámicas y validación matemática de KPIs.
* **Power BI & DAX:** Modelado de datos (Esquema Estrella), creación de medidas personalizadas, resolución de conflictos regionales de importación y diseño de dashboard interactivo.

## 📂 Estructura del Repositorio

* `data base/`: Contiene los diccionarios de datos y esquemas originales. *(Nota: Por restricciones de peso, los archivos crudos principales se manejan de forma local).*
* `csv_pandaPython/`: Scripts de Python documentando el proceso de limpieza y los archivos `.csv` finales listos para consumo.
* `scriptsSql/`: Archivos `.sql` con consultas estructuradas para extraer métricas de negocio, rankings de clientes y volúmenes de pedidos.
* `excel/`: Reportes preliminares y validación de distribuciones (ej. *Review Scores*).
* `[Tu_Archivo_PowerBI.pbix]`: Archivo fuente del dashboard interactivo.

## 🚀 Metodología Paso a Paso

### 1. Extracción y Limpieza (Python)
Se procesaron múltiples bases de datos relacionales. Se corrigieron inconsistencias en los separadores decimales y se imputaron valores faltantes en las reseñas (`review_score`) utilizando la mediana para mantener la integridad estadística.

### 2. Modelado y Consultas (SQL)
Se diseñaron consultas modulares para evitar cuellos de botella y hacer el código mantenible. Como ejemplo, la siguiente consulta utiliza un `CTE` y una función de ventana para obtener el Top 5 de usuarios con más pedidos:

![Snippet de Código SQL](URL_DE_TU_CAPTURA_DE_SQL_AQUI)

### 3. Visualización y Business Intelligence (Power BI)
Se importaron los datos limpios, se configuró correctamente la región (formato US para decimales) y se construyeron medidas en DAX como el **% de Satisfacción Alta** (reseñas >= 4) y **Ticket Promedio**.

## 💡 Insights y Conclusiones del Negocio

1. **Satisfacción vs. Logística:** Se comprobó matemáticamente que existe una caída drástica en el puntaje de satisfacción (calificaciones 1 y 2) cuando los tiempos de entrega superan los  días.
2. **Concentración de Pedidos:** Gracias al ranking desarrollado en SQL, se identificó que  los clientes más recurrentes generan una porción significativa del volumen de pedidos.
3. **Distribución de Calificaciones:** Del total de órdenes evaluadas, [X] órdenes obtuvieron una calificación alta (4 o 5), representando un [X]% de satisfacción general frente al total de la muestra.

## 📬 Contacto y Perfil Profesional

Soy Tecnólogo en Sistemas con experiencia en desarrollo Full Stack, actualmente enfocado en el Análisis de Datos y Business Intelligence. Me apasiona resolver problemas de negocio mediante decisiones basadas en datos.

* **Email:** duwan.cs@hotmail.com
