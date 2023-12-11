
...

class Jog(inevent.JogHandler):
    def __init__(self, ctrl):
        self.ctrl = ctrl
        self.log = ctrl.log.get('Jog')

        config = {
            "Logitech Logitech RumblePad 2 USB": {
                "deadband": 0.1,
                "axes":     [ABS_X, ABS_Y, ABS_RZ, ABS_Z],
                "dir":      [1, -1, -1, 1],
                "arrows":   [ABS_HAT0X, ABS_HAT0Y],
                "speed":    [0x120, 0x121, 0x122, 0x123],
                "lock":     [0x124, 0x125],
            },

            "default": {
                "deadband": 0.1,
                "axes":     [ABS_X, ABS_Y, ABS_RZ, ABS_RX],
                "dir":      [1, -1, -1, 1],
                "arrows":   [ABS_HAT0X, ABS_HAT0Y],
                "speed":    [0x133, 0x130, 0x131, 0x134],
                "lock":     [0x136, 0x137],
            }
        }

...