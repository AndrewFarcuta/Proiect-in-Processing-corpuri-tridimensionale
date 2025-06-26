import processing.opengl.*;

void setup()
{
    size(1900, 1000, OPENGL);
}

void draw()
{
    background(0);
    lights();
    stroke(255);
    fill(255, 0, 0);
    pushMatrix();    
    translate( width/3,height/4 );
    rotateX( PI/6 );
    rotateY( radians( frameCount ) );
    rotateZ( radians( frameCount ) );
    noFill();
    drawCylinder( 30, 100, 100, 200 );
    popMatrix();

    pushMatrix();    
    translate( width/1.5,height/4 );
    rotateX( PI/4 );
    rotateY( radians( frameCount ) );
    rotateZ( radians( frameCount ) );
    drawCylinder( 50, 100, 0, 150 );
    popMatrix();

    pushMatrix();
    translate(width/2,height/2);
    rotateX( PI/4 );
    rotateY( radians( frameCount ) );
    rotateZ( radians( frameCount ) );
    sphere(100);
    popMatrix();
    
    pushMatrix();    
    translate( width/3,height/1.3 );
    rotateX( PI/2 );
    rotateY( radians( frameCount ) );
    rotateZ( radians( frameCount ) );
    drawCylinder( 8, 100,0, 100 );
    popMatrix();

    pushMatrix();    
    translate( width/1.5,height/1.3 );
    rotateX( PI/12 );
    rotateY( radians( frameCount ) );
    rotateZ( radians( frameCount ) );
    drawCylinder( 6, 100, 160, 100 );
    popMatrix();
}

void drawCylinder( int sides, float r1, float r2, float h)
{
    float angle = 360 / sides;
    float halfHeight = h / 2;

    // draw top of the tube
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r1;
        float y = sin( radians( i * angle ) ) * r1;
        vertex( x, y, -halfHeight);
    }
    endShape(CLOSE);

    // draw bottom of the tube
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r2;
        float y = sin( radians( i * angle ) ) * r2;
        vertex( x, y, halfHeight);
    }
    endShape(CLOSE);
    
    // draw sides
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < sides + 1; i++) {
        float x1 = cos( radians( i * angle ) ) * r1;
        float y1 = sin( radians( i * angle ) ) * r1;
        float x2 = cos( radians( i * angle ) ) * r2;
        float y2 = sin( radians( i * angle ) ) * r2;
        vertex( x1, y1, -halfHeight);
        vertex( x2, y2, halfHeight);    
    }
    endShape(CLOSE);

}
