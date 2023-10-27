# version: Python3
from DobotEDU import *



magician.ptp(mode=0, x=238, y=30, z=-70, r=0)


magician.wait(second=2)
magician.set_endeffector_suctioncup(enable=True, on=True)
magician.wait(second=3)
#magician.ptp(mode=0, x=214, y=2, z=0, r=0)

magician.ptp(mode=0, x=35, y=200, z=-60, r=0)

magician.set_endeffector_suctioncup(enable=False, on=False)
magician.wait(second=1)

#magician.ptp(mode=0, x=35, y=-187, z=15, r=0)

magician.ptp(mode=0, x=200, y=0, z=50, r=0)