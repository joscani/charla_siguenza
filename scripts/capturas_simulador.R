# Capturas del simulador de encuestas para las diapositivas (plan B de la demo).
# Maneja la app publicada con Chrome sin ventana (chromote) y guarda PNG en slides/img/.
#
# Uso: Rscript scripts/capturas_simulador.R
# Tarda unos 6-8 minutos: 6 simulaciones de 500 réplicas.

library(chromote)

url <- "https://canadasreche.shinyapps.io/sim-encuestas-electorales/"
dir_img <- "slides/img"

b <- ChromoteSession$new(width = 1600, height = 2400)
invisible(b$Page$navigate(url))
Sys.sleep(20)

js <- function(x) b$Runtime$evaluate(x, returnByValue = TRUE)$result$value

tab <- function(t) {
  js(sprintf("document.querySelector('.sidebar-menu a[href=\"#shiny-tab-%s\"]').click(); 1", t))
  Sys.sleep(5)
}
slider <- function(id, v) {
  js(sprintf("$('#%s').data('ionRangeSlider').update({from: %d}); $('#%s').trigger('change'); 1", id, v, id))
  Sys.sleep(1)
}
check <- function(id, v) {
  js(sprintf("$('#%s').prop('checked', %s).trigger('change'); 1", id, tolower(v)))
  Sys.sleep(1)
}

# Borra el texto de estado antes de lanzar, para no confundir la ejecución anterior con la nueva
ejecutar <- function() {
  tab("config")
  js("document.querySelector('#estado_simulacion').innerText = 'ESPERANDO'; $('#ejecutar').click(); 1")
  Sys.sleep(2)
  for (k in 1:80) {
    Sys.sleep(3)
    e <- js("document.querySelector('#estado_simulacion').innerText")
    if (grepl("completada", e)) break
  }
  cat(trimws(e), "\n")
  tab("resultados")
  Sys.sleep(4)
}

guardar <- function(nombre) {
  tab("comparacion")
  js(sprintf("$('#nombre_escenario').val('%s').trigger('change'); 1", nombre))
  Sys.sleep(1)
  js("$('#guardar_escenario').click(); 1")
  Sys.sleep(4)
}

resumen <- function(etiqueta) {
  cajas <- js("['prob_ganador_box','mae_box','n_efectivo_box'].map(i => document.getElementById(i).innerText.replace(/\\s+/g, ' ').trim()).join(' || ')")
  filas <- js("Array.from(document.querySelectorAll('#tabla_resultados tbody tr')).slice(0, 5).map(r => r.innerText.replace(/\\t/g, ' | ')).join('\\n')")
  cat("==", etiqueta, "==\n", cajas, "\n", filas, "\n\n")
}

# Captura la caja (.box) que contiene el elemento, sin depender de coordenadas
foto <- function(fichero, selector) {
  js(sprintf("var e = document.querySelector('%s'); var c = e.closest('.box') || e; c.id = 'cap_x'; c.scrollIntoView(); 1", selector))
  Sys.sleep(2)
  b$screenshot(file.path(dir_img, fichero), selector = "#cap_x", scale = 2)
  js("document.getElementById('cap_x').removeAttribute('id'); 1")
  invisible(NULL)
}

fijar_eje_x <- function(rango) {
  js(sprintf("var g = document.querySelector('#histograma_partido .js-plotly-plot') || document.getElementById('histograma_partido'); Plotly.relayout(g, {'xaxis.range': [%s, %s]}); 1", rango[1], rango[2]))
  Sys.sleep(2)
}

slider("n_replicas", 500)

# 1. Tamaño muestral: mismo eje X para que se vea cómo se estrecha la distribución
for (n in c(400, 4000)) {
  slider("n_muestra", n)
  ejecutar()
  resumen(paste("n =", n))
  tab("distribuciones")
  fijar_eje_x(c(26, 38))
  foto(sprintf("encuesta-n%d.png", n), "#histograma_partido")
}

# 2. Sin sesgos, n = 1200
slider("n_muestra", 1200)
ejecutar(); resumen("Sin sesgos")
guardar("Sin sesgos")

# 3. No respuesta por edad
check("sesgo_no_respuesta", TRUE)
ejecutar(); resumen("No respuesta")
foto("encuesta-norespuesta.png", "#grafico_comparacion")
guardar("No respuesta")

# 4. No respuesta + ponderación post-estratificación
check("ponderar", TRUE)
ejecutar(); resumen("No respuesta + ponderación")
guardar("No respuesta + ponderación")
check("ponderar", FALSE)
check("sesgo_no_respuesta", FALSE)

# 5. Deseabilidad social (votante oculto de Vox)
check("sesgo_deseabilidad", TRUE)
ejecutar(); resumen("Votante oculto")
foto("encuesta-oculto.png", "#grafico_comparacion")
guardar("Votante oculto")
js("$('#partido_seleccionado')[0].selectize.setValue('Vox'); 1")
tab("distribuciones")
fijar_eje_x(c(6, 14))
foto("encuesta-oculto-vox.png", "#histograma_partido")

# 6. Comparación de escenarios guardados
tab("comparacion")
foto("encuesta-escenarios.png", "#tabla_escenarios")

b$close()
