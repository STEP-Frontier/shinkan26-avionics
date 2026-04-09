// from https://github.com/nukanoto/piman

#import "@preview/touying:0.6.1": *

#let slide(..args) = touying-slide-wrapper(self => {
  // set page
  let header(self) = {
    set text(fill: self.colors.neutral-darkest, weight: "bold", size: 1.5em)
    h(1em)
    box(height: 1.5em, baseline: 25%)[
      #rect(width: 0.25em, height: 100%, fill: self.colors.primary)
    ]
    h(0.4em)
    utils.display-current-heading(level: 2)
  }

  let footer(self) = {
    set align(bottom)
    show: pad.with(1.2em)
    set text(fill: self.colors.neutral-darkest, size: 0.8em)
    utils.call-or-display(self, self.store.footer)
    h(1fr)
    context utils.slide-counter.display() + " / " + utils.last-slide-number
  }

  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
    ),
  )
  touying-slide(self: self, ..args)
})

#let piman-theme(
  aspect-ratio: "16-9",
  footer: none,
  event: none,
  title: none,
  subtitle: none,
  logo: none,
  affiliation: none,
  author: none,
  ..args,
  body,
) = {
  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      margin: (top: 5em, bottom: 1.5em, x: 2.5em),
      fill: rgb("#f1f7ff"),
    ),
    config-common(
      slide-fn: slide,
    ),
    config-colors(
      primary: rgb("#18448E"),
      secondary: rgb("#89938D"),
      tertiary-lighter: rgb("#84939B"),
      neutral-lightest: rgb("#494949"),
      neutral-darkest: rgb("#1B1B1B"),
    ),
    config-methods(
      init: (self: none, body) => {
        set text(size: 22pt, font: ("A P-OTF UD Shin Go NT Pr6N R", "Noto Sans CJK JP"))
        show text.where(weight: "bold"): it => [
          #set text(font: ("A P-OTF UD Shin Go NT Pr6N DB", "Noto Sans CJK JP"))
          #it
        ]
        show strong: it => [
          #set text(font: ("A P-OTF UD Shin Go NT Pr6N DB", "Noto Sans CJK JP"))
          #it
        ]

        body
      },
      alert: (self: none, it) => text(fill: self.colors.primary, it),
    ),
    config-store(
      footer: footer,
      event: event,
      title: title,
      subtitle: subtitle,
      logo: logo,
      affiliation: affiliation,
      author: author,
    ),
    ..args,
  )

  body
}

#let title-slide(
  event: none,
  title: none,
  subtitle: none,
  logo: none,
  affiliation: none,
  author: none,
) = touying-slide-wrapper(self => {
  let store = self.store

  // Use passed parameters or fall back to store
  let event-name = if event != none { event } else { store.event }
  let title = if title != none { title } else { store.title }
  let subtitle = if subtitle != none { subtitle } else { store.subtitle }
  let logo = if logo != none { logo } else { store.logo }
  let affiliation = if affiliation != none { affiliation } else { store.affiliation }
  let author = if author != none { author } else { store.author }

  let body = {
    set text(fill: self.colors.neutral-darkest)

    // Event name (small, at top)
    if event-name != none {
      text(size: 1.2em, event-name, fill: self.colors.neutral-lightest)
    } else {
      text(size: 1.2em, "")
    }

    linebreak()

    // Main title (large, bold)
    text(size: 2.2em, weight: "bold", title)

    linebreak()

    // Subtitle
    if subtitle != none {
      text(size: 1.5em, weight: "bold", subtitle)
    }

    set align(bottom)

    h(1fr)

    // Author
    if author != none {
      text(size: 1.2em, weight: "bold", author)
    }

    linebreak()
    h(1fr)

    // Affiliation
    if affiliation != none {
      text(size: 0.9em, affiliation)
    } else {
      text(size: 0.9em, "")
    }
  }

  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
    ),
  )

  touying-slide(self: self, body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      margin: 2em,
    ),
  )

  set text(weight: "bold", size: 2.5em)

  touying-slide(self: self, align(horizon + center, body))
})