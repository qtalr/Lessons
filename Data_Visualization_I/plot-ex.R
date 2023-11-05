# plot-ex.R
p <- ggplot(mtcars, aes(x = mpg, y = disp)) +
  geom_point()

print(p)