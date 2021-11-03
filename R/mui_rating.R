#' Rating Input
#'
#' UI Shiny Input for Rating
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @param inputId Input id
#' @param value Default value
#' @param size Size of icons c("small", "medium", "large")
#' @param max Maximum rating
#' @param disabled If true, the component is disabled
#' @param highlightSelectedOnly If true, only the selected icon will be highlighted
#' @param precision The minimum increment value change allowed
#' @param readOnly Removes all hover effects and pointer events
#' @param ... Other arguments/props
#'
#' @examples
#'
#' mui_ratingInput("rating_1", size = "medium", max = 5, precision = 0.5)
#'
#' @seealso \href{https://mui.com/api/rating/}{Additional arguments/props}
#'
#'
#' @export
mui_ratingInput <- function(inputId, value = NULL, size = "small", max = 5,
                            disabled = FALSE, highlightSelectedOnly = FALSE,
                            precision = 1, readOnly = FALSE, ...
                            ) {

  reactR::createReactShinyInput(
    inputId,
    "mui_rating",
    htmltools::htmlDependency(
      name = "shinymui",
      version = "1.0.0",
      src = "www/shinymui/shinymui",
      package = "shinymui",
      script = "shinymui.js"
    ),
    default = value,
    list(size = size,
         max = max,
         disabled = disabled,
         highlightSelectedOnly = highlightSelectedOnly,
         precision = precision,
         readOnly = readOnly, ...
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
updateMui_ratingInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
