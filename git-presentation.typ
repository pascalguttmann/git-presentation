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
#let def-block(body) = block(
  breakable: false,
  width: 100%,
  fill: accent-color,
  inset: 0.5em,
  radius: 0.5em,
  )[#body]

#show raw.where(block: false): box.with(
  fill: luma(240),
  inset: (x: 0.25em, y: 0em),
  outset: (y: 0.25em),
  radius: 0.25em,
)
#show raw.where(block: true): block.with(
  fill: luma(240),
  width: 100%,
  inset: 0.5em,
  radius: 0.5em,
)

#set align(horizon)

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

#slide(title: [A Sincere Confession], new-section: [Why Git?])[
  #side-by-side(columns: (1fr, 2fr))[
    I have been there.

    You too? #emoji.eyes
  ][
    #image("./img/suffix_versioning.png")
  ]
]

#slide(title: [There is Hope!])[
  #side-by-side[
    - Version Control Systems (VCS)
      - Git
      - Subversion
      - Mercurial
      - Bitkeeper
      - ...
  ][
    #figure(
      image(".\img\linus_torvalds.jpeg", height: 75%),
      caption: [Linus Torvalds
      #footnote[Linuxmag.com, December 2002
      https://upload.wikimedia.org/wikipedia/commons/6/69/Linus_Torvalds.jpeg]],
    ) <img_linus_torvalds>
  ]
]

#matrix-slide(columns: (1fr, 2fr, 2fr), rows: (1fr, 1fr))[
  Online Service
][
  - GitHub
  - GitLab
  #image("./img/github_logo.png", width: 50%)
][
  - Youtube
  - DailyMotion
  - AtoPlay
  #image("./img/youtube_logo.png", width: 50%)
][
  Local Application
][
  - Git
  #image(".\img\Git-Logo-2Color.svg", width: 50%)
][
  - VLC Player
  - Windows Media Player
  #image(".\img\vlc_player.png", width: 50%)
]

#accent-focus-slide()[
  = Git
  - local
  - distributed
]

#slide(title: [Repository], new-section: [Git Basics])[
  #side-by-side(columns: (1fr, 1fr))[
    #def-block[
      = Repository \
        - `.git` directory
          - tracked files
          - all versions of files
          - meta data
    ]
  ][
    ```bash
    # initialize a new (empty) repository
    git init
    ```
  ]
]

#slide(title: [Commits])[
  #side-by-side(columns: (1fr, 2fr))[
    #def-block[
      = Commit \
        - "Version" of files in repo
        - Stores `snapshot` of files
        - *No* "delta"
    ]
  ][
    #image(".\img\snapshots.png")
  ]
]

#slide(title: [Staging and Committing])[
  #image("./img/lifecycle.png")
]

#slide(title: [Staging and Committing])[
  ```bash
  git add newFile.txt # adding an untracked file
  git add modifiedFile.txt # staging a modified file
  git add . # adding / staging all files

  git commit -m "My commit message here" # committing
  ```
]

#slide(title: [Staging and Committing])[
  ```bash
  git status # observing the status of the staging area

  git diff # differences (modified <-> unmodified)
  git diff --staged # differences (staged <-> unmodified)

  git log # log of commits
  git log --graph # log + "commit graph"
  git log --patch # log + "patch" (changes)
  ```
]

#accent-focus-slide()[
  = Live Demo !
    - Poems and Code
]

#slide(title: [Branching])[
  #side-by-side(columns: (1fr, 2fr))[
    #def-block[
      = Branch \
        - history of commits
        - can be named
        - can diverge
    ]
    ```bash
    # view branches
    git branch
    ```
  ][
    #image("./img/head-to-master-no-testing.png")
  ]
]

#slide(title: [Branching])[
  #side-by-side(columns: (1fr, 2fr))[
    ```bash
    # create branch testing
    git branch testing
    ```
  ][
    #image("./img/head-to-master.png")
  ]
]

#slide(title: [Branching])[
  #side-by-side(columns: (1fr, 2fr))[
    ```bash
    # switch to branch testing
    git switch testing
    ```
  ][
    #image("./img/head-to-testing.png")
  ]
]

#slide(title: [Branching])[
  #side-by-side(columns: (1fr, 2fr))[
    ```bash
    # commit to branch testing
    git commit -a -m "My experiments"
    ```
  ][
    #image("./img/advance-testing.png")
  ]
]

#slide(title: [Branching])[
  #side-by-side(columns: (1fr, 2fr))[
    ```bash
    # switch to branch master
    git switch master
    ```
  ][
    #image("./img/checkout-master.png")
  ]
]

#slide(title: [Branching])[
  #side-by-side(columns: (1fr, 2fr))[
    ```bash
    # commit to branch master
    git commit -a -m "My other changes"
    ```
  ][
    #image("./img/advance-master.png")
  ]
]

#slide(title: [Branching])[
  #side-by-side(columns: (1fr, 2fr))[
    ```bash
    # commit to branch master
    git commit -a -m "My other changes"
    ```
  ][
    #image("./img/advance-master.png")
  ]
]

#accent-focus-slide()[
  = Live Demo !
    - More Poems and Code
]

#slide(title: [Merging])[
  #side-by-side(columns: (1fr, 2fr))[
    #def-block[
      = Merge \
        - combining branches
    ]
  ][
    #image("./img/code-poem.svg")
  ]
]

#slide(title: [Merging])[
  #side-by-side(columns: (1fr, 1fr))[
    ```bash
    git switch main

    # get changes from 'more_peoms' into main
    git merge more_poems
    ```
  ][
    #image("./img/poems-ff-merge.svg")
  ]
]

#slide(title: [Merging])[
  #side-by-side(columns: (1fr, 1fr))[
    ```bash
    git switch main

    # get changes from 'more_code' into main
    git merge more_code
    ```
  ][
    #image("./img/code-merge.svg")
  ]
]

#accent-focus-slide()[
  = Live Demo !
    - Merging Poems and Code
    - Merge conflict
]
