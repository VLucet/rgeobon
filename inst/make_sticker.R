library(hexSticker)
sticker <- sticker(package="rgeobon",subplot ="inst/images/geobon-site-icon.png",
                   p_family = "Aller_Rg",
                   p_color = "#038c7c", p_size = 22,
                   s_x = 1, s_y = 0.8, asp=0.9,
                   h_fill = "#ffffff", h_color = "#71aab0", h_size = 1.5,
                   spotlight =F,
                   filename = "inst/images/sticker.png")
sticker
save_sticker(filename = "inst/images/sticker.png",sticker = sticker)
