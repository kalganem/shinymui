#' MUI Checkbox Input
#'
#' UI Shiny Input for a Checkbox
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
mui_checkboxInput <- function(inputId, default = F) {
  reactR::createReactShinyInput(
    inputId,
    "mui_checkbox",
    htmltools::htmlDependency(
      name = "shinymui",
      version = "1.0.0",
      src = "www/shinymui/shinymui",
      package = "shinymui",
      script = "shinymui.js"
    ),
    default,
    list(),
    htmltools::tags$span
  )
}

#' MUI Rating Updated Input
#'
#' Updating UI Shiny Input for Checkbox
#'
#' @export
updateMui_checkboxInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
