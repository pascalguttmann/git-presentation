#import "@preview/polylux:0.3.1": *
#import themes.university: *

#let title = "Version Control with Git"
#let subtitle = ""
#let author = ("P. Guttmann")
#let institution-name = "Hochschule Furtwangen"
#let date = datetime.today().display(
    "[day padding:space] [month repr:short] [year repr:full]"
)

#let accent-color = rgb("#03B670")
#let accent-focus-slide(body) = focus-slide(background-color: accent-color)[#body]

#show: university-theme.with(
  aspect-ratio: "16-9",
  short-author: author,
  short-title: title,
  short-date: date,
  color-a: accent-color, //main decoration (headings, footer)
  color-b: rgb("#808080"), //accent color (footer line)
  //color-c: rgb("#FBFEF9"),  //secondary accent (header background)
  progress-bar: true,
)

#title-slide(
  authors: author,
  title: title,
  subtitle: subtitle,
  date: date,
  institution-name: institution-name,
  // logo: image("dummy-logo.png", width: 60mm)
)

#accent-focus-slide()[
  Why?
]

#slide(title: [Slide title], new-section: [The section])[
  #lorem(40)
]

#slide(title: [New Slide title])[
  A new slide!
]

#focus-slide(background-color: accent-color)[
  *Another variant with an image in background...*
]

#matrix-slide[
  left
][
  right
]
