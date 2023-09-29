Mice [] colony;
boolean follow = true;
void setup()   
 {   
   frameRate(7);
   size(500,500);
   background(255);
   colony = new Mice[5];
   for (int a = 0; a < colony.length; a++)
   {
     colony[a] = new Mice();
   }
 }   
 void draw()   
 {    
   background(250);
   for (int b = 0; b < colony.length; b++)
   {
     colony[b].move();
     colony[b].show();
   }
 }  
 class Mice    
 {     
   float deltaX, deltaY;
   int x, y;
   int yearnX,yearnY;
   int yearnCounter = 0;
   double rotationAngle;
   Mice()
   {
     x = (int)(Math.random() * 500);
     y = (int)(Math.random() * 500);
   }
   void move()
   {
     if (follow == true)
     {
       yearnX = mouseX;
       yearnY = mouseY;
       yearnCounter = 0;
     } else 
     {
       if (yearnCounter <= 0)
       {
         yearnX = (int)(Math.random() * 500);
         yearnY = (int)(Math.random() * 500);
         yearnCounter = (int)(Math.random() * 50) + 50;
       }
     }
     yearnCounter--;
     fill(245, 229, 88);
     triangle(yearnX - 14, yearnY - 6, yearnX + 8,yearnY - 15, yearnX + 12, yearnY + 12);
     
       if (yearnX > x + 30)
       {
         deltaX = (int)(Math.random() * 5) + 1;
       } else if (yearnX < x - 30)
       {
         deltaX = (int)(Math.random() * 5) - 5;
       } else 
       {
         deltaX = (int)(Math.random() * 11) - 5;
       }
       if (yearnY > y + 30)
       {
         deltaY = (int)(Math.random() * 5) + 1;
       } else if (yearnY < y - 30)
       {
         deltaY = (int)(Math.random() * 5) - 5;
       } else
       {
         deltaY = (int)(Math.random() * 11) - 5;
       }
   }
   void show()
   {
     fill(250);
     //transforming the mice
       //move the mice
     translate(x + deltaX,y + deltaY);
       //rotate the mouse
       if (yearnX == x)
       {
         rotationAngle = atan((yearnY - y) / (yearnX - (x+1))) + (PI / 2);
       } else 
       {
         rotationAngle = atan((yearnY - y) / (yearnX - x)) + (PI / 2);
       }
     if (follow == true)
     {
       if (deltaX < 0)
       {
         if (deltaY > 0)
         {
           rotationAngle += PI;
         } else 
         {
           rotationAngle -= PI;
         }
       }
     }
     rotate((float)rotationAngle);
     //draw the mice
     strokeWeight(2);
     stroke(252, 164, 214);
     line(0,0,0,15);
     noStroke();
     fill(50);
     ellipse(0,0,9,14);
     triangle(-4.5,-6,4.5,-6,0,-17);
     //undo the transformation
     rotate((float)(0-rotationAngle));
     translate(-(x + deltaX),-(y + deltaY));
     x += deltaX;
     y += deltaY;
   }
 }  
 
 void mousePressed()
 {
   if (follow == false)
   {
     follow = true;
   } else
   {
     follow = false;
   }
 }
