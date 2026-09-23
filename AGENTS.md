# .

> Índice delgado para agentes de IA. Las convenciones detalladas viven en `docs/`. Las reglas globales (idioma, seguridad, stack general) están en `~/.claude/AGENTS.md`.

## Comandos útiles

```bash
# Entorno
uv sync                    # instalar deps
uv run python …            # ejecutar dentro del venv

# Tests / lint
uv run pytest              # tests Python
uv run ruff check .        # lint
uv run ruff format .       # format
uv run mypy src/           # tipos

# dbt (si aplica)
dbt debug                  # comprobar conexión
dbt parse                  # validar modelos sin ejecutar
dbt test                   # ejecutar tests

# R (si aplica)
Rscript -e 'renv::restore()'
Rscript -e 'testthat::test_dir("tests")'
```

> ⚠️ Sustituye/ajusta los comandos anteriores a lo que realmente use este proyecto.

## Estructura

```
./
├── src/              # código Python
├── sql/              # consultas SQL sueltas
├── models/           # modelos dbt
├── R/                # scripts R
├── tests/            # tests
├── docs/             # convenciones detalladas (ver más abajo)
└── AGENTS.md         # este fichero
```

> ⚠️ Ajusta la estructura a la real del proyecto.

## Documentación

Convenciones detalladas en `docs/`. **Lee solo los ficheros relevantes para la tarea en curso**, no todo de golpe.

```
docs/
├── python/           # convenciones Python (estilo, estructura, testing)
├── dbt/              # convenciones dbt (naming, materialización, tests)
├── r/                # convenciones R (estilo, renv, tidymodels)
└── sql/              # convenciones SQL (dialecto, formato, performance)
```

## Contexto del proyecto

- **Objetivo**: (describe en 1-2 líneas qué hace este proyecto)
- **Datos**: (de dónde vienen, a dónde van)
- **Stakeholders**: (quién lo usa)

## Cosas que evitar

- (completa con errores típicos a no repetir, convenciones obsoletas, etc.)
