//your variable declarations here
SpaceShip spaceship;
boolean left = false;
boolean right= false;
boolean up = false;
boolean down=false;
Stars []star;
public void setup() 
{
  star = new Stars[50];
  for(int a=0;a<star.length;a++)
  {
    star[a]= new Stars();
  }
  size(600,600);
  spaceship = new SpaceShip();
}
public void draw() 
{
  background(0);
  spaceship.show();//your code here
  spaceship.move();
   for(int b=0;b<star.length;b++)
  {
    star[b].show();
  }
  keyDo();
  System.out.println(
    sqrt(
      pow((int)spaceship.getDirectionX(),2)+
      pow((int)spaceship.getDirectionY(),2)
    )
  );
}
class Stars
  {
    private int myX,myY;
    public Stars()
    {
      myX=(int)(Math.random()*600);
      myY=(int)(Math.random()*600);
    }
    public void show()
    {
      color(255);
      fill(255);
      ellipse(myX,myY,2,2);
    }
    public int getX(){return myX;}
    public void setX(int x){myX=x;}
    public int getY(){return myY;}
    public void setY(int y){myY=y;}
  }
class SpaceShip extends Floater  
{   
    public SpaceShip()
    {
      corners = 4;
      int[] xC={-8,16,-8,-2};
      int[] yC={-8,0,8,0};
      xCorners=xC;
      yCorners=yC;
      myColor=color(255);
      myCenterX=300;
      myCenterY=300;
      myDirectionX=0;
      myDirectionY=0;
      myPointDirection=0;
    }
    public void setX(int x){myCenterX=x;} 
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY=y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX=x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY=y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection=degrees;}
    public double getPointDirection(){return myPointDirection;}
    public void move ()   //move the floater in the current direction of travel
    {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    if(sqrt(pow((int)myDirectionX,2)+pow((int)myDirectionY,2)) > 15)// use pythagroems theorem to figure out speed
    {
       myDirectionX*=.9;
      myDirectionY*=.9;
    }
    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }
}
public void keyPressed()
{
  if(key=='a')
  {
    left= true;
  }
  if(key=='d')
  {
    right = true;
  }
  if(key=='w')
  {
    up= true;
  }
  if(key=='s')
  {
   down=true;
  }
}
public void keyReleased()
  {
    if(key=='a')
  {
    left= false;
  }
  if(key=='d')
  {
    right = false;
  }
  if(key=='w')
  {
    up= false;
  }
  if(key=='s')
  {
   down=false;
  }
    if(key == 'g')//hyperspace      
    {
      spaceship.setDirectionX(0);
      spaceship.setDirectionY(0);
      spaceship.setX((int)((Math.random()*600)));
      spaceship.setY((int)((Math.random()*600)));
      spaceship.setPointDirection((int)((Math.random()*360)));
      }
  }
public void keyDo()
{
  if(left==true)
  {
    spaceship.rotate(-3);
  }
  if(right==true)
  {
    spaceship.rotate(3);
  }
  if(up == true)
  {
    spaceship.accelerate(.069);
    color(255,0,0);

  }
  if(down== true)
  {
    spaceship.accelerate(-.069);
  }
}  
abstract class Floater //Do NOT modify the Floater class! 
//Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians))
       - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) 
        + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

