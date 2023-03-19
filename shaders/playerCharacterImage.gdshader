shader_type canvas_item;

uniform sampler2D imageAddited;
uniform vec2 scale;
uniform vec2 offset;

void fragment(){
	vec4 textureAddited = texture(imageAddited, (UV /scale)+offset );
	vec4 bgShape = texture(TEXTURE, UV);
	vec3 defaultColor = vec3(0.6, 0.2, 0.2);
	 
	if( textureAddited.a ==1.0 ){
		textureAddited.a = bgShape.a;
		COLOR = textureAddited;
	}else{ 
		COLOR.a = bgShape.a;
		COLOR.rgb = defaultColor;
	}

}