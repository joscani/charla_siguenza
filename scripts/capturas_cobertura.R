# Capturas del error de "Cobertura": la Ayuda dice una cosa y la tabla calcula otra.
# Uso: Rscript scripts/capturas_cobertura.R   (unos 2 minutos)
library(chromote)
b <- ChromoteSession$new(width = 1600, height = 2400)
invisible(b$Page$navigate("https://canadasreche.shinyapps.io/sim-encuestas-electorales/"))
js <- function(x) b$Runtime$evaluate(x, returnByValue = TRUE)$result$value
for (k in 1:60) { Sys.sleep(1); if (isTRUE(js("!!(window.Shiny && Shiny.shinyapp && Shiny.shinyapp.isConnected() && document.getElementById('ejecutar'))"))) break }
Sys.sleep(3)
tab <- function(t) { js(sprintf("document.querySelector('.sidebar-menu a[href=\"#shiny-tab-%s\"]').click(); 1", t)); Sys.sleep(5) }
foto <- function(f, sel) {
  js(sprintf("var e=document.querySelector('%s'); var c=e.closest('.box')||e; c.id='cap_x'; c.scrollIntoView(); 1", sel)); Sys.sleep(2)
  b$screenshot(file.path("slides/img", f), selector = "#cap_x", scale = 2)
  js("document.getElementById('cap_x').removeAttribute('id'); 1")
}
js("$('#n_replicas').data('ionRangeSlider').update({from: 500}); $('#n_replicas').trigger('change'); 1"); Sys.sleep(1)
js("$('#sesgo_deseabilidad').prop('checked', true).trigger('change'); 1"); Sys.sleep(1)
js("document.querySelector('#estado_simulacion').innerText='ESPERANDO'; $('#ejecutar').click(); 1")
for (k in 1:120) { Sys.sleep(1); if (grepl("completada", js("document.querySelector('#estado_simulacion').innerText"))) break }
tab("resultados")
cat(js("Array.from(document.querySelectorAll('#tabla_resultados tbody tr')).slice(0,5).map(r=>r.innerText.replace(/\\t/g,' | ')).join('\\n')"), "\n")
foto("cobertura-tabla.png", "#tabla_resultados")
tab("ayuda")
foto("cobertura-ayuda.png", "#shiny-tab-ayuda .box")
b$close()
