# Module 2: Data Analytics & Visualization
## Overview
### Learning goals
- Examine role of visualization for data exploration and communication
- Understand and use key visual variables and design principles
- Assess plots for clarity, accuracy, and accessibility
- Select the right visualization types for different data and analytical questions
### Key terms and definitions
- Quantitative variable: Measured numerically and used for arithmetic comparisons, such as trip duration or temperature
- Qualitative variable: Represents categories or groups rather than numeric values, such as user type or station name
- Data frame: Structured table of data, observations of variables
Visual encoding: Mapping data variables to visual elements, such as position, size, shape, colour, or texture
- Visual variable: A graphical element that visually represents data values
- Perceptual rankings: A hierarchy of visual channels showing which encodings are easiest to interpret accurately for quantitative or qualitative data
- Chart components:: Supporting elements of a chart
- Relational plots: Visualizations that show relationships between two or more variables
- Bar charts: Display data using rectangular bars to compare quantities across categories, including grouped or stacked variations
- Area charts: Represent data values as filled areas under a line, often used to show cumulative or comparative trends over time
- Histograms: Divide data into bins to show distribution of a single quantitative variable
- Kernel density plots: Smooth estimates of a variable’s distribution, often used to compare patterns across subgroups

## Key takeaways
Most common data processing and analysis operations:
- Filtering out irrelevant records
- Sorting data meaningfully
- Joining multiple datasets
- Handling missing information
- Computing summary statistics
- Applying analytic approaches like grouping, calculating metrics, or smoothing time-series

Consider the quality and uncertainty of the data:
- Check assumptions of the data
- Document all choices made
- Communicate uncertainty alongside results

Guiding questions for creating data visualizations:
- How should data be represented visually?
- How will viewers perceive it?
- How can visualizations communicate context and meaning?

There is a visual hierarchy in the way the human brain processes information (preattentive processing). The main ways of visual communication are: colour, form, size, orientation, and contrast.

Visual hierarchy of identity channels:
1. Spatial region
2. Colour hue
3. Motion
4. Shape

Visual hierarchy of magnitude channels:
1. Position on a common scale
2. Position on an unaligned scale
3. Length
4. Tilt
5. Area
6. Depth
7. Colour luminance or saturation
8. Curvature and volume

Tips on improving visual accessibility:
1. Use sufficient colour contrast
2. Don't rely on colour alone
3. Choose accessible colour palettes
4. Label clearly and directly
5. Maintain readability
6. Simplify visual clutter
7. Provide alt formats

Data exploration framework, flexible:
1. Visualize data to get a sense of patterns
2. Reflect on what stands out: outliers, clusters, or trends
3. Refine approach: filter, transform, or group data differently
4. Repeat process, deepen understanding

Types of visualizations
- Relational plots: Show how two or more variables relate
- Bar charts: Compare categories or group side-by-side
- Area charts: Highlight change over time and cumulative totals
- Histograms: Display how values are distributed across a range
- Kernel density plots: Smooth distributions to reveal patterns more clearly
- Small multiples: Repeated charts to compare different groups
- Other charts, like box plots, heatmaps, and maps: Uncover structure and relations

Charts and their use
- Bar charts (bar, grouped bar, stacked bar)
  - Compare quantities across discrete categories
- Parts of a whole (pie, donut, stacked bar)
  - Show how categories contribute to a total
  - Donut is a visually improved pie chart
  - Stacked bar is better when there are more categories
- Distribution (histogram, kernel density plots, box plots, violin plots)
  - Understand how values are spread across the dataset
  - Histograms separate observations into bins
  - Kernel density plots estimate a continuous curve of the distribution
  - Box plots summarize the median, quartiles, and potential outliers
  - Violin plots combine a box plot and rotated kerney density plot
- Relational charts (line, scatter, area, heat)
  - Explore how variables relate to eachother
  - Line charts emphasize change over an interval
  - Scatter plots show association between variables
  - Area charts show quantity accumulation over an interval
  - Heat maps reveal patterns between two dimensions
- Other charts (bubble, timeline/gantt, sankey, network, small multiples)
  - Bubble chart shows relationships with 3 variables (x, y, size)
  - Timeline/gantt shows events over time
  - Sankey diagram shows flor or redistribution between categories
  - Network graph shows relationships or connectivity between entities
  - Small multiples use repeated graphs for each category

Influences on chart choice:
- Type of data: categorical or continuous
- Number of variables to display
- Level of detail desired
- Goal of the visualization: communicate insights or explore

Common chart tasks
- Comparing categories
  - Bar or dot plots are cleaner for comparisons across groups
- Showing relationships between variables
  - Scatter plots or line charts can reveal correlations/trends over time
  - Stacked area charts show contributions to a total amount across periods
- Highlighting distribution
  - Histograms, box plots, and violin plots show variation, outliers, and skewness

Chart design framework:
1. Understand the data
   1. Which variables are quantitative, categorical, or ordinal?
   2. How many variables are you using?
2. Know your audience
   1. How much complexity can be added without making a chart difficult to understand?
3. Clarify your message
   1. What is the goal of the chart?
   2. Ex. exploration, comparison, relationship detection, or storytelling
4. Avoid misleading visuals
   1. Could the selected chart mislead your audience?
   2. Does the chart exaggerate differences or hide patterns?
   3. Ex. pie charts with too many slices, 3D effects, inappropriate axes
5. Iterate and test
   1. Which other chart types could better meet this criteria?

