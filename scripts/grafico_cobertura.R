# Gráfico de cobertura: un IC del 95 % por encuesta y cuántos contienen el valor real.
# Simulación propia con los parámetros del simulador (Vox real 10,5 %, n = 1.200).
# - Sin sesgo: cada encuestado declara Vox con probabilidad 0,105.
# - Votante oculto: la media estimada en la app fue 8,90 %, así que se usa 0,089.
# Se calculan 500 encuestas (como en la app) y se dibujan las 50 primeras.
#
# Uso: Rscript scripts/grafico_cobertura.R

library(ggplot2)

set.seed(20261120)
n <- 1200
real <- 10.5
n_encuestas <- 500
n_dibujo <- 50

simula <- function(p_declarado, escenario) {
  p_hat <- rbinom(n_encuestas, n, p_declarado) / n
  ee <- sqrt(p_hat * (1 - p_hat) / n)
  d <- data.frame(
    escenario = escenario,
    encuesta = seq_len(n_encuestas),
    est = 100 * p_hat,
    inf = 100 * (p_hat - 1.96 * ee),
    sup = 100 * (p_hat + 1.96 * ee)
  )
  d$contiene <- d$inf <= real & real <= d$sup
  d
}

d <- rbind(simula(0.105, "Sin sesgo"), simula(0.089, "Votante oculto"))

cobertura <- aggregate(contiene ~ escenario, data = d, FUN = mean)
print(cobertura)

etiquetas <- setNames(
  sprintf("%s: %d de %d intervalos contienen el valor real (%.0f %%)",
          cobertura$escenario,
          round(cobertura$contiene * n_encuestas), n_encuestas,
          100 * cobertura$contiene),
  cobertura$escenario
)

d_dibujo <- d[d$encuesta <= n_dibujo, ]

p <- ggplot(d_dibujo, aes(y = encuesta)) +
  geom_vline(xintercept = real, colour = "#c0392b", linewidth = 1, linetype = "dashed") +
  geom_segment(aes(x = inf, xend = sup, yend = encuesta, colour = contiene), linewidth = 1.1) +
  geom_point(aes(x = est, colour = contiene), size = 1.6) +
  scale_colour_manual(values = c(`TRUE` = "#1a3a5c", `FALSE` = "#e67e22"),
                      labels = c(`TRUE` = "Contiene el valor real", `FALSE` = "No lo contiene"),
                      name = NULL) +
  facet_wrap(~escenario, ncol = 2, labeller = as_labeller(etiquetas)) +
  labs(x = "Voto a Vox estimado (%) e IC del 95 % de cada encuesta",
       y = sprintf("Encuesta (se dibujan %d de %d)", n_dibujo, n_encuestas)) +
  annotate("text", x = real, y = n_dibujo + 2.5, label = "Real: 10,5 %",
           colour = "#c0392b", hjust = -0.05, size = 4.5) +
  coord_cartesian(ylim = c(0, n_dibujo + 3)) +
  theme_minimal(base_size = 16) +
  theme(
    legend.position = "top",
    panel.grid.minor = element_blank(),
    panel.grid.major.y = element_blank(),
    axis.text.y = element_blank(),
    strip.text = element_text(size = 13, face = "bold"),
    plot.background = element_rect(fill = "#fdfdfb", colour = NA),
    text = element_text(colour = "#1c2733")
  )

ggsave("slides/img/cobertura-intervalos.png", p, width = 13, height = 6.5, dpi = 200)
cat("Guardado: slides/img/cobertura-intervalos.png\n")
