#EOTSS Data Challenge

# Data Analysis
## Looking for Datasets
I searched for the first dataset on data.gov, where I looked for interesting health data. The most interesting one was NCHC's [dataset](https://catalog.data.gov/dataset/age-adjusted-death-rates-for-the-top-10-leading-causes-of-death-united-states-2013) on leading causes of death. This dataset contains data on number deaths that the 10 deadliest diseases caused in each state from 1999 to 2015. It also contains the age-adjusted death rate, which is great for running analyses, since it accounts for the age of people living in each state and it is per 100,000 people.

I had to find other dataset and combine the two to find something interesting. I thought it might be cool to find whether any disease is more prevalent in areas with lower level of education. After a bit of looking for data with Education Attainment, I found a good dataset on the Cencus Bureau's [American FactFinder](https://factfinder.census.gov/faces/nav/jsf/pages/searchresults.xhtml?refresh=t). I used the 2010 data since that one should be the most accurate. This dataset contains the maximum level of education completed by population that is 25 years or older. It also contains information about race and many other things that I did not need to use in this analysis.

## Finding interesting stuff
I tried to run Pearsons Correlation with different diseases and their correlation to the education level. Turns out that **Stroke** has the best correlation to education level. It is **negatively correlated**, which means that the lower the education, the higher the chance of dying on stroke.

The graph shows that the more the people who have Bachelor's degree in a particular state, the less death because of stroke happened in the state.

![Image](https://github.com/MatyasKonig/EOTSS-Data-Challenge/blob/master/graph.png?raw=true)
