// START OVERWRITE - BELOW WILL BE OVERWRITTEN BY ASTRO

/** This is my main portrait. */
#let portrait(..args) = image("../../public/head-shot.jpg", format: "jpg", ..args);

/** The color's we'll be using to make this CV. */
#let colors = (
  "base00": "#303446",
  "base01": "#414559",
  "base02": "#51576d",
  "base03": "#737994",
  "base04": "#a5adce",
  "base05": "#c6d0f5",
  "base06": "#f2d5cf",
  "base07": "#babbf1",
  "base08": "#e78284",
  "base09": "#ef9f76",
  "base0A": "#e5c890",
  "base0B": "#a6d189",
  "base0C": "#81c8be",
  "base0D": "#8caaee",
  "base0E": "#ca9ee6",
  "base0F": "#eebebe",
);

#let projects = (
  (
    repo: "NixOS",
    user: "Tygo-van-den-Hurk",
    desc: lorem(50),
  ),
  (
    repo: "QMix",
    user: "Tygo-van-den-Hurk",
    desc: lorem(50),
  ),
  (
    repo: "Slyde",
    user: "Tygo-van-den-Hurk",
    desc: lorem(50),
  ),
);

#let education = (
  (
    "name": "Masters in Embedded Systems",
    "description": "Technical University Eindhoven",
    "location": "Eindhoven, the Netherlands",
    "start_date": datetime(
      year: 2026,
      month: 8,
      day: 2,
    ),
    "end_date": datetime(
      year: 2026,
      month: 8,
      day: 4,
    ),
  ),
  (
    "name": "Masters in Computer Science",
    "description": "Technical University Eindhoven",
    "location": "Eindhoven, the Netherlands",
    "start_date": datetime(
      year: 2026,
      month: 8,
      day: 2,
    ),
    "end_date": datetime(
      year: 2026,
      month: 8,
      day: 4,
    ),
  ),
  (
    "name": "Bachelor in Computer Science",
    "description": "Technical University Eindhoven",
    "location": "Eindhoven, the Netherlands",
    "start_date": datetime(
      year: 2021,
      month: 8,
      day: 3,
    ),
    "end_date": datetime(
      year: 2026,
      month: 7,
      day: 3,
    ),
  ),
  (
    "name": "High School (VWO)",
    "description": "Titus Brandsma Lyceum",
    "location": "Oss, the Netherlands",
    "start_date": datetime(
      year: 2015,
      month: 8,
      day: 2,
    ),
    "end_date": datetime(
      year: 2021,
      month: 5,
      day: 3,
    ),
  ),
  (
    "name": "Primary School",
    "description": "Emmaus",
    "location": "Heesch, the Netherlands",
    "start_date": datetime(
      year: 2007,
      month: 1,
      day: 3,
    ),
    "end_date": datetime(
      year: 2015,
      month: 5,
      day: 2,
    ),
  ),
);


#let career = (
  (
    "name": "Ultra Commerce",
    "description": "Full-Stack Developer",
    "location": "Eindhoven, the Netherlands",
    "start_date": datetime(
      year: 2025,
      month: 7,
      day: 24,
    ),
    "end_date": datetime(
      year: 2026,
      month: 1,
      day: 28,
    ),
  ),
  (
    "name": "Ultra Commerce",
    "description": "Study Case and Internship",
    "location": "Eindhoven, the Netherlands",
    "start_date": datetime(
      year: 2025,
      month: 1,
      day: 24,
    ),
    "end_date": datetime(
      year: 2025,
      month: 7,
      day: 24,
    ),
  ),
  (
    "name": "Areo Team Eindhoven",
    "description": "Student Team, External Affairs",
    "location": "Eindhoven, the Netherlands",
    "start_date": datetime(
      year: 2023,
      month: 3,
      day: 1,
    ),
    "end_date": datetime(
      year: 2024,
      month: 5,
      day: 30,
    ),
  ),
  (
    "name": "Amac",
    "description": "Junior Sales Associate",
    "location": "Oss, the Netherlands",
    "start_date": datetime(
      year: 2022,
      month: 5,
      day: 1,
    ),
    "end_date": datetime(
      year: 2023,
      month: 3,
      day: 30,
    ),
  ),
  (
    "name": "Jumbo",
    "description": "Cashier, restocker",
    "location": "Heesch, the Netherlands",
    "start_date": datetime(
      year: 2020,
      month: 1,
      day: 1,
    ),
    "end_date": datetime(
      year: 2022,
      month: 4,
      day: 30,
    ),
  ),
);

#let competencies = (
  tools: (
    "Git",
    "Nix",
    "Containerization",
    "Linux",
    "(RT)OSes",
    "POSIX shells",
    "Cloudflare Workers",
    "ESP32",
    "Node.js",
    "Astro",
    "KiCad",
  ),
  skills: (
    "Embedded Systems",
    "Real-Time Systems",
    "Concurrency",
    "Operating Systems",
    "CI/CD",
    "Unit testing",
    "Documentation",
    "PCB design",
    "Functional Programming",
    "Object Oriented Programming",
  ),
  languages: (
    "Rust",
    "TypeScript",
    "Nix",
    "Shell Script",
    "Java",
    "C",
    "Python",
  ),
);

// END OVERWRITE - ABOVE WILL BE OVERWRITTEN BY ASTRO

#show heading.where(level: 1): set text(font: "Old Standard TT");
#show heading.where(level: 2): set text(font: "Old Standard TT");

#set page(paper: "a4", margin: 0em);
#set page(fill: rgb(colors.base00));
#set text(fill: rgb(colors.base04));
#set text(font: "Source Serif Pro");
#set text(weight: "regular");

/** Creates a level 2 header. */
#let h2(..args) = text(
  fill: rgb(colors.base05),
  heading(level: 2, ..args),
);

/** Creates a line. */
#let line(
  color: rgb(colors.base05),
  height: .08em,
  width: 100%,
  ..args,
) = box(
  stroke: height + color,
  width: width,
  height: 0em,
);

/** Maps a number to a month string. Used for entries*/
#let month_map = (
  none, // In Typst months in dates start at 1 not 0.
  "Jan", "Feb", "Mar", "Apr", "May", "Jun",
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
);

/** An entry is a job I worked at, or an education I followed. */
#let entry(instance, first: false, last: false) = box(
  width: 100%,
  {
    if not first {box(width: 100%, height: 0.1em)}
    grid(
      columns: (1em, 1fr),
      {
        stack(
          box(
            inset: (top: 0.12em),
            circle(
              radius: 0.2em,
              stroke: rgb(colors.base05),
              fill: rgb(colors.base07),
            ),
          ),
          if not last {
            box(
              inset: (left:0.2em),
              place(
                top + center,
                box(
                  width: 0em,
                  height: 11em,
                  stroke: rgb(colors.base05),
                )
              )
            )
          },
        )
      },
      {
        text(
          fill: rgb(colors.base05),
          heading(level: 3, instance.name),
        );
        upper(instance.description);
        linebreak();
        text(instance.location);
        linebreak();

        let s_y = instance.start_date.year();
        let e_y = instance.end_date.year();
        let s_m = month_map.at(instance.start_date.month());
        let e_m = month_map.at(instance.end_date.month());

        let day_matches = instance.end_date.day() == datetime.today().day();
        let month_matches = instance.end_date.month() == datetime.today().month();
        let year_matches = instance.end_date.year() == datetime.today().year();

        if day_matches and month_matches and year_matches {
          [#s_m #s_y - Present]
        } else {
          [#s_m #s_y - #e_m #e_y]
        }
      },
    );
  },
)

/** Converts a project to content */
#let project(instance) = box(width: 100%, inset: 0.5em, {
  align(center, 
    text(
      fill: rgb(colors.base05),
      weight: "bold",
      heading(level: 3, {
        metadata(instance.repo);
        if lower(instance.user) != "tygo-van-den-hurk" { 
          text(fill: rgb(colors.base0D), link(
            "https://github.com/" + instance.user,
            if lower(instance.user) == "tygo-van-den-hurk" {
              "Personal"
            } else if lower(instance.user) == "homelab-tygo-van-den-hurk" {
              "HomeLab"
            } else if lower(instance.user) == "school-tygo-van-den-hurk" {
              "School"
            } else if lower(instance.user) == "legacy-tygo-van-den-hurk" {
              "Legacy"
            } else {
              instance.user
            }
          ));
          [ \/ ];
        }
        text( fill: rgb(colors.base0D), link(
          "https://github.com/" + instance.user + "/" + instance.repo,
          instance.repo
        ));
      },
    ),
  ));
  par(justify: true, instance.desc);
});

/** The left side of the PDF */
#let aside = box(
  fill: rgb(colors.base01),
  height: 100%,
  width: 18em,
  inset: (x: 1em, top: 2.25em),
  {
    align(center, box(
      clip: true,
      radius: 2.5cm,
      width: 5cm,
      height: 5cm,
      move(
        dy: 0em,
        portrait(
          width: 100%,
          height: 6cm,
          fit: "cover",
        ),
      ),
    ));

    text(
      fill: rgb(colors.base05),
      size: 13pt,
      align(center, 
        heading(
          level: 1,
          [Tygo van den Hurk]
        ),
      ),
    );
    line();
    upper(align(center, strong[Software Engineer]));

    box(width: 100%, height: 1em);
    align(center, h2[General Information]);
    line();
    grid(
      columns: (auto, auto),
      column-gutter: 0.3em,
      row-gutter: 0.7em,
      align(right, upper[*Location*: ]),
      align(left, [Eindhoven, NL /*, the Netherlands*/]),
      align(right, upper[*Site*: ]),
      align(left, text(fill: rgb(colors.base0D), link(
        "https://tygo.van.den.hurk.dev/",
        "tygo.van.den.hurk.dev",
      ))),
      align(right, upper[*Linkedin*: ]),
      align(left, text(fill: rgb(colors.base0D), link(
        "https://redirects.tygo.van.den.hurk.dev/linkedin",
        "Tygo van den Hurk",
      ))),
      align(right, upper[*GitHub*: ]),
      align(left, text(fill: rgb(colors.base0D), link(
        "https://redirects.tygo.van.den.hurk.dev/github/personal",
        "Tygo-van-den-Hurk",
      ))),
    );
    
    box(width: 100%, height: 1em);
    align(center, h2[Tools]);
    line();
    par(
      justify: true, 
      competencies.tools.join([*,* ], last: [*,* and ]),
    );

    box(width: 100%, height: 1em);
    align(center, h2[Programming Languages]);
    line();
    par(
      justify: true, 
      competencies.languages.join([*,* ], last: [*,* and ]),
    );

    box(width: 100%, height: 1em);
    align(center, h2[Skills]);
    line();
    par(
      justify: true, 
      competencies.skills.join([*,* ], last: [*,* and ]),
    );
  },
);

/** The main content of the PDF */
#let main = box(inset: 1em, columns(2,
  gutter: 1em, 
  {
    align(center, h2[Education]);
    line();
    grid(
      columns: (1fr,),
      ..education.enumerate().map(((index, instance)) =>
        entry(instance, 
          last: index == education.len() - 1,
          first: index == 0,
        ),
      ),
    );

    box(width: 100%, height: .25em);
    align(center, h2[Projects]);
    line();
    projects.fold([], (prev, instance) => prev + project(instance));

    box(width: 100%, height: .25em);
    align(center, h2[Experience]);
    line();
    grid(
      columns: (1fr,),
      ..career.enumerate().map(((index, instance)) =>
        entry(instance, 
          last: index == education.len() - 1,
          first: index == 0,
        ),
      ),
    );

    box(width: 100%, height: .25em);
    align(center, h2[Notice]);
    line();
    {
      set par(justify:  true);
      let today = datetime.today();
      let year = today.year();
      let month = month_map.at(today.month());
      let day = if (1, 21, 31).contains(today.day()) {
        [#today.day()st]
      } else if (2, 22).contains(today.day()) {
        [#today.day()nd]
      } else if (3, 23).contains(today.day()) {
        [#today.day()rd]
      } else {
        [#today.day()th]
      };
      [
        This document was compiled on the #day of #month. #year. an up to date
        document is compiled weekly. For an updated version visit #text(
          fill: rgb(colors.base0D), link(
          "https://tygo.van.den.hurk.dev/curriculum-vitae.pdf",
          "my website",
        ));.
      ]
    }
  },
));

#grid(
  columns: (18em, 1fr),
  gutter: (0em, 1em),
  aside,
  main,
);

// Renders the next page in the base16 colors for inspection.
#if false {
  pagebreak(weak: false);
  let rectangle(..args) = box(..args, width: 100%, height: 25%);
  let txt = {
    {
      set text(font: "Old Standard TT");
      linebreak();
      strong[Old Standard TT];
      linebreak();
      [Old Standard TT];
      linebreak();
      emph[Old Standard TT];
      linebreak();
      strong(emph[Old Standard TT]);
    };
    linebreak();
    {
      set text(font: "Source Serif Pro");
      linebreak();
      strong[Source Serif Pro];
      linebreak();
      [Source Serif Pro];
      linebreak();
      emph[Source Serif Pro];
      linebreak();
      strong(emph[Source Serif Pro]);
    };
    linebreak();
    {
      set text(font: "Libertinus Serif");
      linebreak();
      strong[Libertinus Serif];
      linebreak();
      [Libertinus Serif];
      linebreak();
      emph[Libertinus Serif];
      linebreak();
      strong(emph[Libertinus Serif]);
    };
  };

  grid(
    columns: 4, rows: 4,
    rectangle(fill: rgb(colors.base00), txt),
    rectangle(fill: rgb(colors.base01), txt),
    rectangle(fill: rgb(colors.base02), txt),
    rectangle(fill: rgb(colors.base03), txt),
    rectangle(fill: rgb(colors.base04), txt),
    rectangle(fill: rgb(colors.base05), txt),
    rectangle(fill: rgb(colors.base06), txt),
    rectangle(fill: rgb(colors.base07), txt),
    rectangle(fill: rgb(colors.base08), txt),
    rectangle(fill: rgb(colors.base09), txt),
    rectangle(fill: rgb(colors.base0A), txt),
    rectangle(fill: rgb(colors.base0B), txt),
    rectangle(fill: rgb(colors.base0C), txt),
    rectangle(fill: rgb(colors.base0D), txt),
    rectangle(fill: rgb(colors.base0E), txt),
    rectangle(fill: rgb(colors.base0F), txt),
  )
}