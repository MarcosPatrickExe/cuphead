shader_type canvas_item;

uniform bool isSelected;


void fragment(){
	vec4 defaultTexture = texture(TEXTURE, UV);
	
	if(isSelected){
		COLOR = vec4(0.950, 0.100, 0.0, defaultTexture.a);
		
	}else{
		COLOR = defaultTexture;
	}
}
