# Práctica de Bases de Datos - Sistema Astronómico

Este proyecto tiene como objetivo la creación y manipulación de una base de datos en PostgreSQL para modelar un sistema astronómico que incluye galaxias, estrellas, planetas, lunas y sus distancias relativas a la Tierra. La base de datos está estructurada con varias tablas relacionadas entre sí mediante claves foráneas.

## Descripción del Proyecto

En este proyecto, se modelan distintos cuerpos celestes como galaxias, estrellas, planetas y lunas, y sus respectivas características. Las relaciones entre estos cuerpos están definidas en las tablas mediante claves foráneas, y se realizan inserciones de datos que ilustran diferentes escenarios astronómicos. Además, se define una tabla que describe las distancias relativas de los cuerpos celestes respecto a la Tierra.

## Estructura de la Base de Datos

La base de datos tiene las siguientes tablas:

### 1. **galaxy**
- **`galaxy_id`** (INT): Identificador único para cada galaxia.
- **`name`** (VARCHAR(100)): Nombre de la galaxia.
- **`composition`** (TEXT): Composición de la galaxia.
- **`tamano`** (NUMERIC): Tamaño de la galaxia.
- **`numero_estrellas`** (BIGINT): Número de estrellas en la galaxia.
- **`coordenadas`** (TEXT): Coordenadas de la galaxia.

### 2. **star**
- **`star_id`** (INT): Identificador único para cada estrella.
- **`name`** (VARCHAR(100)): Nombre de la estrella.
- **`composicion`** (TEXT): Composición de la estrella.
- **`tamano`** (INT): Tamaño de la estrella.
- **`luz_propia`** (BOOLEAN): Si la estrella tiene luz propia o no.
- **`peso`** (NUMERIC): Peso de la estrella.
- **`galaxy_id`** (INT): Relación con la galaxia a la que pertenece la estrella (clave foránea).

### 3. **planet**
- **`planet_id`** (INT): Identificador único para cada planeta.
- **`name`** (VARCHAR(100)): Nombre del planeta.
- **`composition`** (TEXT): Composición del planeta.
- **`tamano`** (INT): Tamaño del planeta.
- **`luz_propia`** (BOOLEAN): Si el planeta tiene luz propia o no.
- **`peso`** (NUMERIC): Peso del planeta.
- **`star_id`** (INT): Relación con la estrella a la que pertenece el planeta (clave foránea).

### 4. **moon**
- **`moon_id`** (INT): Identificador único para cada luna.
- **`name`** (VARCHAR(100)): Nombre de la luna.
- **`composition`** (TEXT): Composición de la luna.
- **`tamano`** (INT): Tamaño de la luna.
- **`luz_propia`** (BOOLEAN): Si la luna tiene luz propia o no.
- **`peso`** (NUMERIC): Peso de la luna.
- **`planet_id`** (INT): Relación con el planeta al que pertenece la luna (clave foránea).

### 5. **distanci_tierra**
- **`distancia_tierra_id`** (INT): Identificador único de la distancia.
- **`distancia`** (ENUM): Tipo de distancia ('cerca', 'intermedio', 'lejos').
- **`tipo_cuerpo`** (ENUM): Tipo de cuerpo ('estrella', 'galaxia', 'planeta', 'luna').
- **`galaxy_id`** (INT): Relación con la galaxia a la que se hace referencia (puede ser NULL).
- **`star_id`** (INT): Relación con la estrella a la que se hace referencia (puede ser NULL).
- **`planet_id`** (INT): Relación con el planeta a la que se hace referencia (puede ser NULL).
- **`moon_id`** (INT): Relación con la luna a la que se hace referencia (puede ser NULL).
