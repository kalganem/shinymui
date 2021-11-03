#' Rating Input
#'
#' UI Shiny Input for Rating
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @param inputId Input id
#' @param value list of items
#' @param position text position c("right", "left", "alternate")
#'
#' @examples
#'
#' mui_timelineInput("timeline_1", position = "alternate")
#'
#'
#'
#' @export
mui_timelineInput <- function(inputId, value = c("First", "Second", "Third"), position = "right") {

  reactR::createReactShinyInput(
    inputId,
    "mui_timeline",
    htmltools::htmlDependency(
      name = "shinymui",
      version = "1.0.0",
      src = "www/shinymui/shinymui",
      package = "shinymui",
      script = "shinymui.js"
    ),
    default = value,
    list(position = position),
    htmltools::tags$span
  )
}

#' Rating Update Input
#'
#' Updating UI Shiny Input for Rating
#'
#' @param session Shiny session
#' @param inputId Input id
#' @param value Input value
#' @param configuration Other arguments/props
#'
#' @export
updateMui_timelineInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
