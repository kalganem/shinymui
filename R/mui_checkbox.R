#' Checkbox Input
#'
#' UI Shiny Input for a Checkbox
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @param inputId Input id
#' @param checked If true, the component is checked.
#' @param label Label text
#' @param labelPlacement Label text placement c("end", "start", "top", "bottom")
#' @param disabled If true, the component is disabled
#' @param disableRipple If true, the ripple effect is disabled.
#' @param color The color of the component c('primary', 'secondary','error','info', 'success', 'warning')
#' @param size Size of icons c("small", "medium")
#' @param ... Other arguments/props
#'
#' @examples
#'
#' mui_checkboxInput("checkbox_1", checked = TRUE, label = "Choice A",
#'                     color = "success", size = "medium")
#'
#' @seealso \href{https://mui.com/api/checkbox/}{Additional arguments/props}
#'
#' @export
mui_checkboxInput <- function(inputId, checked = F, label = "",
                              labelPlacement = "end", disabled = F,
                              disableRipple = F, color = "primary",
                              size = "medium",...
                              ) {

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
    default = checked,
    list(
      label = label,
      labelPlacement = labelPlacement,
      disabled = disabled,
      disableRipple = disableRipple,
      color = color,
      size = size,
      ...
         ),
    htmltools::tags$span
  )
}

#' Checkbox Update Input
#'
#' Updating UI Shiny Input for Checkbox
#'
#' @param session Shiny session
#' @param inputId Input id
#' @param value Input value
#' @param configuration Other arguments/props
#'
#' @export
updateMui_checkboxInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
