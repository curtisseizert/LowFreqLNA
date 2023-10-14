#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#
# Authors: Bob Cousins
# Created : 2018-01-01

from __future__ import division

import sys
import math

import pcbnew
import FootprintWizardBase
import PadArray as PA

def rotate_about(center, p, theta):
    dx = p.x-center.x
    dy = p.y-center.y
    theta = math.radians(theta)
    x2 = dx * math.cos(theta) + dy * math.sin(theta)
    y2 = dx * math.sin(theta) + dy * math.cos(theta)

    return pcbnew.wxPoint(center.x+x2, center.y+y2)

class dial_indicator_wizard(FootprintWizardBase.FootprintWizard):

    def GetName(self):
        return "Dial indicator"

    def GetDescription(self):
        return "Indicator for rotary control"

    def GenerateParameterList(self):

        self.AddParam("Dial", "angle", self.uDegrees, 270, min_value=1, max_value=360)
        self.AddParam("Dial", "offset angle", self.uDegrees, 0, min_value=-180, max_value=180)
        self.AddParam("Dial", "radius", self.uMM, 6)
        self.AddParam("Dial", "inner arc", self.uBool, 1)
        self.AddParam("Dial", "outer arc", self.uBool, 0)

        self.AddParam("Ticks", "show ticks", self.uBool, 1)
        self.AddParam("Ticks", "number of divisions", self.uInteger, 10, min_value=1)
        self.AddParam("Ticks", "tick length", self.uMM, 1)

        self.AddParam("Labels", "show labels", self.uBool, 1)
        self.AddParam("Labels", "min", self.uInteger, 0)
        self.AddParam("Labels", "step", self.uInteger, 1)


    def CheckParameters(self):

        pass

    def GetValue(self):

        return "indicator"


    def BuildThisFootprint(self):

        dial_params = self.parameters['Dial']
        dial_angle = dial_params['angle']
        dial_offset_angle = dial_params['offset angle']
        dial_radius = dial_params['radius']
        dial_inner_arc = dial_params['inner arc']
        dial_outer_arc = dial_params['outer arc']

        tick_params = self.parameters ['Ticks']
        tick_show = tick_params['show ticks']
        tick_num_divisions = tick_params['number of divisions']
        tick_length = tick_params['tick length']

        label_params = self.parameters ['Labels']
        label_show = label_params['show labels']
        label_min = label_params['min']
        label_step = label_params['step']

        text_size = self.GetTextSize()  # IPC nominal
        thickness = self.GetTextThickness()
        # self.draw.GetLineTickness())
        textposy = self.GetTextSize()

        self.draw.Value( 0, textposy, text_size )
        self.draw.Reference( 0, -textposy, text_size )

        layer = pcbnew.F_SilkS
        center = pcbnew.wxPointMM(0,0)

        # inner arc
        if dial_inner_arc:
            start = pcbnew.wxPoint (center.x, center.y - dial_radius)
            start = rotate_about (center, start, dial_angle/2.0+ dial_offset_angle)

            self.draw.SetLayer(layer)
            self.draw.SetLineTickness(pcbnew.FromMM (0.15))
            self.draw.Arc (center.x, center.y, start.x, start.y, dial_angle*10)

        # outer arc
        if dial_outer_arc:
            start = pcbnew.wxPoint (center.x, center.y - dial_radius - tick_length)
            start = rotate_about (center, start, dial_angle/2.0+ dial_offset_angle)
            self.draw.SetLayer(layer)
            self.draw.SetLineTickness(pcbnew.FromMM (0.15))
            self.draw.Arc (center.x, center.y, start.x, start.y, dial_angle*10)

        # center cross
        self.draw.SetLayer(layer)
        self.draw.SetLineTickness(pcbnew.FromMM (0.15))
        start = pcbnew.wxPointMM(-2, 0)
        end = pcbnew.wxPointMM(2, 0)
        self.draw.Line (start.x, start.y, end.x, end.y)
        start = pcbnew.wxPointMM(0, -2)
        end = pcbnew.wxPointMM(0, 2)
        self.draw.Line (start.x, start.y, end.x, end.y)

        for j in range (0, tick_num_divisions+1):
            ang = j * dial_angle/tick_num_divisions - dial_angle/2.0 - dial_offset_angle
            ang = -ang

            start = pcbnew.wxPoint (center.x, center.y - dial_radius)
            end = pcbnew.wxPoint (center.x, center.y - dial_radius - tick_length)

            start = rotate_about (center, start, ang)
            end = rotate_about (center, end, ang)

            #
            if tick_show:
                self.draw.SetLayer(layer)
                self.draw.SetLineTickness(pcbnew.FromMM (0.15))
                self.draw.Line (start.x, start.y, end.x, end.y)

            if label_show and j * dial_angle/tick_num_divisions < 360:
                text_pos = pcbnew.wxPoint (center.x, center.y - dial_radius - tick_length - text_size*1.25)
                text_pos = rotate_about (center, text_pos, ang)

                #
                text = pcbnew.TEXTE_MODULE(self.module)

                text.SetPosition (text_pos)
                #text.SetOrientation (ang*10.0)
                text.SetThickness (pcbnew.FromMM (0.15))
                text.SetLayer(layer)
                text.SetText (str(label_min + j*label_step))

                self.module.Add (text)


dial_indicator_wizard().register()
