#let main(
  title: none,
  version: none,
  authors: (),
  abstract: [],
  doc,
) = {
  set page("us-letter")
  set align(center)

  [
    #v(40pt)
    #image("../images/brand.svg", width: 30%)
    #v(40pt)
  ]

  [
    #text(12pt, smallcaps([
      *Student Handbook* \ \
    ]))
    #text(size: 18pt, weight: "bold", [
      #title \
      #text(size: 12pt, [
        #version
      ])
    ])
  ]

  let count = authors.len()
  let ncols = calc.min(count, 3)
  grid(
    columns: (1fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => [
      *#author.name* \
      #text(style: "italic", author.email)
    ]),
  )

  par(justify: false)[
    #v(21pt)
    #smallcaps(
      [
        *Abstract* \ \
      ]
    )
    #abstract
  ]

  pagebreak()
  outline()
  pagebreak()

  set align(left)
  [#doc]
}
