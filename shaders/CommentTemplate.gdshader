shader_type canvas_item;

uniform sampler2D profileImage;
uniform vec2 scale;
uniform vec2 offset;
uniform vec4 customColor :hint_color = vec4(0.5, 0.5, 0.5, 1.0);


void fragment(){
    vec4 profileImage2  = texture(profileImage, (UV / scale) +offset);
	vec4 defaultTexture = texture(TEXTURE, UV); // Obtendo pixel RGBA a partir do envio da textura mais a posicao do pixel

	if (profileImage2.r < 1.0 || profileImage2.g < 1.0 || profileImage2.b < 1.0){
		profileImage2.a = defaultTexture.a;
		COLOR = profileImage2;
		
	}else{
		COLOR = defaultTexture;
	}
}

