# Guión — 6R4EDI, Sigüenza

**Cómo usa la IA un estadístico erre-ro: del trabajo a la piscina pasando por el aula**

José Luis Cañadas Reche · idealista · 19–20 noviembre 2026 · Residencia Porta Coeli, Sigüenza

---

## Ficha

| | |
|---|---|
| Formato | Ponencia invitada, 35 min + preguntas |
| Público | Académicos, docentes, estudiantes con TFG/TFM, profesionales de empresa |
| Tesis | **La IA sube el suelo, no el techo** |
| Estribillo | **Yo dirijo → ella programa → yo verifico** |
| Arco | Trabajo → aula → piscina (formalidad ↓, simpatía ↑) |
| Riesgo técnico | Una sola demo en vivo (simulador), con plan B grabado |

### El techo cambia de naturaleza en cada bloque

Esto es lo que hace que la charla progrese en vez de repetirse tres veces:

| Bloque | Qué sube el suelo | Dónde está el techo |
|---|---|---|
| Empresa | Escribir el `.qmd`, el boilerplate, las dos versiones del informe | **Verificación** de los resultados |
| Docencia | Toda la carpintería de Shiny | **Diseño**: qué sesgos enseñar y cómo mostrarlos |
| Ocio | Un análisis que a mano no habrías hecho nunca | **Interpretación** de lo que sale |

---

## Escaleta

| Min | Bloque |
|---|---|
| 0–3 | Apertura y tesis |
| 3–6 | El método y las herramientas |
| 6–15 | **Empresa**: informes `.qmd` analíticos + informe catastral |
| 15–25 | **Docencia**: simulador de encuestas (demo en vivo) |
| 25–31 | **Ocio**: natación con Garmin |
| 31–35 | Cierre |

---

## 0–3 min · Apertura

**Diapo 1 — Título.** Te presentas en tres datos, no en un CV: estadístico, en idealista, erre-ro desde antes de que R fuera cool.

**Diapo 2 — La pregunta incómoda.** Una sola frase en pantalla:

> Si escribe el código por mí, ¿para qué me sirve saber estadística?

Es la pregunta que se está haciendo media sala, y sobre todo los estudiantes con el TFG a medias. Nombrarla al principio te compra su atención durante los 35 minutos.

**Diapo 3 — La tesis.** 

> La IA sube el suelo. No sube el techo.

Explícala en 20 segundos: el suelo es lo que antes no hacías por pereza, por falta de tiempo o porque montar la infraestructura costaba más que el análisis. El techo es la calidad máxima de lo que produces, y ese sigue estando donde estaba: en lo que sabes.

Anuncia el recorrido: tres sitios donde uso la IA con R, el trabajo, el aula y la piscina.

---

## 3–6 min · El método y las herramientas

**Diapo 4 — El método.** Tres pasos, tres palabras. Este es el estribillo que vas a repetir en cada bloque:

> **Yo dirijo → ella programa → yo verifico**

El matiz que importa: no es "le pido código y lo pego". Es que **yo decido qué hay que calcular y con qué método**, ella escribe, y **la verificación no es opcional ni delegable**. La charla entera es la demostración de que el primer y el tercer paso siguen siendo tuyos.

**Diapo 5 — Herramientas, con nombre y precio.**

- **Claude Code** — agente en terminal. Lee y escribe ficheros del repo, ejecuta R, itera solo. Es lo que hace posible el flujo de los `.qmd` del bloque siguiente.
- **Posit AI dentro de Positron** — 20 €/mes, acceso a varios modelos, **integrado con Positron y RStudio y con lectura del REPL**. Esta es la recomendación práctica para el analista estadístico de la sala: no hay que irse a la terminal ni cambiar de mundo, vive dentro del IDE donde ya trabajas y ve tu sesión.

<!-- TODO(JL): confirma la lista exacta de modelos que quieres nombrar y el precio vigente en noviembre 2026 -->

Di explícitamente que **no vas a hablar de la IA en abstracto**: todo lo que viene son cosas que has hecho tú este año.

---

## 6–15 min · Bloque EMPRESA — informes `.qmd` y el informe catastral

### Qué quería hacer

Análisis recurrentes que terminan siendo documentos. El problema real no es el análisis: es que **el mismo análisis tiene dos audiencias incompatibles**. El equipo técnico quiere el código, los supuestos y el detalle reproducible en el repo. Negocio quiere la conclusión, el gráfico y ni una línea de R, en Confluence.

Antes, eso significaba escribir el análisis una vez y traducirlo a mano otra vez. Y la segunda versión, con prisa, se hacía mal o no se hacía.

### Qué me dio la IA

El flujo real, en directo sobre el repo:

1. Yo decido el análisis y le digo **que sea en R** (no negociable: es el idioma del equipo y del repo).
2. Ella escribe el `.qmd`.
3. **Yo verifico los resultados**, no el estilo del código.
4. Le pido **dos renderizados del mismo documento**: la versión técnica para el repo y la versión de negocio que sube a Confluence.

<!-- TODO(JL): ¿cómo resuelves las dos versiones? ¿parámetros de Quarto, perfiles, chunks condicionales? Concrétalo: es lo que la gente va a querer copiar -->

**Ejemplos:** los informes analíticos recurrentes y el **informe catastral**.

<!-- TODO(JL): una frase sobre qué es el informe catastral y por qué era un buen candidato -->
<!-- TODO(JL): decide qué capturas puedes enseñar sin problema de confidencialidad. Si hace falta, ofusca cifras y quédate con la estructura -->

### Dónde está el techo: la verificación

Este es el único bloque donde enseñas errores, y ahí está su fuerza. Uno o dos, concretos, verificables, del tipo que **sólo detecta alguien que sabe estadística**: no un error de sintaxis (esos los caza R), sino un resultado plausible y equivocado.

<!-- TODO(JL): 1-2 errores reales. Los mejores son del tipo: agregó mal, eligió el estadístico equivocado, ignoró los NA, se inventó un supuesto, o "funcionaba" pero contestaba a otra pregunta -->

**La frase del bloque:** el código compilaba, el informe era bonito, y el número estaba mal. Nadie de negocio lo habría notado.

### Qué puso el estadístico

Decidir qué se calcula, con qué método y con qué supuestos. Y comprobar el resultado. La IA subió el suelo en la parte que odiabas —la segunda versión del documento, la que antes no se hacía— y no tocó el techo, que sigue siendo saber si el número es correcto.

---

## 15–25 min · Bloque DOCENCIA — simulador de encuestas electorales

### Qué quería hacer

Explicar por qué dos encuestas honestas y bien hechas dan resultados distintos. Es de las cosas más difíciles de enseñar con palabras y de las más fáciles de enseñar con una perilla que se mueve.

Deja claro desde el principio, porque el público de este congreso lo va a preguntar: **la app muestrea correctamente**. No es un ejemplo de IA equivocándose. Es una herramienta docente que funciona, y sirve para mostrar qué le pasa a una encuesta bien hecha cuando aparecen los sesgos que aparecen siempre en el mundo real.

### Qué me dio la IA

Toda la carpintería de Shiny: reactividad, layout, sliders, gráficos, el pulido. Horas de trabajo que no son estadística y que son exactamente la razón por la que muchos docentes nunca llegan a construir su material interactivo.

Ese es el suelo subiendo, y en docencia es donde más se nota: **la barrera para que un profesor tenga su propio simulador acaba de desaparecer**.

### DEMO EN VIVO — 4 minutos, guion cerrado

> **Regla de oro:** tres interacciones, una por perilla, con la misma intención de voto "real" de fondo. Nada de explorar en directo.

1. **Tamaño de muestra y margen de error.** Mueve n. Que vean estrecharse el intervalo — y que vean que duplicar la muestra no duplica la precisión. Aquí cae sola la frase de que el coste crece mucho más rápido que la precisión.
2. **Sesgo de no respuesta.** La realidad no ha cambiado, el muestreo sigue siendo correcto, y la estimación se desplaza. Este es el momento en el que se hace el silencio en la sala.
3. **Votante oculto.** Encuestados que declaran algo distinto de lo que votan. Muy reconocible en contexto electoral español.

**Plan B:** si la app no arranca en 15 segundos, pasas a la diapositiva siguiente con el vídeo grabado y nadie se entera. Ensáyalo así al menos una vez.

<!-- TODO(JL): grabar los tres clips de plan B (30-60 s cada uno) y meterlos en slides/img/ -->

**Adelántate a la pregunta:** la cocina —ponderación y recuerdo de voto— no está todavía, y es donde de verdad se decide el titular. Dilo tú antes de que te lo pregunten: lo convierte en una idea de futuro en vez de una carencia, y te deja un gancho servido para el turno de preguntas.

### Qué puso el estadístico: el diseño

Aquí no hay ningún error de la IA que enseñar, y precisamente por eso el bloque es interesante. **Qué sesgos merece la pena simular, cómo se formalizan, y qué tiene que ver el alumno en pantalla para que le haga clic** — eso no sale de un modelo. Sale de haber analizado encuestas y de haber intentado explicárselas a alguien.

**La frase del bloque:** la IA te construye el simulador. Lo que simular, lo pones tú.

---

## 25–31 min · Bloque OCIO — natación con Garmin

### Qué quería hacer

Nada importante. Y ese es justamente el argumento.

Tienes años de sesiones de natación registradas por el reloj. Nunca las habías analizado en serio porque el análisis no le importa a nadie, no lo paga nadie y no cabe en un fin de semana.

### Qué me dio la IA

El análisis entero: descarga, limpieza de los datos del Garmin, exploración, gráficos.

<!-- TODO(JL): 1-2 hallazgos concretos sobre tu natación. Cuanto más personal y sorprendente, mejor: aquí el público está relajado y es cuando más se acuerdan de lo que dices -->

**Este es el caso donde el suelo sube más:** un análisis que no se habría hecho jamás, ahora existe. No porque sea difícil, sino porque nunca habría merecido las horas.

### Qué puso el estadístico: la interpretación

Los gráficos salen solos. Saber si esa mejora es una mejora o es que ese mes nadaste menos series largas, no.

<!-- TODO(JL): el ejemplo concreto de interpretación. Idealmente algo donde el gráfico sugiere una cosa y la explicación es otra -->

**La frase del bloque:** la IA me dio la respuesta en diez minutos. Cuál era la pregunta lo puse yo, y saber si la respuesta significaba algo, también.

---

## 31–35 min · Cierre

**Diapo — Qué hace bien y qué hace mal.** Dos columnas, sin adornos.

| Bien | Mal |
|---|---|
| Carpintería: Shiny, Quarto, boilerplate, docs | Elegir el método correcto |
| Traducir entre formatos y audiencias | Los supuestos que nadie escribió |
| Bajar el coste de empezar algo | Decirte cuándo su respuesta está mal |
| Hacer posible lo que no compensaba | Saber qué pregunta había que hacer |

**Diapo — Las tres preguntas.** Cierra con lo que sólo puede hacer alguien que sabe estadística:

1. ¿Es esta la pregunta correcta?
2. ¿Es este el método correcto para responderla?
3. ¿Es creíble este resultado?

Un modelo te ayuda con la segunda si tú ya la sabes plantear. La primera y la tercera son enteramente tuyas.

**Diapo final — La tesis, otra vez.**

> La IA sube el suelo. El techo lo sigues poniendo tú.

Y el remate para este público concreto: **por eso hay que seguir enseñando estadística, y por eso ahora importa más, no menos.** Si la carpintería la hace la máquina, lo único que te distingue es el criterio. Que es lo que se enseña aquí.

---

## Pendientes de José Luis

- [ ] 1–2 errores reales de la IA en el bloque de Empresa (concretos y verificables)
- [ ] Cómo resuelves las dos versiones del `.qmd` (repo / Confluence)
- [ ] Qué es el informe catastral, en una frase
- [ ] Capturas del bloque Empresa revisadas por confidencialidad
- [ ] 1–2 hallazgos de los datos de natación + un ejemplo de interpretación no obvia
- [ ] Grabar los tres clips de plan B de la demo
- [ ] Confirmar modelos y precio de Posit AI vigentes en noviembre 2026
- [ ] Ensayar una vez con el plan B activado (app caída a propósito)
