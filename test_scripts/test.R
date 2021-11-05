# list_1 <- list("Hii", "rt", "ff")
# list_2 <- list("eg", "gk")
#
#
library(dplyr)
# purrr::map2(list_1, list_2, list)  -> comb_list
#
# purrr::map(comb_list, setNames, c("title", "text")) %>% jsonlite::toJSON()
#
# target_list <- list(list(title = "dflkv", text = "frf"), list(title = "dflefckv", text = "frecdcf"))


x <- as.list(value_fromJS)

split(value_fromJS,col(matrix(value_fromJS,6)))

apply(matrix(value_fromJS, ncol=6, byrow=TRUE), 1, as.list) -> xx

purrr::map(xx,
           setNames,
           c("title","title_color", "text", "text_color",
             "dot_variant","dot_color")) %>% jsonlite::toJSON()



add_list <- list(
  title = "Khaled",
  text = "alganem",
  dot_variant = "filled",
  dot_color = "error"
)

add_list2 <- list(
  title = "",
  text = "",
  dot_variant = "filled",
  dot_color = "info"
)

as.data.frame(do.call(rbind, list(add_list, add_list2)))
