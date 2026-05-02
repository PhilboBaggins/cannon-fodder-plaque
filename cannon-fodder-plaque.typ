
#let names-grid(num-cols, names) = grid(
  align: center + horizon,
  columns: (1fr,) * num-cols,
  rows: 1fr,

  ..for name in names {
    (
      [#name],
    )
  }
)

#let cannon-fodder-plaque(
  num-cols,
  names,
) = {
  set page(
    paper: "a4",
    margin: 8mm,
    background: box(fill: rgb("#000000"), height: 100%, width: 100%),
  )

  set text(fill: white)

  show heading.where(level: 1): it => {
    set text(
      size: 12mm,
      fill: orange,
    )
    it
  }

  let flower = image("flower.png", width: 100%)

  grid(
    align: center + horizon,
    columns: (1fr, 3fr, 10fr, 3fr, 1fr),
    rows: (1fr, 5fr),
    inset: (y: 5mm),

    grid.cell(colspan: 2, flower),
    [= Heroes in Victory],
    grid.cell(colspan: 2, flower),

    [],
    grid.cell(colspan: 3, names-grid(num-cols, names)),
    [],
  )
}

#let names = read("names.txt").split("\n")
#cannon-fodder-plaque(6, names) // 6 x 60
#cannon-fodder-plaque(8, names) // 8 x 45
