// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collisions_vertical() 
{
var coll = instance_place(x, y+vspeed, obj_Wall);
		//checks for spot of y plus current vspeed, aka objects next location.

	if (coll != noone){
		var y_Dis = coll.y - y;
		var combinedHeight = (sprite_height + coll.sprite_height)/2; 

		if(y_Dis>=0){
			y += y_Dis - combinedHeight; 
		}
		else{
			y += y_Dis + combinedHeight; 
		}
		vspeed =0
	} 
}