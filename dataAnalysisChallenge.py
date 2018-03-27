#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Mar 27 11:32:59 2018

@author: matyask
"""

import pandas as pd
import matplotlib.pyplot as plt
from scipy import stats

mortality = pd.read_csv('NCHS_-_Leading_Causes_of_Death__United_States.csv')
education = pd.read_csv('ACS_10_5YR_S1501_with_ann.csv', skiprows=1) #first row is unnecessary

# since education dataset covers 2010, extract only data from 2010 on stroke
disease = mortality[mortality['Cause Name'] == 'Stroke']
disease = disease[disease['Year'] == 2010]
disease = disease.set_index('State')
disease = disease.drop(['Year','113 Cause Name'],axis=1)

# exclude a lot of unnecessary collums
indexList = [2,3] + list(range(9,51,6))
educationLvl = education.iloc[:,indexList]
educationLvl = educationLvl.set_index('Geography')

# merge the datasets with inner join
educationDisease = educationLvl.merge(disease, left_index=True, right_index=True)

print(stats.pearsonr(educationDisease["Total; Estimate; Bachelor's degree"],educationDisease['Age-adjusted Death Rate']))

#sort the values for graph to be more legible (solution for correct sorting (due to bug) found on https://stackoverflow.com/questions/47373762/pyplot-sorting-y-values-automatically)
educationDisease.sort_values('Age-adjusted Death Rate', inplace=True)

color1 = 'tab:red'
fig, ax1 = plt.subplots(figsize=(19,10))
ax1.set_xlabel('State')
plt.xticks(range(len(educationDisease.index)), educationDisease.index,rotation=90)
ax1.set_ylabel('Death rate by Stroke', color=color1)
ax1.bar(range(len(educationDisease.index)), educationDisease['Age-adjusted Death Rate'], color=color1)
ax1.tick_params(axis='y', labelcolor=color1)

ax2 = ax1.twinx()

color2 = 'tab:cyan'
ax2.set_ylabel('Education', color=color2)
ax2.plot(range(len(educationDisease.index)), educationDisease["Total; Estimate; Bachelor's degree"], marker='o', linestyle='None', color=color2)
ax2.tick_params(axis='y', labelcolor=color2)

fig.tight_layout()
fig.savefig('graph.png')
plt.show()
