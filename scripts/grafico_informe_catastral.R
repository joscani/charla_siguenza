# Gráfico anónimo "modelo vs mercado" para la diapositiva del informe catastral.
# Mismo gráfico que en la charla de Málaga, con los colores de Sigüenza.
# Anonimización: sin eje Y (no hay euros), sin referencia catastral, sin zona.
# Datos: medianas trimestrales del informe original (fuera de este repo).
#
# Uso: Rscript scripts/grafico_informe_catastral.R <ruta a data_combined.csv>
# La ruta no se guarda en el repo porque contiene la referencia catastral.

library(ggplot2)

args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) stop("Indica la ruta a data_combined.csv del informe catastral.")
entrada <- args[1]
salida <- "slides/img/empresa-informe.png"

d <- read.csv(path.expand(entrada))
d$trimestre <- factor(
  paste0("T", d$quarter, " ", d$year),
  levels = paste0("T", d$quarter, " ", d$year)
)

largo <- rbind(
  data.frame(trimestre = d$trimestre, serie = "Mercado (mediana de anuncios)",
             precio = d$price_real_median),
  data.frame(trimestre = d$trimestre, serie = "Modelo",
             precio = d$price_model_cadastre)
)

colores <- c("Mercado (mediana de anuncios)" = "#9aa5b1", "Modelo" = "#1a3a5c")

p <- ggplot(largo, aes(trimestre, precio, colour = serie, group = serie)) +
  geom_line(linewidth = 1.6) +
  geom_point(size = 3.5) +
  scale_colour_manual(values = colores) +
  labs(x = NULL, y = NULL, colour = NULL) +
  theme_minimal(base_size = 18) +
  theme(
    legend.position = "top",
    axis.text.y = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(),
    plot.background = element_rect(fill = "#fdfdfb", colour = NA),
    text = element_text(colour = "#1c2733")
  )

ggsave(salida, p, width = 11, height = 4.6, dpi = 200)
cat("Guardado:", salida, "\n")
