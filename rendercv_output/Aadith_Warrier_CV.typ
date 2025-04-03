
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Aadith Warrier"
#let locale-catalog-page-numbering-style = context { "Aadith Warrier - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Mar 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.2em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 0, 0)
#let design-section-titles-font-family = "XCharter"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.2em
#let design-section-titles-type = "with-full-line"
#let design-section-titles-vertical-space-above = 0.55cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "XCharter"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = false
#let design-header-name-font-family = "XCharter"
#let design-header-name-font-size = 25pt
#let design-header-name-bold = false
#let design-header-connections-font-family = "XCharter"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = false
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = "|"
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0cm
#let design-highlights-vertical-space-between-highlights = 0.19cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.3em
#let design-entries-vertical-space-between-entries = 0.4cm
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = false
#let design-links-underline = true
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Aadith Warrier

// Print connections:
#let connections-list = (
  [Hyderabad, India],
  [#box(original-link("mailto:warrieraadith@gmail.com")[warrieraadith\@gmail.com])],
  [#box(original-link("https://github.com/aadith-warrier")[github.com\/aadith-warrier])],
)
#connections(connections-list)



== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Birla Institute of Technology and Science], B.E in Mechanical Engineering -- Pilani
  ],
  right-content: [
    Nov 2021 – July 2025
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([8.13\/10 CGPA],[#strong[Coursework:] Autonomous Mobile Robotics, Computer Programming, Vibrations and Control],[Mechanical Team Lead at CRISS Robotics],[Member of Association for Computing Machinery, BITS Pilani Chapter],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Maharishi Vidya Mandir], Grade XII -- Chennai
  ],
  right-content: [
    May 2019 – May 2021
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([95.8\/100 aggregate],[#strong[Coursework:] Physics, Chemistry, Math, Computer Science],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[The PSBB Millennium School], Grade X -- Chennai
  ],
  right-content: [
    May 2015 – May 2019
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([94.8\/100 aggregate],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Research Experience


#two-col-entry(
  left-content: [
    #strong[Research Intern], Robotics Research Center, IIIT-H -- Hyderabad
  ],
  right-content: [
    Dec 2024 – present
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Advisor - Prof. Madhava Krishna],[Pursuing my bachelor thesis on extending foundational computer vision models to robotics],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Undergraduate Researcher], INSPIRE Lab -- Pilani, India
  ],
  right-content: [
    Apr 2024 – Dec 2024
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Advisor - Prof. Avinash Gautam],[Implemented autonomous frontier navigation on a ground robot using ROS and Visual SLAM.],[Designed and validated the blueprint for a low-cost fully autonomous drone.],[Developed simulations of the software stack for autonomous flight using PX4, ROS2, and Gazebo.],[Developed a technique to efficiently choose images for VLM inference using ORB and CLIP feature comparisions],[Researching techniques for rendezvous based multi-robot exploration in communication constrained environments],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Research Intern], Indira Gandhi Center for Atomic Research -- Kalpakkam, India
  ],
  right-content: [
    June 2023 – July 2023
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Designed a visual inspection tool for hard-to-reach regions with robotic soft actuators using CAD software.],[Achieved a reduction in size of the actuator, enabling traversal of tighter bends and smaller tubes.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Undergraduate Researcher], MultiCog Lab -- Pilani, India
  ],
  right-content: [
    Oct 2022 – Apr 2024
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Advisor - Prof. Pratik Narang],[Developed an efficient pipeline using deep learning to detect and enhance low visibility conditions in drone images.],[Implemented object detection methods for distress detection on roads and image segmentation to quantify them.],[Collaborated with a team of civil engineers to develop metrics to help authorities prioritize repair work.],)
  ],
)



== Publications


#two-col-entry(
  left-content: [
    #strong[Attention-Enabled Deep Neural Network for Enhancing UAV-Captured Pavement Imagery in Poor Visibility]

  ],
  right-content: [
    Aug 2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);C. Kapoor, #strong[#emph[A. Warrier]], M. Singh, P. Narang, H. Puppala, S. Rallapalli, A. Singh

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1109/MIPR59079.2023.00014")[10.1109/MIPR59079.2023.00014]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Fast and Lightweight UAV-based Road Image Enhancement Under Multiple Low-Visibility Conditions]

  ],
  right-content: [
    Mar 2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);C. Kapoor, #strong[#emph[A. Warrier]], M. Singh, P. Narang, H. Puppala, S. Rallapalli, A. Singh

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1109/PerComWorkshops56833.2023.10150374")[10.1109/PerComWorkshops56833.2023.10150374]])



== Projects



#one-col-entry(
  content: [
    #strong[CRISS Robotics \(College Robotics Team\)] 

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([#strong[Mechanical Systems Lead:] responsible for design and manufacturing of the rover and integration between the mechanical, electrical and software systems],[Designed and fabricated a prototype Mars Rover with four wheel differential drive and a 5DoF Manipulator],[Placed first at the International Rover Design Challenge and eleventh at the International Rover Challenge],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[ROS2 simulation package for Firebird-VI] 
  ],
  right-content: [
    #link("https://github.com/aadith-warrier/firebird-vi")[github]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([SDF model for the Firebird-VI with simulation using Gazebo],[RTAB Mapping with a OakD-Lite RGBD sensor],[Autonomous Navigation using Nav2],[Tools Used - ROS2, Gazebo, Nav2, RTAB-Map],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Autonomous low-cost Quadcopter] 

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Custom low-cost autonomous quadcopter built using off-the-shelf components],[Secured a grant of INR 50,000 from the Academic Under Studies Division, BITS Pilani],[Tools Used - ROS, PX4 Autopilot, RTAB-Map],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Deep Learning Architectures] 
  ],
  right-content: [
    #link("https://github.com/aadith-warrier/ML")[github]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Implementation of a CNN and UNet],[Tools Used - Python, PyTorch, Matplotlib],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Reinforcement Learning Library] 
  ],
  right-content: [
    #link("https://github.com/aadith-warrier/RL")[github]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Implementation of reinforcement learning algorithms like Deep Q-Learning with OpenAI Gym],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Simulation of Compressible Supersonic Flow through a RamJet Engine] 

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Tools Used- SU2, Gmsh],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Lazy Profile Manager] 

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([A simple python script that keeps your CV and website updated using data from a .yaml file for profile information and a .bib file for publications],)
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Languages:] C++, C, Python, LaTeX]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Frameworks and Libraries:] ROS\/ROS2 \(Nav2 and RTAB-Map\), Gazebo, Pytorch, Numpy, Matplotlib, OpenAI Gym]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Technologies:] 3D Printing, Metal Fabrication, Laser Cutting, CNC Machining]
)


