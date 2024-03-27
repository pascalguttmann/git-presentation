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
  - command line interface
]

#slide(title: [Command Line Interface? Really!?])[
  #side-by-side(columns: (1fr, 1fr))[
  There are graphical user interfaces. Choose what you like:
    - https://git-scm.com/downloads/guis

  Git is also integrated in many IDEs:
      - eg. Visual Studio Code #footnote[
        https://code.visualstudio.com/
      ] #footnote[
        https://code.visualstudio.com/docs/sourcecontrol/intro-to-git
      ]
        - recommendation: extension: `GitGraph`
    ][
      #align(center)[
        #image("./img/gui-sourcetree.png")
      ]
    ]
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

#slide(title: [Gitflow])[
  #image("./img/git-flow.svg")
]

#accent-focus-slide()[
  = Live Demo !
    - Merging Poems and Code
    - Merge Conflict
]

#slide(title: [Decentralized Multi-Repository Git])[
  #side-by-side(columns: (1fr, 2fr))[
    #def-block[
      = Remote \
        - upstream repository
        - external (web or local)
    ]
    ```bash
    # Clone an existing repo
    git clone <repository>
    ```
  ][
    #image("./img/remote-branches-1.png")
  ]
]

#slide(title: [Decentralized Multi-Repository Git])[
  #side-by-side(columns: (1fr, 2fr))[
    ```bash
    # do work
    git commit

    # colleagues do work in remote
    ```
  ][
    #image("./img/remote-branches-2.png")
  ]
]

#slide(title: [Decentralized Multi-Repository Git])[
  #side-by-side(columns: (1fr, 2fr))[
    ```bash
    # fetch changes from remote
    git fetch origin
    ```
  ][
    #image("./img/remote-branches-3.png")
  ]
]

#slide(title: [Decentralized Multi-Repository Git])[
  #side-by-side(columns: (1fr, 2fr))[
    ```bash
    # local merge
    git merge origin/master
    ```
  ][
    #image("./img/remote-branches-4.png")
  ]
]

#slide(title: [Decentralized Multi-Repository Git])[
  #side-by-side(columns: (1fr, 2fr))[
    ```bash
    # push changes to remote
    git push origin
    ```
  ][
    #image("./img/remote-branches-5.png")
  ]
]

#accent-focus-slide()[
  = Live Demo !
    - Repositories for Everyone
]

#accent-focus-slide()[
  = GitHub
    - Hosting Git Server Online
    - Collaboration Features
]

#slide(title: [Pull Requests])[
  #side-by-side(columns: (1fr, 2fr))[
    #def-block()[
      = Pull Request \
        - Request to merge changes
        - Review
    ]
  ][
    #align(center)[
      #image("./img/github-pr.png")
    ]
  ]
]

#slide(title: [Code Owners])[
  #side-by-side(columns: (1fr, 2fr))[
    - define owners of file
    - file change: approval of codeowner required
  ][
    #align(center)[
      #image("./img/codeowners.png")
    ]
  ]
]

#accent-focus-slide()[
  = Live Demo !
    - GitHub Website
    - Creating a Pull Request
]

#slide(title: [Force Pushing])[
  #side-by-side[
    - Rewriting history is kind of lying...
      Don't do that. At least try to do it locally. (Squashing, etc)
    - Force pushing is rewriting history on the remote. This will typically
      cause a lot of confusion. Don't do that. #footnote[Conditions apply: Sensitive data
      committed, etc.]
  ][
    #align(center)[
      #image("./img/meme-force-push.jpg")
    ]
  ]
]

#slide(title: [Data Recovery & Sensitive Information], new-section: [Don't Do])[
  - When data #text(red)[*is committed*], it is very hard to completely loose it.
    #footnote[Advanced rescue strategies might be needed.]
  - Do not commit sensitive or personal data. If it happens:
    - remove it yourself
    - ask your administrator for help
]

#slide(title: [Binary Data])[
  - Git itself *can* easily store and merge binary data
    - If not compressible the repository size might increase #footnote[Solution:
      Git Large File System (Git LFS)]
    - Merge conflicts *must* be resolved by you! That is very hard for binary
      data. #footnote[External Diff and Mergetools can by utilized if necessary]
]

#accent-focus-slide[
  = Installation & Setup
]

#slide(title: [Installing Git], new-section: [Installation & Setup])[
  #def-block[
    Installation Help:\
    https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
  ]

  On Linux (using `apt`):
  ```bash
  sudo apt install git-all
  ```

  On Windows:\
  https://git-scm.com/download/win

  On Mac OS:\
  https://git-scm.com/download/mac
]

#slide(title: [Configuration])[
  ```bash
  # setup identity
  git config --global user.name "Max Mustermann"
  git config --global user.email max@domain.de

  # avoid hassle exiting vim
  git config --global core.editor notepad

  # for comfort
  git config --global push.default current
  git config --global push.autoSetupRemote true
  git config --global push.followtags true
  ```
]

#slide(title: [Configuration])[
  ```bash
  # use ssh for GitHub (avoid passwords -> ssh keypair)
  git config --global url.ssh://git@github.com/.insteadof https://github.com/


  # alias `git lg` to print a fancy log
  git config --global alias.lg log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) -  %C(bold cyan)%ah%C(reset) %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
  ```
]

#slide(title: [Setting up GitHub])[
  1. Sign up at: (Select free plan)\
  https://github.com/

  2. Sign into your newly created account:\
  https://github.com/login

  3. Generate ssh key:\
  https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
]

#slide(title: [Setting up GitHub])[
  4. Set up ssh keys:\
  https://docs.github.com/de/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

  5. Test the authentication:\
  https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection
]

#slide(title: [Setting up GitHub])[
  == Generate SSH key
  Start `Git Bash`
  Run command:
  ```bash
  ssh-keygen -t rsa -b 4096 -C "same_email_as_github@example.com"
  ```
  If prompted for file path: Specify or use default with enter.
  If prompted passphrase: Hit enter. (Confirm: enter again).
  #align(center)[
    #image("./img/generate-ssh-key.png")
  ]
]

#slide(title: [Setting up GitHub])[
  #align(center)[
    #image("./img/ssh-key-copy.png")
  ]
]

#slide(title: [Setting up GitHub])[
  == Set up SSH key in GitHub
    1. Settings
    2. SSH and GPG Keys
    3. New SSH key
    4. Give name to key
    5. Paste public SSH key
    6. Confirm
]

#slide(title: [Setting up GitHub])[
  #side-by-side(columns: (1fr, 2fr))[
    #align(center)[
      #image("./img/github-sidebar.png")
    ]
  ][
    #align(center)[
      #image("./img/github-ssh-setting.png")
    ]
  ]
]

#slide(title: [Setting up GitHub])[
  #align(center)[
    #image("./img/github-ssh-paste.png")
  ]
]


#slide(title: [Setting up GitHub])[
  == Test the authentication
  ```bash
  ssh -T git@github.com
  ```

  If "authenticity cannot be established, are you sure you want to continue?"
  Type `yes` and hit enter.
]

#slide(title: [Getting Help])[
  #def-block[
    = Getting Help\
    1. https://git-scm.com/book/en/v2
    2. ```bash git <command> --help # by default opens online help```
    3. https://docs.github.com/en/get-started/start-your-journey
    4. ```bash git help # show commandline help```
    5. https://training.github.com/downloads/github-git-cheat-sheet.pdf
  ]
]
