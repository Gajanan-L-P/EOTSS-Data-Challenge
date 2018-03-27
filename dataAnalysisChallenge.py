#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Mar 27 07:32:59 2018

@author: matyask
"""

import pandas as pd

mortality = pd.read_csv('NCHS_-_Leading_Causes_of_Death__United_States.csv')
education = pd.read_csv('ACS_10_5YR_S1501_with_ann.csv', skiprows=1)
