#!/bin/python


import xml.etree.ElementTree as ET, subprocess, sys, os

os.chdir(os.path.dirname(__file__))


root = ET.fromstring(open('menu.xml').read().replace('xmlns','xmlns_off',1))

run_label = sys.argv[1] if len(sys.argv) == 2 else None

for e in root.find('.//menu[@id="root-menu"]').iterfind('.//item'):
 label = e.attrib['label'].replace('_', '')
 if run_label:
  if run_label == label:
   command = e.find('.//execute').text
   subprocess.Popen(command.split(), stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
 else:
  print(label)
