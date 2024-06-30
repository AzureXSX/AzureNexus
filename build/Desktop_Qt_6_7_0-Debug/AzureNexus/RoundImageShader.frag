#version 450
uniform highp vec2 resolution;
uniform highp float radius;
uniform sampler2D sourceTexture;

in vec2 qt_TexCoord0;

out vec4 fragColor;

void main() {
    vec2 texCoord = qt_TexCoord0;

    vec2 center = vec2(0.5, 0.5);
    vec2 dist = abs(texCoord - center);

    float cornerRadius = radius * min(resolution.x, resolution.y);
    float distCorner = length(dist - vec2(0.5, 0.5) * resolution.xy) / cornerRadius;

    float alpha = smoothstep(0.0, 1.0, distCorner);
    fragColor = texture(sourceTexture, texCoord);
    fragColor.a *= alpha;
}
