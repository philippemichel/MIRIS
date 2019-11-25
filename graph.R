tt %>% 
  ggplot() +
  aes(x = age, y = glucides, color = nature.lait) +
  geom_point() +
  geom_smooth() +
  labs(title = "Glucides",
       x = "Âge (j)",
       y = "mmol/L"
  ) + 
  theme_light() + 
  theme(plot.title = element_text(size=16, face="bold"),
        axis.title.x = element_text(size=12, face="bold"),
        axis.title.y = element_text(size=12, face="bold"),
        axis.text.x = element_text(size=12, face="bold"),
        axis.text.y = element_text(size=12, face="bold"),
        legend.position = "right") 