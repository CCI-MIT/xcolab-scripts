#!/usr/bin/python3

import os

colabName=input('What is the name of this CoLab? (e.g. "Climate"):')
rootPath=input('What is the absolute path of the root directory of the project? (usually the "home" of a dedicated user):')

fileNameList=[]
for fileName in os.listdir('exec_pre'):
	fileNameList.append('exec_pre/'+fileName)

for fileName in os.listdir('systemd_unit_files'):
	fileNameList.append('systemd_unit_files/'+fileName)

for fileName in fileNameList:
	with open(fileName, 'r') as file:
		fileData = file.read()
	fileData=fileData.replace('__X__',colabName)
	fileData=fileData.replace('__x__',colabName.lower())
	fileData=fileData.replace('__rootPath__',rootPath)
	with open(fileName,'w') as file:
		file.write(fileData)

colabUnitFileName='systemd_unit_files/__x__-colab.service'
colabUnitNewName=colabUnitFileName.replace('__x__',colabName.lower())
os.replace(colabUnitFileName,colabUnitNewName)