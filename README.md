# CNC Related Tips and Tricks 

## Onefintity or Buildbotics Controller

### To park the spindle into far back-right add this into the Program-End. Any GCode that calls M2 will execute this instead

(Runs on M2, program end)
G0 G53 Z0
G1 G53 X815 Y816 F5000


# Flashing SLB-EXT

- Make sure no remote connection is active or it will fail.
- If everything fail, use the DFU mode by shorting the jumper on the SLB (Refer to Sienci Documentation how to do this)
