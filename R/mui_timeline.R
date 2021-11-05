#' Timeline Input
#'
#' UI Shiny Input for Timeline
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @param inputId Input id
#' @param value list of items
#' @param position text position c("right", "left", "alternate")
#' @param subvalues subtext of each list title
#' @param dot_variant filled vs outlined
#' @param dot_color default "grey"
#' @param ... other options
#'
#' @examples
#'
#' mui_timelineInput("timeline_1", value = c("List 1", "List 2", "List 3"), position = "alternate")
#'
#'
#'
#' @export
mui_timelineInput <- function(inputId, value = NULL, subvalues = NULL,
                              dot_variant="outlined", dot_color = "grey",
                              position = "right", ...) {


  numberOfLists <- max(length(value), length(subvalues))

  if(!is.null(value) && length(value) != length(subvalues)) {
    moreTitles <- length(value) - length(subvalues)
    if(moreTitles > 0) {
      subvalues <- c(subvalues, rep("", abs(moreTitles)))
    }
    else {
      value <- c(value, rep("", abs(moreTitles)))
    }
  }

  dot_variant <- expandList(dot_variant, numberOfLists)
  dot_color <- expandList(dot_color, numberOfLists)

  value <- purrr::map(purrr::pmap(list(value,
                                  subvalues,
                                  dot_variant, dot_color), list),
                      setNames,
                      c("title", "text",
                        "dot_variant","dot_color"))

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
    list(position = position,
         ...
         ),
    htmltools::tags$span
  )
}

#' Timeline Update Input
#'
#' Updating UI Shiny Input for Timeline
#'
#' @param session Shiny session
#' @param inputId Input id
#' @param value Input value
#' @param subvalues subtext of each list title
#' @param configuration Other arguments/props
#'
#' @export
updateMui_timelineInput <- function(session, inputId, value = NULL, subvalues = NULL,configuration = NULL) {
   message <- list()

  # if (!is.null(value) && !is.null(subvalues)) {
  #   if(!is.null(value) && length(value) != length(subvalues)) {
  #     moreTitles <- length(value) - length(subvalues)
  #     if(moreTitles > 0) {
  #       subvalues <- c(subvalues, rep("", abs(moreTitles)))
  #     }
  #     else {
  #       value <- c(value, rep("", abs(moreTitles)))
  #     }
  #   }
  #
  #   value <- purrr::map(purrr::map2(value, subvalues, list), setNames, c("title", "text"))
  #   message <- list(value = value)
  # }

  if (!is.null(value)) {
    message$value <- value
  }

  if (!is.null(configuration)) {
    message$configuration <- configuration
  }

  session$sendInputMessage(inputId, message);
}
