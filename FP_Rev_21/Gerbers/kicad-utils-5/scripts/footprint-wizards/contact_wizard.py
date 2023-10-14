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
from __future__ import division

import sys
import math

import pcbnew
import FootprintWizardBase
import PadArray as PA


class contact_wizard(FootprintWizardBase.FootprintWizard):

    def GetName(self):
        return "Button Contact"

    def GetDescription(self):
        return "Contact for buttons"

    def GenerateParameterList(self):

        self.AddParam("Pads", "style", self.uInteger, 1, min_value=1, max_value=2)
        self.AddParam("Pads", "trace width", self.uMM, 0.2)
        self.AddParam("Pads", "trace clearance", self.uMM, 0.2)
        self.AddParam("Pads", "diameter", self.uMM, 5)

    def CheckParameters(self):

        pass

    def GetValue(self):
        
        return "contact"

    def square_contact(self):

        prm = self.parameters['Pads']
        p_trace_width = prm['trace width']
        p_trace_clearance = prm['trace clearance']
        p_diameter = prm['diameter'];


        spacing = p_trace_width + p_trace_clearance
        pad_length = p_diameter - spacing 
        radius = p_diameter/2
        posY = -radius + p_trace_width / 2
        alt = 0
        
        # draw horizontal bars
        while posY <= radius:
            posX = spacing * (2*alt-1) / 2

            pad = PA.PadMaker(self.module).SMDPad(p_trace_width, pad_length, shape=pcbnew.PAD_SHAPE_RECT, rot_degree=0.0)
            pos = self.draw.TransformPoint(posX, posY)
            pad.SetPadName(1+alt)
            pad.SetPos0(pos)
            pad.SetPosition(pos)
            pad.SetShape(pcbnew.PAD_SHAPE_OVAL)
            pad.SetLayerSet(pad.ConnSMDMask())

            pad.GetParent().Add(pad)
              
            posY = posY + spacing
            alt = 1-alt

        # vertical sides
        
        pad = PA.PadMaker(self.module).SMDPad(p_diameter, p_trace_width, shape=pcbnew.PAD_SHAPE_RECT, rot_degree=0.0)
        pos = self.draw.TransformPoint(-p_diameter/2 + p_trace_width/2, 0)
        pad.SetPadName(1)
        pad.SetPos0(pos)
        pad.SetPosition(pos)
        pad.SetLayerSet(pad.ConnSMDMask())
        pad.GetParent().Add(pad)
      
        pad = PA.PadMaker(self.module).SMDPad(p_diameter, p_trace_width, shape=pcbnew.PAD_SHAPE_RECT, rot_degree=0.0)
        pos = self.draw.TransformPoint(p_diameter/2 - p_trace_width/2, 0)
        pad.SetPadName(2)
        pad.SetPos0(pos)
        pad.SetPosition(pos)
        pad.SetLayerSet(pad.ConnSMDMask())
        pad.GetParent().Add(pad)

        # 
        body_radius = (p_diameter + self.draw.GetLineThickness())
        self.draw.Box(0,0,body_radius, body_radius)

    def round_contact(self):

        prm = self.parameters['Pads']
        p_trace_width = prm['trace width']
        p_trace_clearance = prm['trace clearance']
        p_diameter = prm['diameter'];

        spacing = p_trace_width + p_trace_clearance
        radius = p_diameter/2
        circumference = (p_diameter + p_trace_width) * math.pi
        step_angle = p_trace_width / circumference * 360
        inner_radius = radius - p_trace_clearance - p_trace_width/2
        # draw cross bars  
        posY = -radius + p_trace_width
        alt = 0
        min_y = posY
 
        while posY <= radius - p_trace_width:
            len1 = math.sqrt (radius * radius - posY * posY)
            #angle  = math.degrees(math.asin ((abs(posY + p_trace_width/2) ) / inner_radius))
            #gap = p_trace_clearance / math.sin(math.radians(angle))
            #len2 = len1 - gap
            t = inner_radius * inner_radius - (abs(posY) + p_trace_width/2*1.2) ** 2
            if t>0:
                len2 = math.sqrt (t) # - abs(math.sin(math.radians(angle)) * p_trace_width )
            else:
                len2 = 0
            #len2 = len1 - spacing
            pad_length = len1 + len2  
            posX = (len1 - pad_length/2 ) * (2*alt-1)
            
            pad = PA.PadMaker(self.module).SMDPad(p_trace_width, pad_length, shape=pcbnew.PAD_SHAPE_OVAL, rot_degree=0)
            pos = self.draw.TransformPoint(posX, posY)
            pad.SetPadName(1+alt)
            pad.SetPos0(pos)
            pad.SetPosition(pos)
            pad.SetLayerSet(pad.ConnSMDMask())
            pad.GetParent().Add(pad)
            
            max_y = posY 
            posY = posY + spacing
            alt = 1-alt

        angle1 = math.degrees(math.asin (min_y/radius))
        angle2 = math.degrees(math.asin (max_y/radius))
        
        # draw the outer parts as an arc composed of small pads
        alt = 0
        for j in [0,1]:
            if j==0:        
                start_angle = 180 - angle2
                last_angle =  180 - angle1
            else:
                start_angle = angle1
                last_angle = angle2
            
            angle = start_angle
            while angle <= last_angle:
                posX = math.cos (math.radians(angle)) * radius
                posY = math.sin (math.radians(angle)) * radius
                pad = PA.PadMaker(self.module).SMDPad(p_trace_width, p_trace_width, shape=pcbnew.PAD_SHAPE_RECT, rot_degree=-angle)
                pos = self.draw.TransformPoint(posX, posY)
                pad.SetPadName(1+j)
                pad.SetPos0(pos)
                pad.SetPosition(pos)
                pad.SetLayerSet(pad.ConnSMDMask())
                pad.GetParent().Add(pad)
                angle = angle + step_angle
                
            if angle != last_angle:
                angle = last_angle                
                posX = math.cos (math.radians(angle)) * radius
                posY = math.sin (math.radians(angle)) * radius
                pad = PA.PadMaker(self.module).SMDPad(p_trace_width, p_trace_width, shape=pcbnew.PAD_SHAPE_RECT, rot_degree=-angle)
                pos = self.draw.TransformPoint(posX, posY)
                pad.SetPadName(1+j)
                pad.SetPos0(pos)
                pad.SetPosition(pos)
                pad.SetLayerSet(pad.ConnSMDMask())
                pad.GetParent().Add(pad)
        
        # circle on silkscreen
        body_radius = (p_diameter/2 + p_trace_width/2 + self.draw.GetLineThickness())
        self.draw.Circle(0, 0, body_radius)
    
    def BuildThisFootprint(self):

        prm = self.parameters['Pads']
        p_diameter = prm['diameter'];
        p_style = prm['style']
         
        if p_style == 1:
            self.square_contact()
        else:
            self.round_contact() 

        text_size = self.GetTextSize()  # IPC nominal
        thickness = self.GetTextThickness()
        body_radius = (p_diameter/2 + self.draw.GetLineThickness())
        textposy = body_radius + self.draw.GetLineThickness()/2 + self.GetTextSize()/2 + thickness
        self.draw.Value( 0, textposy, text_size )
        self.draw.Reference( 0, -textposy, text_size )



contact_wizard().register()
