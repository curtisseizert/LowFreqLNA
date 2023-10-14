

import re
from str_utils import before, after

s_header = 0
s_apertures = 1
s_body = 2
s_end = 3


class Gerber:

    def __init__(self, file=None):
        self.header = []
        self.apertures = []
        self.commands = []

        self.conv = 1
        self.format = [6,4]
        if file:
            self.read_file (file)

    def read_file (self, file):
        with open(file) as f:
            gerber_data = f.read().split('\n')

        self.format = [6,4]
        self.conv = 1 # assume mm

        # start with the header
        state = s_header
        attributes = []
        for line in gerber_data:
            if state == s_header:

                if line.startswith ("G04 APERTURE LIST"):
                    state = s_apertures
                else:
                    self.header.append (line)
                    if line.startswith ("%FS"):
                        # %FSLAX46Y46*%
                        num = re.findall (r"\d+", line)
                        if num:
                            x = int(num[0])
                            self.format = [x//10, x % 10]

                    elif line.startswith ("%MOIN"):
                        self.conv = 25.4

                    elif line.startswith ("%MOMM"):
                        self.conv = 1


            elif state == s_apertures:
                if line.startswith ("G04 APERTURE END LIST"):
                    #self.commands.append (line)
                    state = s_body
                elif line.startswith ("%ADD"):
                    # %ADD14C
                    token = after(line, "%ADD")
                    num = re.findall (r"\d+", line)
                    if num:
                        num = int(num[0])

                    self.apertures.append ([num, line, attributes] )

                elif line.startswith ("G04 #@! TA"):
                    attributes.append (after(line, "TA"))
                elif line.startswith ("G04 #@! TD"):
                    attributes = []

            elif state == s_body:

                if line == "M02*":
                    state = s_end
                else:
                    self.commands.append (line)

            elif state == s_end:
                pass

    def write_file (self, filename):
        output_data = []
        output_data.extend (self.header)

        output_data.append("G04 APERTURE LIST*")
        for num, desc, attribs, old_num in self.apertures:
            if attribs:
                for attrib in attribs:
                    output_data.append ("G04 #@! TA" + attrib)
            
            if old_num:
                desc = desc.replace (str(old_num), str(num), 1)

            output_data.append (desc)

            if attribs:
                output_data.append ("G04 #@! TD*")

        output_data.append("G04 APERTURE END LIST*")

        output_data.extend (self.commands)

        output_data.append ("M02*\n")

        with open(filename, "w") as f:
            f.write('\n'.join(output_data))


    def add_aperture (self, aperture):
        num = aperture[0]

        for a in self.apertures:
            if a[0] == num:
                num += 1

        new_aperture = [num, aperture[1], aperture[2], aperture[0] ]
        self.apertures.append (new_aperture)
        return new_aperture


    def add_layer (self, other, positive=True):
        if not self.header:
            self.header.extend (other.header)

        new_apertures = []
        for aperture in other.apertures:
            new_apertures.append (self.add_aperture (aperture))

        #self.apertures.extend (new_apertures)

        if positive:
            self.commands.append ("%LPD*%")
        else:
            self.commands.append ("%LPC*%")

        for command in other.commands:
            if command.startswith ("D"):
                num = re.findall (r"\d+", command)
                if num:
                    num = int(num[0])
                ap = [a for a in new_apertures if a[3] == num]

                command = command.replace (str(num), str(ap[0][0]), 1)

            self.commands.append (command)
