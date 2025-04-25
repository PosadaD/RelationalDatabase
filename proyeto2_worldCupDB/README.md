# worldCupDB

Esta base de datos tiene como propósito almacenar información acerca de equipos deportivos y los partidos que han sido realizados. Contempla dos tablas principales: **teams** y **games**. Ambas tablas están relacionadas entre sí mediante el `team_id` de los equipos.

## Estructura de la Base de Datos

### Tablas

1. **teams**
   - Esta tabla almacena los datos de los equipos.
   - Atributos:
     - `team_id`: Identificador único para cada equipo (clave primaria).
     - `name`: Nombre del equipo.

2. **games**
   - Esta tabla almacena los partidos realizados entre los equipos.
   - Atributos:
     - `game_id`: Identificador único para cada partido (clave primaria).
     - `year`: Año en que se jugó el partido.
     - `round`: Ronda o fase del partido (por ejemplo, "fase de grupos", "semifinales", etc.).
     - `winner_id`: ID del equipo ganador (clave foránea que referencia a la tabla **teams**).
     - `opponent_id`: ID del equipo oponente (clave foránea que referencia a la tabla **teams**).
     - `winner_goals`: Goles del equipo ganador.
     - `opponent_goals`: Goles del equipo oponente.

### Relaciones entre las Tablas

- Las tablas **teams** y **games** están relacionadas por el atributo `team_id`, que aparece en la tabla **games** como `winner_id` y `opponent_id`.

## Diagrama de la Base de Datos

```plaintext
+------------------+      +------------------+
|     Equipos      |      |     Games        |
+------------------+      +------------------+
| team_id (PK)     |<-----| winner_id (FK)   |
| name             |      | opponent_id (FK) |
|                  |      | year             |
|                  |      | round            |
+------------------+      | winner_goals     |
                          | opponent_goals   |
                          | game_id (PK)     |
                          +------------------+


