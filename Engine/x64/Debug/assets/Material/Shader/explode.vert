#version 420 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;
layout (location = 3) in vec3 mTengent;
layout (location = 4) in vec3 mBiTengent;

out vec3 Normal;
out vec3 FragPos;
//out mat3 TBN;

out VS_OUT {
    vec2 texCoords;
} vs_out;

layout(std140 , binding = 1) uniform Matrices{
    mat4 view;
    mat4 projection;
};

uniform mat4 model;


void main() {
    FragPos = vec3(model*vec4(aPos,1.0));
    Normal = mat3(transpose(inverse(model))) * aNormal;
    //TBN = mat3(mTengent, mBiTengent, Normal);
    vs_out.texCoords = aTexCoords;
    gl_Position = projection * view * vec4(FragPos,1.0);  
}
