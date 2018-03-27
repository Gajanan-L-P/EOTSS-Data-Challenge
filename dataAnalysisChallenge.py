#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Mar 27 07:32:59 2018

@author: matyask
"""

import pandas as pd

mortality = pd.read_csv('NCHS_-_Leading_Causes_of_Death__United_States.csv')
education = pd.read_csv('ACS_10_5YR_S1501_with_ann.csv', skiprows=1) #first row is unnecessary

disease = mortality[mortality['Cause Name'] == 'Stroke']
disease = disease[disease['Year'] == 2010]
disease = disease.set_index('State')
disease = disease.drop(['Year','113 Cause Name'],axis=1)

indexList = [2,3] + list(range(9,51,6))
educationAttain = education.iloc[:,indexList]
educationAttain = educationAttain.set_index('Geography')
