#' Transfer List UI
#'
#' UI Shiny Transfer List
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @param inputId Input id
#' @param value Default value (will be the list on the right by default)
#' @param left_list Values of the list on the left (vector or list) (must be initialized with at least two values)
#' @param right_list Values of the list on the right (vector or list) (must be initialized with at least two values)
#' @param left_title The title of the list on the left (default  = "Choices")
#' @param right_title The title of the list on the right (default = "Chosen")
#' @param direction The layout of the lists c("row", "column"). Default = "row"
#' @param justifyContent justifyContent prop passed to the main grid. options: flex-start, center, flex-end, space-between, space-around, space-evenly
#'
#' @examples
#'
#' mui_transferList("transferList_1", left_list = names(mtcars),
#' right_list = names(iris))
#'
#'
#' @seealso \href{https://mui.com/api/transfer-list/}{Additional arguments/props}
#'
#'
#' @export
mui_transferList <- function(inputId, value = NULL,
                             left_list = c("A", "B", "C"),
                             right_list = c("D", "E", "F"),
                             left_title = "Choices",
                             right_title = "Chosen",
                             direction = "row",
                             justifyContent = "center"

                             ) {

  reactR::createReactShinyInput(
    inputId,
    "mui_transferlist",
    htmltools::htmlDependency(
      name = "shinymui",
      version = "1.0.0",
      src = "www/shinymui/shinymui",
      package = "shinymui",
      script = "shinymui.js"
    ),
    default = unique(right_list),
    list(
      left_list = unique(left_list),
      right_list = unique(right_list),
      left_title = left_title,
      right_title = right_title,
      direction = direction,
      justifyContent = justifyContent

    ),
    htmltools::tags$span
  )
}

#' Transfer List
#'
#' Updating Transfer List
#'
#' @param session Shiny session
#' @param inputId Input id
#' @param value Input value
#' @param configuration Other arguments/props
#'
#' @export
updateMui_transferList <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
