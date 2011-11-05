% |--------------------------------------------------------|
% | Car Project                                            |
% | By: Verdi R-D and Kyle                                 |
% | Program Description: This program acts as a remote     |
% |     control for car lights. More text will be added    |
% |     here later.                                        |
% |--------------------------------------------------------|

% ---------------------------------------------------------
% Imports & Includes
% ---------------------------------------------------------
import GUI

% ---------------------------------------------------------
% Configuration
% ---------------------------------------------------------
View.Set("graphics")
const bgimagepath : string := "pic.jpg" % Path to the background image
const horntime : int := 100 % Time the horn is played in milliseconds

% ---------------------------------------------------------
% Globals
% ---------------------------------------------------------
var leftturnon : boolean := false
var rightturnon : boolean := false
var brakeon : boolean := false
var drivingon : boolean := false
var backupon : boolean := false

% ---------------------------------------------------------
% Background - Draws the background
% ---------------------------------------------------------
procedure background ()
    var bgimage :int:= Pic.FileNew (bgimagepath)
    bgimage := Pic.Scale(bgimage, View.maxx, View.maxy)
    Pic.Draw (bgimage, 0, 0, 0)
    Pic.Free(bgimage)
end background

% ---------------------------------------------------------
% Button click procedures
% ---------------------------------------------------------
procedure leftturn () 
    if leftturnon then
	parallelput(1)
	leftturnon := true
    else
	parallelput(0)
	leftturnon := false
    end if
end leftturn

procedure rightturn ()
    if rightturnon then
	parallelput(2)
	rightturnon := true
    else
	parallelput(0)
	rightturnon := false
    end if
end rightturn

procedure brake ()
     if brakeon then
	parallelput(4)
	brakeon := true
    else
	parallelput(0)
	brakeon := false
    end if
end brake

procedure driving ()
    if drivingon then
	parallelput(8)
	drivingon := true
    else
	parallelput(0)
	drivingon := false
    end if
end driving

procedure backup ()
    if backupon then
	parallelput(16)
	backupon := true
    else
	parallelput(0)
	backupon := false
    end if
end backup

procedure horn ()
    parallelput(32)
    delay(horntime)
    parallelput(0)
end horn

procedure alloff ()
    parallelput(0)
end alloff

% ---------------------------------------------------------
% Menu - Display the menu and loop until a button is pressed
% ---------------------------------------------------------
procedure menu ()
    var btnleftturn :int := GUI.CreateButton (maxx - 200, 200, 150, "Left Turn Lights", leftturn)
    var btnrightturn :int := GUI.CreateButton (maxx - 200, 175, 150, "Right Turn Lights", rightturn)
    var btnbrake :int := GUI.CreateButton (maxx - 200, 150, 150, "Brake Lights", brake)
    var btndriving :int := GUI.CreateButton (maxx - 200, 125, 150, "Driving Lights", driving)
    var btnbackup :int := GUI.CreateButton (maxx - 200, 100, 150, "Backup Lights", backup)
    var btnhorn :int := GUI.CreateButton (maxx - 200, 75, 150, "Horn", horn)
    var btnalloff :int := GUI.CreateButton (maxx - 200, 50, 150, "All Lights Off", alloff)
    
    loop
	exit when GUI.ProcessEvent
    end loop 
end menu

% ---------------------------------------------------------
% Main - Starts the entire program
% ---------------------------------------------------------
procedure main ()
    background()
    menu()
end main

% ---------------------------------------------------------
% Starts main (leave this alone)
% ---------------------------------------------------------
main()
