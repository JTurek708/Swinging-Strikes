# Amount & Types of Pitches seen by Kris Bryant
pitch_table <- kb_statcast %>%
  group_by(pitch_type) %>%
  summarise(N = n()) %>%
  mutate(Pct = N / sum(N)) %>%
  arrange(desc(N))

pitch_table
Pitch <- c("Changeup", "Curveball", "Cutter", "Four Seam Fastball", "Splitter", "Knuckle Curve", "Sinker", "Slider")
# Barchart of pitches seen by Kris Bryant
kb_chart <- ggplot(pitch_table, aes(pitch_type, N, fill = pitch_type)) + 
  geom_bar(stat = "identity") +
  xlab("Pitch Type") + 
  ylab("Count") +
  ggtitle("Number of Pitches Seen by KB by Pitch Type") 
  
kb_chart


# K-Zone plot of Four-seam Fastballs
k_zone_plot_KB_FF <- ggplot(kb_fastball, aes(x = plate_x, y = plate_z)) +
  geom_rect(xmin = -0.947, xmax = 0.947, ymin = 1.5,
            ymax = 3.6, fill = "black", alpha = 0.01) +
  coord_equal() +
  scale_x_continuous("Horizontal Location (ft.)",
                     limits = c(-2, 2)) + 
  scale_y_continuous("Vertical Location (ft)",
                     limits = c(0, 5))
k_zone_plot_KB_FF +
  geom_point(aes(color = factor(description))) + 
  scale_color_manual(values = c("blue", "blue"),
                     labels = c("KB Swinging Strikes", "2021")) +
  labs(title = "Kris Bryant Swinging Strikes FF")

# Plot of Sliders
kb_slider <- kb_statcast %>%
  filter(pitch_type == "SL")
View(kb_slider)
Avg_Velo <- mean(kb_slider$release_speed)
Avg_Velo
# Slider movement
slider_movement_horiz <- mean(kb_slider$pfx_x)
slider_movement_vert <- mean(kb_slider$pfx_z)  
slider_movement_horiz
slider_movement_vert

# K Zone plot for Sliders
k_zone_plot_KB_SL <- ggplot(kb_slider, aes(x = plate_x, y = plate_z)) +
  geom_rect(xmin = -0.947, xmax = 0.947, ymin = 1.5,
            ymax = 3.6, fill = "black", alpha = 0.01) +
  coord_equal() +
  scale_x_continuous("Horizontal Location (ft.)",
                     limits = c(-2, 2)) + 
  scale_y_continuous("Vertical Location (ft)",
                     limits = c(0, 5))
k_zone_plot_KB_SL +
  geom_point(aes(color = factor(pitch_type))) + 
  scale_color_manual(values = c("red", "red"),
                     labels = c("KB Swinging Strikes", "2021")) +
  labs(title = "Kris Bryant Swinging Strikes SL")


# Kris Bryant Against Sinkers
kb_sinker <- kb_statcast %>%
  filter(pitch_type == "SI")
View(kb_sinker)
Avg_Velo_Sinker <- mean(kb_sinker$release_speed)
Avg_Velo_Sinker
sinker_movement_horiz <- mean(kb_sinker$pfx_x)
sinker_movement_vert <- mean(kb_sinker$pfx_z)  
sinker_movement_horiz
sinker_movement_vert
k_zone_plot_KB_SI <- ggplot(kb_sinker, aes(x = plate_x, y = plate_z)) +
  geom_rect(xmin = -0.947, xmax = 0.947, ymin = 1.5,
            ymax = 3.6, fill = "black", alpha = 0.01) +
  coord_equal() +
  scale_x_continuous("Horizontal Location (ft.)",
                     limits = c(-2, 2)) + 
  scale_y_continuous("Vertical Location (ft)",
                     limits = c(0, 5))
k_zone_plot_KB_SI +
  geom_point(aes(color = factor(pitch_type))) + 
  scale_color_manual(values = c("orange", "orange"),
                     labels = c("KB Swinging Strikes", "2021")) +
  labs(title = "Kris Bryant Swinging Strikes SI")
