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
        axis.title.y = element_blank(),
        axis.text.x = element_text(size=1, face="bold"),
        axis.text.y = element_blank(),
        legend.position = "none") 



zz <- tt %>% 
  group_by(nom) %>% 
  summarise(nb = n()) %>% 
  filter(nb > 20)
ttn <- tt %>% 
  filter(tt$nom %in% zz$nom)


ll <- lm(lipides~age,data=ttn)
summary(ll)


aa <- tt %>% 
  mutate(id = paste0(str_sub(nom,1,2),str_sub(nom,-3)))

tt %>% 
  ggplot() +
  aes(x = nom, y = lipides, fill =nature.lait) +
  geom_boxplot() +
  labs(title = "Lipides",
       x = "patientes",
       y = "g/L"
  ) + 
  theme_light() + 
  theme(plot.title = element_text(size=16, face="bold"),
        axis.title.x = element_text(size=12, face="bold"),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        legend.position = "top") 




ttestc <- function(varx){
aa <- tt %>% 
  group_by(nature.lait) %>% 
  summarise(vvx = var({{varx}},na.rm =TRUE))
vareq <- round(aa[[1,2]]/aa[[2,2]],3)
print(vareq)
}

zz <- t.test(tt$glucides~tt$nature.lait,var.equal = TRUE)