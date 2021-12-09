/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 5B685ACD
/// @DnDArgument : "code" "#region Horizontal Movement$(13_10)hspeed = (keyboard_check(vk_right) - keyboard_check(vk_left)) * moveSpeed;$(13_10)	//subtracting just takes the difference, and since they return 1, just gives pos and neg movespeed$(13_10)$(13_10)#endregion$(13_10)$(13_10)#region Gravity and jumping$(13_10)//Jump is difficult to make state-based, due to the overlapping of several different states.$(13_10)$(13_10)$(13_10)$(13_10)//Jumping$(13_10)if keyboard_check(vk_space) {$(13_10)	$(13_10)	//Initial Jump - check key pressed is too unreliable.$(13_10)	if !(jumped){$(13_10)		vspeed = jumpHeight;// Jump script$(13_10)		jumped = true;$(13_10)		jumpCounter = 0;$(13_10)		endHold = false;$(13_10)		$(13_10)$(13_10)		$(13_10)		//set alarm initially, so that every jump for sure gets reset$(13_10)		alarm[0] = room_speed * landTimer;$(13_10)		$(13_10)	} else{$(13_10)		//Jump Acceleration/Hold Variable Jump$(13_10)		if jumpCounter<(jumpHold*room_speed) and !endHold {$(13_10)			vspeed += jumpAccel;$(13_10)			$(13_10)		}$(13_10)	$(13_10)	}$(13_10)}$(13_10)else if !endHold then endHold = true;$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)$(13_10)//falling$(13_10)if vspeed >0 then { //falling$(13_10)	jumped = true;$(13_10)}$(13_10)$(13_10)//setting acceleration time.$(13_10)jumpCounter +=1; $(13_10)jumpCounter = clamp(jumpCounter, -1, jumpHold*room_speed + 10);$(13_10)$(13_10)	$(13_10)$(13_10)if place_meeting(x, y+2, obj_Wall){$(13_10)	gravity = 0;$(13_10)}$(13_10)else {$(13_10)	gravity = gravValue;$(13_10)	alarm[0] = room_speed * landTimer;$(13_10)}$(13_10)#endregion$(13_10)$(13_10)#region Collisions$(13_10)if vspeed !=0 then collisions_vertical();$(13_10)if hspeed !=0 then collisions_horizontal();$(13_10)#endregion"
#region Horizontal Movement
hspeed = (keyboard_check(vk_right) - keyboard_check(vk_left)) * moveSpeed;
	//subtracting just takes the difference, and since they return 1, just gives pos and neg movespeed

#endregion

#region Gravity and jumping
//Jump is difficult to make state-based, due to the overlapping of several different states.



//Jumping
if keyboard_check(vk_space) {
	
	//Initial Jump - check key pressed is too unreliable.
	if !(jumped){
		vspeed = jumpHeight;// Jump script
		jumped = true;
		jumpCounter = 0;
		endHold = false;
		

		
		//set alarm initially, so that every jump for sure gets reset
		alarm[0] = room_speed * landTimer;
		
	} else{
		//Jump Acceleration/Hold Variable Jump
		if jumpCounter<(jumpHold*room_speed) and !endHold {
			vspeed += jumpAccel;
			
		}
	
	}
}
else if !endHold then endHold = true;





//falling
if vspeed >0 then { //falling
	jumped = true;
}

//setting acceleration time.
jumpCounter +=1; 
jumpCounter = clamp(jumpCounter, -1, jumpHold*room_speed + 10);

	

if place_meeting(x, y+2, obj_Wall){
	gravity = 0;
}
else {
	gravity = gravValue;
	alarm[0] = room_speed * landTimer;
}
#endregion

#region Collisions
if vspeed !=0 then collisions_vertical();
if hspeed !=0 then collisions_horizontal();
#endregion