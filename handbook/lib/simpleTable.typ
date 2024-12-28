#let simpleTable(
  size: 10pt,
  columns: (),
  ..records
) = {
  show table.cell: set text(size: size)
  table(
    align: left,
    fill: (x, y) =>
      if y == 0 {
        gray.lighten(80%)
      },
    columns: columns,
    ..records,
  )
}

#let simpleFloatingTable(
  size: 10pt,
  columns: (),
  caption: [*Caption*],
  ..records
) = {
  show table.cell: set text(size: size)
  figure(
    table(
      align: left,
      fill: (x, y) =>
        if y == 0 {
          gray.lighten(80%)
        },
      columns: columns,
      ..records,
    ),
    caption: caption,
  )
}
