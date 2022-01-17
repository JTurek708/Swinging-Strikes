# PITCHf/x Data
kb_sample <- kb_statcast %>%
  sample_n(500)
View(kb_sample)
k_zone_plot_KB <- ggplot(kb_sample, aes(x = plate_x, y = plate_z)) +
  geom_rect(xmin = -0.947, xmax = 0.947, ymin = 1.5,
            ymax = 3.6, fill = "black", alpha = 0.01) +
  coord_equal() +
  scale_x_continuous("Horizontal Location (ft.)",
                     limits = c(-2, 2)) + 
  scale_y_continuous("Vertical Location (ft)",
                     limits = c(0, 5))
k_zone_plot_KB +
  geom_point(aes(color = factor(description == "swinging_strike"))) + 
  scale_color_manual(values = c("blue", "blue"),
                     labels = c("KB Swinging Strikes", "2021")) +
  labs(title = "Kris Bryant Swinging Strikes 2021")


# Jose Abreu
jabreu_sample <- Abreu_Jose %>%
  sample_n(500)
View(jabreu_sample)
k_zone_plot <- ggplot(jabreu_sample, aes(x = plate_x, y = plate_z)) +
  geom_rect(xmin = -0.947, xmax = 0.947, ymin = 1.5,
            ymax = 3.6, fill = "black", alpha = 0.01) +
  coord_equal() +
  scale_x_continuous("Horizontal Location (ft.)",
                     limits = c(-2, 2)) + 
  scale_y_continuous("Vertical Location (ft)",
                     limits = c(0, 5))
k_zone_plot + 
  geom_point(aes(color = factor(description == "swinging_strike"))) + 
  scale_color_manual(values = c("blue", "blue"),
                     labels = c("JA Swinging Strikes", "2021")) + 
  labs(title = "Jose Abreu Swinging Strikes 2021")
