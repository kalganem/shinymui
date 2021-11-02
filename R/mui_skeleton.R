#' Rating Input
#'
#' UI Shiny Input for Rating
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @param inputId Input id
#' @param default Default value
#' @param variant shape of skeleton c("text","rectangular", "circular").  default="rectangular"
#' @param animation The animation. If false the animation effect is disabled. c("pulse", "wave"). default="pulse"
#' @param ... other props/arguments
#'
#' @examples
#'
#' mui_skeleton("sk_1",variant = "rectangular", height = 400, width = "100%")
#'
#'
#' @seealso \href{https://mui.com/api/skeleton/}{Additional arguments/props}
#'
#'
#' @export
mui_skeleton <- function(inputId, default = NULL, variant = "rectangular", animation = "pulse", ...) {

  reactR::createReactShinyInput(
    inputId,
    "mui_skeleton",
    htmltools::htmlDependency(
      name = "shinymui",
      version = "1.0.0",
      src = "www/shinymui/shinymui",
      package = "shinymui",
      script = "shinymui.js"
    ),
    default = default,
    list(variant = variant,
         animation = animation,
         ...
    ),
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
# updateMui_skeleton <- function(session, inputId, value, configuration = NULL) {
#   message <- list(value = value)
#   if (!is.null(configuration)) message$configuration <- configuration
#   session$sendInputMessage(inputId, message);
# }
