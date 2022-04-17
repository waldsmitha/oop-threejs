// attribute vec3 position;
// position attribute of geometry

attribute vec3 aRandom;

varying vec3 vPosition;
// varying is a bridge to vertex and fragment shader

uniform float uTime;
uniform float uScale;

void main() {
    vPosition = position;

    float time = uTime * 4.0;

    vec3 pos = position;
    pos.x += sin(time * aRandom.x) * 0.01;
    pos.y += cos(time * aRandom.x) * 0.01;
    pos.z += cos(time * aRandom.x) * 0.01;

    // pos *= 0.1;
    // pos.x *= 0.1;
    pos.x *= uScale + (sin(pos.y * 4.0 + time) * (1.0 - uScale));
    pos.y *= uScale + (cos(pos.z * 4.0 + time) * (1.0 - uScale));
    pos.z *= uScale + (sin(pos.x * 4.0 + time) * (1.0 - uScale));

    pos *= uScale;
    
    

    vec4 mvPosition = modelViewMatrix * vec4( pos, 1.0 );
    gl_Position = projectionMatrix * mvPosition;
    gl_PointSize = 8.0 / -mvPosition.z;
}