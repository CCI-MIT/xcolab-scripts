#!/usr/bin/python3

import os

colabName=input('What is the name of this CoLab? (e.g. "Climate"):')
userName=input('What is the username of the user who will run the CoLab?:')
rootPath=input('What is the absolute path of the root directory of the project? (usually the "home" of the dedicated user):')

fileNameList=[]
for fileName in os.listdir('exec_pre'):
	fileNameList.append('exec_pre/'+fileName)

for fileName in os.listdir('systemd_unit_files'):
	fileNameList.append('systemd_unit_files/'+fileName)

fileNameList.append('colab-permissions')

for fileName in fileNameList:
	with open(fileName, 'r') as file:
		fileData = file.read()
	fileData=fileData.replace('__X__',colabName)
	print('Replaced __X__ with '+colabName)	
	fileData=fileData.replace('__x__',colabName.lower())
	print('Replaced __x__ with '+colabName.lower())
	fileData=fileData.replace('__user__',userName)
	print('Replaced __user__ with '+userName)
	fileData=fileData.replace('__rootPath__',rootPath)
	print('Replaced __rootPath__ with '+rootPath)
	with open(fileName,'w') as file:
		file.write(fileData)

colabUnitFileName='systemd_unit_files/__x__-colab.service'
colabUnitNewName=colabUnitFileName.replace('__x__',colabName.lower())
print('Renamed '+colabUnitFileName+' to '+colabUnitNewName)
os.replace(colabUnitFileName,colabUnitNewName)