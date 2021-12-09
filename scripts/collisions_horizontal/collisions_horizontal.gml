function collisions_horizontal() 
{
	var coll = instance_place(x+hspeed, y, obj_Wall);
	if (coll != noone){
		var x_dis = coll.x - x;
		var truewidth = sprite_width;
			if image_xscale <0 then truewidth = -truewidth;
		var combinedWidth = (truewidth/2 + coll.sprite_width/2); 
		
		if(x_dis>=0){
			x += x_dis - combinedWidth; 
			
		}
		else{
			x += x_dis + combinedWidth; 
		}
		hspeed =0
	}
}