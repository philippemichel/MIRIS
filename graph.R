ttn %>% 
  ggplot() +
  aes(x = age, y = lipides) +
  geom_line() +
  facet_grid(nom~.) +
  labs(title = "Lipides",
       x = "Âge (j)",
       y = "g/L"
  ) + 
  theme_light() + 
  theme(plot.title = element_text(size=16, face="bold"),
        axis.title.x = element_text(size=12, face="bold"),
        axis.title.y = element_text(size=12, face="bold"),
        axis.text.x = element_text(size=12, face="bold"),
        axis.text.y = element_text(size=12, face="bold"),
        legend.position = "none") 



zz <- tt %>% 
  group_by(nom) %>% 
  summarise(nb = n()) %>% 
  filter(nb > 3)
ttn <- tt %>% 
  filter(tt$nom %in% zz$nom)