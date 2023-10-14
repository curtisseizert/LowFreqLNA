#!/usr/bin/env python2
# -*- coding: ascii -*-
"""
<module> - <short description>

<long description>

Usage:    See -h

1. Start a command prompt or terminal window
2. Run the script with
       python gerber_combine.py <gerber file> ...

    e.g.
       python gerber_combine.py ktest4-F.Cu.gbr -s ktest4-Cmts.User.gbr -o ktest4-merged.gbr


Authors:  Bob Cousins

License:  GPL 3.0

Copyright Bob Cousins 2018

"""

__author__ = 'Bob Cousins'
__copyright__ = 'Copyright 2018 Bob Cousins'
__license__ = 'GPL 3.0'
__version__ = '0.1.0'

appname = "gerber_combine"

#imports
import os
import argparse
import sys
import re
import math

import geometry2d
from str_utils import before, after
import file_util

import gerber


def read_config (path):
    with open(path) as f:
        config = f.read().split('\n')

    return config

def write_config (path, config):
    with open(path, "w") as f:
        f.write('\n'.join(config))

def add_pilot_holes (drill, gerber):
    
    if args.verbose:
        print ("reading drill file %s" % drill)

    drill_data = read_config (drill)

    holes = []

    seen_start = False
    conv = 25.4
    for line in drill_data:
        if line.startswith ("%"):
            seen_start = True
        elif line.startswith ("INCH"):
            conv = 25.4
        elif line.startswith ("METRIC"):
            conv = 1

        elif seen_start and line.startswith ("X"):
            token = before (line, "Y")
            token = after (token, "X")
            x = float(token) * conv
            y = float(after (line, "Y")) * conv

            hole = geometry2d.Point (x,y)
            holes.append (hole)
            if args.verbose:
                print ("drill at %f, %f mm" % (hole.x, hole.y))

    #print holes

    if args.verbose:
        print ("reading gerber file %s" % gerber)

    gerber_data = read_config (gerber)
    output_data = []

    apertures = []
    aperture_num = 0
    format = [6,4]
    conv = 1 # assume mm
    for line in gerber_data:
        if line.startswith ("%ADD"):
            apertures.append (line)
            # %ADD14C
            token = after(line, "%ADD")
            num = re.findall (r"\d+", line)
            if num:
                aperture_num = max (int(num[0]), aperture_num)

            output_data.append (line)

        elif line.startswith ("%FS"):
            # %FSLAX46Y46*%
            num = re.findall (r"\d+", line)
            if num:
                x = int(num[0])
                format = [x//10, x % 10]
            output_data.append (line)

        elif line.startswith ("%MOIN"):
            conv = 25.4
            output_data.append (line)

        elif line.startswith ("%MOMM"):
            conv = 1
            output_data.append (line)

        elif line == "M02*":
            output_data.append ("G04 Draw pilot holes *")
            aperture_num += 1
            output_data.append ("%%ADD%dC,%8.6f*%%" % (aperture_num, pilot_size * conv))
            output_data.append ("%LPC*%")
            output_data.append ("D%d*" % aperture_num)

            format_str = "%%%d.%df" % (format[0], format[1])

            for hole in holes:
                x_val = format_str % hole.x
                x_val = x_val.replace (".", "")
                y_val = format_str % hole.y
                y_val = y_val.replace (".", "")

                output_data.append ("X%sY%sD03*" % (x_val, y_val))

            output_data.append ("%LPD*%")
            output_data.append (line)
        else:
            output_data.append (line)

    path = file_util.get_path (gerber)
    filename = file_util.get_filename_without_extension (gerber)
    filename = os.path.join (path, filename + "_merge.gbr")
    write_config (filename, output_data)

    if args.verbose:
        print ("merged file written to %s" % filename)

def main():
    global args

    parser = argparse.ArgumentParser(description="Combine Gerber files")

    parser.add_argument("-v", "--verbose",  help="enable verbose output", action="store_true")

    parser.add_argument("-a", help="add (draw positive)", action="store_true")
    parser.add_argument("-s", help="subtract (draw clear)", action="store_true")

    parser.add_argument("-o", metavar="file", help="output file", action="store")

    parser.add_argument('args', nargs=argparse.REMAINDER, help="Gerber file")
    
    args = parser.parse_args()

    # print ("%s %s" % (appname, __version__))
    skip = False
    if args.args:
        master = gerber.Gerber()
        positive = True
        output_file = "merged.gbr"
        for arg in args.args:
            if arg.startswith ("-"):
                if arg== "-a":
                    positive = True
                elif arg == "-s":
                    positive = False
                elif arg == "-v":
                    args.verbose = True
                elif arg == "-o":
                    skip = True
            elif skip:
                output_file = arg
                skip = False
            else:
                gerber_file = gerber.Gerber (arg)
                master.add_layer (gerber_file, positive)

        master.write_file (output_file)
    else:
        parser.print_usage()

# main entrypoint.
if __name__ == '__main__':
    main()
