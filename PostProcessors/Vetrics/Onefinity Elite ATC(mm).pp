 +================================================
+                                                
+ Masso - Vectric machine output configuration file   V9.5
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      When       What                         
+ ======== ========== ===========================
+Peter      Modify from Mach3 version dated 24/10/2018
+Peter      11/01/2019 Formatted for Masso
+Peter	26/01/2019 Changed setup Gcode to separated lines
+Peter	06/03/2019 Added Version numbers
+Peter	26/03/2019 M05 added before Tool Change
+James  27/03/2024 Added subroutine calls for RapidChange ATC
+================================================

POST_NAME = "Onefinity Elite ATC(mm) (*.nc)"

FILE_EXTENSION = "nc"

UNITS = "MM"

DIRECT_OUTPUT = "Masso.Document"

SUBSTITUTE = "({)}"

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = "[13][10]"

+------------------------------------------------
+    Block numbering                             
+------------------------------------------------

LINE_NUMBER_START     = 0
LINE_NUMBER_INCREMENT = 10
LINE_NUMBER_MAXIMUM = 999999

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR LINE_NUMBER = [N|A|N|1.0]
VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE = [F|C|F|1.1]
VAR X_POSITION = [X|A|X|1.3]
VAR Y_POSITION = [Y|A|Y|1.3]
VAR Z_POSITION = [Z|A|Z|1.3]
VAR ARC_CENTRE_I_INC_POSITION = [I|A|I|1.3]
VAR ARC_CENTRE_J_INC_POSITION = [J|A|J|1.3]
VAR X_HOME_POSITION = [XH|A|X|1.3]
VAR Y_HOME_POSITION = [YH|A|Y|1.3]
VAR Z_HOME_POSITION = [ZH|A|Z|1.3]
VAR SAFE_Z_HEIGHT = [SAFEZ|A|Z|1.3]
VAR DWELL_TIME = [DWELL|A|P|1.2]
+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"( [TP_FILENAME] )"
"( File created: [DATE] - [TIME])"
"( RapidChange ATC Subroutines for Masso Vectric VCarve Pro / Aspire)"
"(Post Processor version MM v1.2)"
"( Material Size)"
"( X= [XLENGTH], Y= [YLENGTH] ,Z= [ZLENGTH])"
"([FILE_NOTES])"
"(Toolpaths used in this file:)"
"([TOOLPATHS_OUTPUT])"
"(Tools used in this file: )"
"([TOOLS_USED])"
"[N] G00 "
"[N] G21"
"[N] G17"
"[N] G90"
"[N] G80"
"[N] G94"
"[N] (Toolpath:- [TOOLPATH_NAME])"
"[N] ([TOOLPATH_NOTES])"
"[N] (Change to tool [TOOLNAME])"
"[N] M98 P63[T]"
"[N] [S] M03"
"[N] M08"
"[N] G4 P5000"

+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"[N] G00 [X] [Y]"
"[N] G00 [Z]"


+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"[N] G1 [X] [Y] [Z] [F]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"[N] G1 [X] [Y] [Z]"

+---------------------------------------------------
+  Commands output for the first clockwise arc move
+---------------------------------------------------

begin FIRST_CW_ARC_MOVE

"[N] G2 [X] [Y] [I] [J] [F]"

+---------------------------------------------------
+  Commands output for clockwise arc  move
+---------------------------------------------------

begin CW_ARC_MOVE

"[N] G2 [X] [Y] [I] [J]"

+---------------------------------------------------
+  Commands output for the first counterclockwise arc move
+---------------------------------------------------

begin FIRST_CCW_ARC_MOVE

"[N] G3 [X] [Y] [I] [J] [F]"

+---------------------------------------------------
+  Commands output for counterclockwise arc  move
+---------------------------------------------------

begin CCW_ARC_MOVE

"[N] G3 [X] [Y] [I] [J]"

+---------------------------------------------------
+  Commands output for first clockwise helical arc  moves
+---------------------------------------------------

begin FIRST_CW_HELICAL_ARC_MOVE

"[N] G2  [X] [Y] [Z] [I] [J] [F]"

+---------------------------------------------------
+  Commands output for clockwise helical arc  moves
+---------------------------------------------------

begin CW_HELICAL_ARC_MOVE

"[N] G2 [X] [Y] [Z] [I] [J]"

+---------------------------------------------------
+  Commands output for first counterclockwise helical arc  moves
+---------------------------------------------------

begin FIRST_CCW_HELICAL_ARC_MOVE

"[N] G3 [X] [Y] [Z] [I] [J] [F]"

+---------------------------------------------------
+  Commands output for counterclockwise helical arc  moves
+---------------------------------------------------

begin CCW_HELICAL_ARC_MOVE

"[N] G3 [X] [Y] [Z] [I] [J]"

+---------------------------------------------------
+  Commands output for first clockwise helical arc plunge moves
+---------------------------------------------------

begin FIRST_CW_HELICAL_ARC_PLUNGE_MOVE

"[N] G2 [X] [Y] [Z] [I] [J] [F]"

+---------------------------------------------------
+  Commands output for clockwise helical arc plunge moves
+---------------------------------------------------

begin CW_HELICAL_ARC_PLUNGE_MOVE

"[N] G2 [X] [Y] [Z] [I] [J]"

+---------------------------------------------------
+  Commands output for first counter clockwise helical arc plunge moves
+---------------------------------------------------

begin FIRST_CCW_HELICAL_ARC_PLUNGE_MOVE

"[N] G3 [X] [Y] [Z] [I] [J] [F]"

+---------------------------------------------------
+  Commands output for counter clockwise helical arc plunge moves
+---------------------------------------------------

begin CCW_HELICAL_ARC_PLUNGE_MOVE

"[N] G3 [X] [Y] [Z] [I] [J]"

+---------------------------------------------------
+  Commands output at toolchange
+---------------------------------------------------

begin TOOLCHANGE

"[N] M09"
"[N] M05"
"[N] G4 P5000"
"[N] (Change to tool [TOOLNAME])"
"[N] M98 P63[T]"



+---------------------------------------------------
+  Commands output for a new segment - toolpath
+  with same toolnumber but maybe different feedrates
+---------------------------------------------------

begin NEW_SEGMENT

"([TOOLPATH_NAME])"
"([TOOLPATH_NOTES])"
"[N] [S] M03"
"[N] M08"
"[N] G4 P5000"

+---------------------------------------------
+  Commands output for a dwell move
+---------------------------------------------

begin DWELL_MOVE

"G04 [DWELL]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"[N] M09"
"[N] M05"
"[N] G53 G90 Z0"
"[N] X0 Y0"
"[N] M30"
%


