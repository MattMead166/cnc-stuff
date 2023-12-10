# CNC Related Tips and Tricks 

## Onefintity or Buildbotics Controller

### To park the spindle into far back-right add this into the Program-End. Any GCode that calls M2 will execute this instead

(Runs on M2, program end)
G0 G53 Z0
G1 G53 X815 Y816 F5000
