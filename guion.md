# Guión — 6R4EDI, Sigüenza

**Cómo usa la IA un estadístico erre-ro: del trabajo a la piscina pasando por el aula**

José Luis Cañadas Reche · idealista · viernes 20 noviembre 2026, 10:00–11:00 · Residencia Porta Coeli, Sigüenza

---

## Ficha

| | |
|---|---|
| Formato | Ponencia invitada I, viernes 20 nov, 10:00–11:00 (60 min con preguntas) |
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

| Min | Bloque | Duración |
|---|---|---|
| 0–4 | Apertura y tesis | 4 |
| 4–8 | El método y las herramientas | 4 |
| 8–16 | **Empresa**: informe catastral (gráfico anónimo) y el error contado de palabra | 8 |
| 16–34 | **Docencia**: demo en vivo del simulador (10 min), la cobertura, la cocina, octubre en el blog | 18 |
| 34–44 | **Ocio**: panel de natación, demo en vivo de la pregunta mal hecha y bien hecha | 10 |
| 44–48 | Cierre | 4 |
| 48–60 | Preguntas | 12 |

Empresa no crece: el `.qmd` del informe es confidencial y no hay material del error de Andalucía. Se enseña solo el gráfico anónimo (`slides/img/empresa-informe.png`) y el error se cuenta.

A las 11:00 habla Diego J. Pedregal (UCLM): "Inteligencia Artificial: cómo aprovecharla y no morir en el intento". Coordinar para no repetir ejemplos.

---

## 0–4 min · Apertura

**Diapo 1 — Título.** Te presentas en tres datos, no en un CV: estadístico, en idealista, erre-ro desde antes de que R fuera cool.

**Diapo 2 — La pregunta incómoda.** Una sola frase en pantalla:

> Si escribe el código por mí, ¿para qué me sirve saber estadística?

Es la pregunta que se está haciendo media sala, y sobre todo los estudiantes con el TFG a medias. Nombrarla al principio te compra su atención durante toda la charla.

**Diapo 3 — La tesis.** 

> La IA sube el suelo. No sube el techo.

Explícala en 20 segundos: el suelo es lo que antes no hacías por pereza, por falta de tiempo o porque montar la infraestructura costaba más que el análisis. El techo es la calidad máxima de lo que produces, y ese sigue estando donde estaba: en lo que sabes.

Anuncia el recorrido: tres sitios donde uso la IA con R, el trabajo, el aula y la piscina.

---

## 4–8 min · El método y las herramientas

**Diapo 4 — El método.** Tres pasos, tres palabras. Este es el estribillo que vas a repetir en cada bloque:

> **Yo dirijo → ella programa → yo verifico**

El matiz que importa: no es "le pido código y lo pego". Es que **yo decido qué hay que calcular y con qué método**, ella escribe, y **la verificación no es opcional ni delegable**. La charla entera es la demostración de que el primer y el tercer paso siguen siendo tuyos.

**Diapo 5 — Herramientas, con nombre y precio.**

- **Claude Code** — agente en terminal. Lee y escribe ficheros del repo, ejecuta R, itera solo. Es lo que hace posible el flujo de los `.qmd` del bloque siguiente.
- **Posit AI dentro de Positron** — 20 €/mes, acceso a varios modelos, **integrado con Positron y RStudio y con lectura del REPL**. Esta es la recomendación práctica para el analista estadístico de la sala: no hay que irse a la terminal ni cambiar de mundo, vive dentro del IDE donde ya trabajas y ve tu sesión.

<!-- TODO(JL): confirma la lista exacta de modelos que quieres nombrar y el precio vigente en noviembre 2026 -->

Di explícitamente que **no vas a hablar de la IA en abstracto**: todo lo que viene son cosas que has hecho tú este año.

---

## 8–16 min · Bloque EMPRESA — informes `.qmd` y el informe catastral

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

## 16–34 min · Bloque DOCENCIA — simulador de encuestas electorales

### Qué quería hacer

Explicar por qué dos encuestas honestas y bien hechas dan resultados distintos. Es de las cosas más difíciles de enseñar con palabras y de las más fáciles de enseñar con una perilla que se mueve.

Deja claro desde el principio, porque el público de este congreso lo va a preguntar: **la app muestrea correctamente**. El error de la IA que enseñas no está en el muestreo, sino en una definición. Es una herramienta docente que funciona, y sirve para mostrar qué le pasa a una encuesta bien hecha cuando aparecen los sesgos que aparecen siempre en el mundo real.

### Qué me dio la IA

Toda la carpintería de Shiny: reactividad, layout, sliders, gráficos, el pulido. Horas de trabajo que no son estadística y que son exactamente la razón por la que muchos docentes nunca llegan a construir su material interactivo.

Ese es el suelo subiendo, y en docencia es donde más se nota: **la barrera para que un profesor tenga su propio simulador acaba de desaparecer**.

### DEMO EN VIVO — 10 minutos, guion cerrado

App: <https://canadasreche.shinyapps.io/sim-encuestas-electorales/>

> **Regla de oro:** cinco pasos (0 a 4), siempre la misma población de fondo. Nada de explorar en directo.

#### Lo que hay en pantalla (para no perderte)

- **Menú de la izquierda:** Configuración, Resultados Agregados, Distribuciones, Comparación, Población, Ayuda.
- **Configuración:** dos deslizadores (tamaño muestral n, de 400 a 5.000, y número de réplicas, de 1 a 2.000), cuatro casillas (no respuesta por edad, deseabilidad social de Vox, marco de teléfono fijo, ponderación) y el botón verde «Ejecutar Simulación». El tipo de muestreo solo tiene «Aleatorio Simple».
- **Réplicas:** cuántas encuestas distintas simula sobre la misma población. Con 1 réplica ves una encuesta. Con 500 ves cómo varían.
- **Resultados Agregados:** tres cajas (probabilidad de acertar el ganador, MAE, n efectivo), una tabla por partido y un gráfico de barras real (azul) frente a estimado (naranja).
- **Distribuciones:** histograma de las estimaciones de un partido. Línea roja discontinua: valor real. Línea verde: media de las estimaciones. Elige el partido en el desplegable.

#### Tiempos medidos el 3 nov 2026 (app ya cargada)

| Simulación | Espera (s) |
|---|---|
| n = 1.200, 500 réplicas | 10 |
| n = 4.000, 500 réplicas | 10 |
| n = 1.200, 500 réplicas, no respuesta + ponderación | 39 |
| Cargar la app (ya despierta) | 10 |

Si la app lleva tiempo sin uso, shinyapps.io tarda más en arrancar. No lo he medido.

#### Antes de empezar la charla

1. Abre la app en una pestaña 10 minutos antes.
2. Pulsa «Ejecutar Simulación» una vez, para que el servidor esté despierto.
3. Sube el zoom del navegador a 125 % o 150 %, para que se lean las cifras desde el fondo.
4. Deja la app en «Configuración», con n = 1.200 y 500 réplicas.

#### Paso 0 · La población (1 min)

- Ve a **Población**. Baja hasta «Distribución de Voto por Edad».
- Di: «Esto es España inventada: 1,5 millones de personas, 52 provincias. Conozco el voto de todas. Soy omnipotente.»
- Señala el gráfico: «Los jóvenes votan más Sumar y Vox. Los mayores, más PP y PSOE. Acordaos de esto.»

#### Paso 1 · Tamaño de muestra (2,5 min)

1. Ve a **Configuración**. Pon n = 400. Pulsa Ejecutar (10 s).
2. Ve a **Distribuciones**, partido PP. Di: «500 encuestas bien hechas. Ninguna da lo mismo.»
3. Señala el eje X: va más o menos de 27 % a 37 %.
4. Vuelve a Configuración. Pon n = 4.000. Ejecuta. Vuelve a Distribuciones.
5. **Cuidado:** el eje se reajusta solo y los dos histogramas parecen igual de anchos. Señala los números del eje: ahora va de 30 % a 34 %.
6. Di: «Diez veces más entrevistas. La dispersión baja a la tercera parte, no a la décima.»

#### Paso 2 · No respuesta (2,5 min)

1. Configuración: n = 1.200. Marca «Sesgo de no-respuesta por edad». Ejecuta.
2. Mientras espera, di: «La muestra es perfecta. Pero los jóvenes cogen el teléfono menos: el 40 %, frente al 85 % de los mayores.»
3. Ve a **Resultados Agregados**. Señala la caja «n efectivo»: unas 800 de 1.200.
4. Señala el gráfico de barras: PP y PSOE salen por encima de la barra azul, Vox y Sumar por debajo.
5. Di la frase: «Nadie ha mentido. El problema no es a quién llamas, es quién te coge el teléfono.» Silencio.

#### Paso 3 · Ponderación (1,5 min)

1. Configuración: deja la no respuesta marcada y marca «Aplicar ponderación post-estratificación». Ejecuta: tarda unos 40 s.
2. Mientras espera, explica: «Sé cuántos jóvenes hay en la población. Si en la muestra me faltan, cada joven que contesta cuenta por más de uno.»
3. Resultados Agregados: en la columna «Sesgo (pp)», el PP vuelve a casi 0.
4. Di: «Se corrige el sesgo, pero la SD sube: sigo teniendo solo 800 entrevistas.»

#### Paso 4 · Votante oculto (2 min)

1. Configuración: desmarca no respuesta y ponderación. Marca «Sesgo de deseabilidad social (Vox)». Ejecuta (10 s).
2. Ve a **Distribuciones**, elige Vox en el desplegable.
3. Señala: la línea roja (real, 10,5 %) queda en la cola derecha. Casi todas las encuestas se quedan por debajo.
4. Di: «Aquí más muestra no ayuda. Con 4.000 entrevistas me equivoco igual, solo que todas en el mismo sitio.»

#### Si algo falla

- La app no carga en 15 s: pasa a las diapositivas «Plan B» (capturas de los pasos 1, 2 y 4).
- Una simulación no termina: no esperes. Di «esto es lo que iba a salir» y pasa a la captura del Plan B de ese paso.

#### Error real de la IA: la cobertura (diapositivas "La Ayuda sonaba perfecta" y "La cobertura, bien calculada")

Confirmado por José Luis el 3 nov 2026: el texto de la Ayuda lo escribió la IA.

**Qué es la cobertura de un IC del 95 %.** Si repites la encuesta muchas veces, es la proporción de intervalos que contienen el valor real. Un buen IC del 95 % cubre el valor real el 95 % de las veces.

**Cómo se calcula bien** (lo que tendría que hacer la app):

1. Cada réplica (encuesta) da su estimación p y su IC 95 %: p ± 1,96 × raíz(p(1 − p) / n).
2. Para cada réplica, miras si el valor real cae dentro de su intervalo.
3. Cobertura = número de intervalos que contienen el valor real / número de réplicas.

**Qué hace la app** (`calcular_metricas` en `R/03_simular_encuestas.R`):

1. Junta las 500 estimaciones y calcula un solo intervalo: del percentil 2,5 al 97,5.
2. Pone 1 si el valor real cae dentro de ese intervalo, y 0 si no.

Eso responde a otra pregunta: «¿el valor real es un resultado posible del muestreo?». No es una cobertura. Por eso la tabla solo muestra unos y ceros, y nunca algo como 0,95.

**La Ayuda dice:** «Cobertura: proporción de veces que el IC 95% contiene el valor real (ideal: ~0.95)». La definición es correcta; el código no hace eso.

**Cifras:**

| Vox, n = 1.200, 500 encuestas | Lo que marca la app | Cobertura bien calculada |
|---|---|---|
| Sin sesgo | 1 | 482 de 500 (96 %) |
| Votante oculto | 1 (captura del 3 nov) | 257 de 500 (51 %) |

**Método de la columna «bien calculada»:** simulación propia (`scripts/grafico_cobertura.R`), no sale de la app. Son 500 encuestas de n = 1.200, con proporción declarada de 10,5 % (sin sesgo) y 8,9 % (votante oculto, la media que dio la app). Semilla 20261120. El gráfico `slides/img/cobertura-intervalos.png` dibuja 50 de las 500.

**Qué decir:** el texto de la Ayuda era convincente; el número no significaba eso. Solo lo ve quien sabe qué es una cobertura.

**Ojo en directo:** el percentil 97,5 de Vox con votante oculto queda en el borde (10,54 frente a 10,50). En otra ejecución la tabla puede marcar 0. La idea sigue valiendo: la columna es un 0/1, nunca un 0,51.

Capturas de la app: `scripts/capturas_cobertura.R`.

### Plan B: cómo leer cada captura

Capturas en `slides/img/encuesta-*.png`, generadas el 3 nov 2026 con `scripts/capturas_simulador.R` sobre la app publicada. Cada escenario: 500 encuestas simuladas, muestreo aleatorio simple. "Diferencia" = estimado − real, en puntos porcentuales (pp). Las cifras cambian un poco en cada ejecución.

**1. Tamaño de muestra** (`encuesta-n400.png`, `encuesta-n4000.png`). Histograma de las 500 estimaciones del PP. Línea roja discontinua: valor real (32,04 %). Línea verde: media de las estimaciones. Los dos tienen el mismo eje X (26 % a 38 %).

- Qué decir: las dos están centradas en el valor real. Lo que cambia es la anchura.
- Cifra: la desviación típica baja de 2,31 pp (n = 400) a 0,75 pp (n = 4.000). Diez veces más entrevistas dividen la dispersión por 3,1, casi raíz de 10.
- Probabilidad de acertar el ganador: 61 % con n = 400 y 79 % con n = 4.000.

**2. No respuesta por edad** (`encuesta-norespuesta.png`). Barras azules: voto real. Barras naranjas: media de las 500 encuestas. La rayita negra cubre el 95 % central de las 500 estimaciones; no es el intervalo de una sola encuesta.

Qué hace la app (comprobado en `R/03_simular_encuestas.R`, función `sesgo_no_respuesta_edad`, repo `joscani/sim_encuestas`):

1. Saca una muestra aleatoria simple de 1.200 personas.
2. Cada persona contesta con una probabilidad que depende de su edad: 40 % (18-24), 50 % (25-34), 60 % (35-44), 70 % (45-54), 80 % (55-64), 85 % (65+).
3. Estima el voto solo con los que contestan: unas 800.

Por qué se mueve la estimación:

- Los que contestan son más mayores que la población.
- En la población simulada, los jóvenes votan más Vox y Sumar, y los mayores más PP y PSOE (multiplicadores por edad y sexo en `R/02_crear_poblacion.R`).
- La encuesta oye de más a los mayores: PP +0,81, PSOE +0,50, Vox −0,52, Sumar −0,71 pp.

Qué decir: nadie ha mentido y el muestreo es correcto. El problema no es a quién llamas, es quién te coge el teléfono.

Si preguntan por más muestra: no se arregla. Con más n, todas las encuestas se equivocan en el mismo sitio. El arreglo es ponderar por edad y sexo (`ponderar_muestra`), que corrige el sesgo porque la no respuesta depende solo de la edad.

**3. Votante oculto** (`encuesta-oculto-vox.png`). Histograma de las 500 estimaciones de Vox con sesgo de deseabilidad social.

- Qué decir: casi todas las encuestas quedan por debajo del valor real. Es el momento de silencio.
- Cifras: real 10,50 %, media estimada 8,97 %, diferencia −1,53 pp. El percentil 97,5 de las réplicas es 10,50 %: el valor real queda en el borde.
- Idea clave: más muestra no lo arregla. El sesgo no baja con n; solo baja la dispersión alrededor del valor equivocado.

**4. Los escenarios juntos** (`encuesta-escenarios.png`). Tabla de la pestaña "Comparación", n = 1.200.

| Escenario | MAE (pp) | Prob. acertar ganador (%) |
|---|---|---|
| Sin sesgos | 0,55 | 68,2 |
| Votante oculto | 0,66 | 64,2 |
| No respuesta + ponderación | 0,72 | 60,8 |
| No respuesta | 0,73 | 67,0 |

- MAE: lo calcula la app. Supongo que es la media de |estimado − real| sobre los 10 partidos y las 500 réplicas; no lo he comprobado en el código.
- Trampa de lectura: el MAE apenas sube con los sesgos porque promedia 10 partidos, y 6 casi no se mueven. Para ver el sesgo, mira la diferencia por partido, no el MAE.
- Ponderar corrige el sesgo (PP de +0,81 a −0,01 pp) pero no baja el MAE: sube la varianza porque quedan unas 800 entrevistas efectivas.
- La probabilidad de acertar el ganador es ruidosa (PP 32,04 % frente a PSOE 31,02 %, solo 1 punto). No la uses como argumento.

**Ponderación:** la app ya la tiene. La diapositiva "La cocina" lo dice y enlaza al post de MRP con varias encuestas (3 nov 2026).

**Adelántate a la pregunta:** el recuerdo de voto no está en la app, y es donde de verdad se decide el titular. Dilo tú antes de que te lo pregunten, y enlaza con el MRP del blog.

### Qué puso el estadístico: el diseño

El muestreo estaba bien; el error estaba en la definición de cobertura (diapositiva "La Ayuda sonaba perfecta"). **Qué sesgos merece la pena simular, cómo se formalizan, y qué tiene que ver el alumno en pantalla para que le haga clic** — eso no sale de un modelo. Sale de haber analizado encuestas y de haber intentado explicárselas a alguien.

**La frase del bloque:** la IA te construye el simulador. Lo que simular, lo pones tú.

---

## 34–44 min · Bloque OCIO — natación con Garmin

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

## Extra (3 min) · Estas diapositivas también son IA

Solo si llegas aquí antes del minuto 42. Si no, salta al Cierre.

- **Qué hizo la IA:** escribió en R (paquete `chromote`) un script que abre la app del simulador en Chrome sin ventana, marca casillas, pulsa Ejecutar, espera y hace las capturas (`scripts/capturas_simulador.R`). También midió los tiempos y leyó el código de la app en GitHub.
- **En qué se equivocó** (todo real, sesión del 2 y 3 nov 2026):
  1. Capturas con un escenario de retraso: esperaba al texto «Simulación completada», que seguía en pantalla de la ejecución anterior. Se vio porque las tablas no cambiaban al activar los sesgos.
  2. Iba a publicar la referencia catastral dentro de la ruta de un script. Se vio al revisar lo que se subía a GitHub.
  3. Dedujo que los posts de octubre no eran con IA porque los commits no llevaban `Co-Authored-By`. Lo corregiste tú.
- **Remate:** «Yo dirijo → ella programa → yo verifico. También aquí.»

## 44–48 min · Cierre

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
