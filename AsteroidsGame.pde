//your variable declarations here
SpaceShip spaceship;
boolean left = false;
boolean right= false;
boolean up = false;
boolean down=false;
boolean paused = false;
Stars []star;
boolean thrust = false;
ArrayList <Propel> dots;
ArrayList <Asteroids> makeAsteroid ;
int flash = 255;
float hyperspaceCD = 0;
String hyperspaceReady;
public void setup() 
{
  makeAsteroid = new ArrayList <Asteroids>();
  for(int c=0;c<10;c++)
  {
    makeAsteroid.add(new Asteroids());
  }
  star = new Stars[50];
  for(int a=0;a<star.length;a++)
  {
    star[a]= new Stars();
  } 
  dots = new ArrayList <Propel>();
  size(600,600);
  spaceship = new SpaceShip();
}
public void draw() 
{
  background(flash);
  if(up==true)
  {
    dots.add(new Propel());
  }
  for(int c = 0;c<dots.size();c++)
  {
    dots.get(c).show();
    if(paused ==false)
    {
    dots.get(c).move();
    }
    if(dots.get(c).getColor()<10)
    {
      dots.remove(c);
    }
  }
  spaceship.show();//your code here
  if(paused == false)
  {
  spaceship.move();
  }
   for(Stars b : star)
  {
    b.show();
  }
  for(Asteroids c: makeAsteroid)
  {
    c.show();
    if(paused == false)
    {
    c.move();
    }
  }
  for(int d =0; d < makeAsteroid.size();d++)
  {
    if(dist(spaceship.getX(),spaceship.getY(),
      makeAsteroid.get(d).getX(),makeAsteroid.get(d).getY()) < 20)
    {
      makeAsteroid.remove(d); //REMOVES THE ASTEROID
      d--;
      shipCollision();
      asteroidsReset();
      paused=true;
    }
  }

  keyDo();
  if(flash>0)
    { 
      flash = flash - 2;
      if(flash<0)
      {
        flash = 0;
      }
    }
  if(hyperspaceCD !=0)
  {
    hyperspaceReady= "Not Ready";
    hyperspaceCD-=1;
  }
  else
  {
    hyperspaceReady="Ready"; 
  }
  textSize(13);
  fill(255);
  text("Hyperspace : " + hyperspaceReady, 10, 15);
  if(paused==true)
  {
    fill(255,0,0);
    text("PAUSED, PRESSED P TO BEGIN", 400,15);
  }
}
public void asteroidsReset()
  {
    for(int a =0;a<makeAsteroid.size();a++)
    {
      makeAsteroid.remove(a);
      a--;
    }
    if(makeAsteroid.size()<1)
    {
        for(int c=0;c<(int)(Math.random()*10)+10;c++)
        {
          makeAsteroid.add(new Asteroids());
        }
    }
  }
public void shipCollision()
  {
    spaceship.setX(300);
    spaceship.setY(300);
    spaceship.setDirectionX(0);
    spaceship.setDirectionY(0);
    spaceship.setPointDirection((int)(Math.random() * 360));
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
public int makeRanCor(int a)
{
  int temp = 0;
  temp=a+((int)(Math.random()*8)-4);
  return temp;
}
class Bullet extends Floater(SpaceShip theShip)
{
  
}
class Asteroids extends Floater
{
  private int rotSpeed;
  Asteroids()
  {
    corners = 12;
    int[] xC=
    {
      makeRanCor(-12),makeRanCor(0),makeRanCor(12),
      makeRanCor(14),makeRanCor(18),makeRanCor(14),makeRanCor(8)
      ,makeRanCor(0),makeRanCor(-12),makeRanCor(-15),makeRanCor(-18),makeRanCor(-15)
    };
    int[] yC=
    {
      makeRanCor(10),makeRanCor(16),makeRanCor(20),makeRanCor(18)
      ,makeRanCor(14),makeRanCor(4),makeRanCor(0),makeRanCor(-10),makeRanCor(-14),makeRanCor(-10)
      ,makeRanCor(0),makeRanCor(5),makeRanCor(10)
    };
    xCorners=xC;
    yCorners=yC;
    myColor=255;
    myCenterX=(int)(Math.random()*600);
    myCenterY=(int)(Math.random()*600);
    myDirectionX=(Math.random()*4)-2;
    myDirectionY=(Math.random()*4)-2;
    rotSpeed=(int)(Math.random()*8)-4;
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
  public void move()
  {
    rotate(rotSpeed);
    super.move();
  }
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
      myColor=255;
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
    public int getColor(){return myColor;}
    public void setColor(int x){myColor=x;}
}
class Propel extends Floater
{
  private int timer;
  private color myColor;
  public Propel()
  {
    corners = 4;
    int[] xC={-8,16,-8,-2};
    int[] yC={-8,0,8,0};
    xCorners=xC;
    yCorners=yC;
    myColor=color(255);
    myCenterX=-100;
    myCenterY=-100;
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;
    timer = 0;
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
  public int getColor(){return myColor;}
  public void setColor(int x){myColor=x;}
  public void move()
  {
    if(thrust && (Math.random() > .9) )//makes the thruster animation
    {
      myCenterX=spaceship.getX();
      myCenterY=spaceship.getY();
      myPointDirection=spaceship.getPointDirection()-180;
      double newD = myPointDirection*(Math.PI/180)+(Math.random()*.8)-.4;
      myDirectionX = 5*(Math.cos(newD));
      myDirectionY = 5*(Math.sin(newD));
    }
    else 
    {
      myCenterX+=myDirectionX;
      myCenterY+=myDirectionY;
    }
    if(myCenterX >600){ myCenterX = 0;}  //if it goes off the screen then reset it
    else if (myCenterX<0) {myCenterX = 600;}    
    if(myCenterY >600) {myCenterY = 0;}  
    else if (myCenterY < 0){myCenterY = 600;}
    timer++;
  }
  public void show()
  {
    stroke(0);
    fill(255,0,0,myColor);
    ellipse((int)(myCenterX),(int)(myCenterY),5,5);
    if(myColor>0)
    {
      myColor-=15;
    }
    else if(myColor <10)
    {
      myDirectionX=0;
      myDirectionY=0;
      myCenterX=-1000;
      myCenterY=-1000;
      myColor=175;
    }
  }
}
public void keyPressed()
{
  if(key=='a'){left= true;}
  if(key=='d'){right = true;}
  if(key=='w'){up= true;thrust=true;}
  if(key=='s'){down=true;}
  if(key=='p'){paused=!paused;}
}
public void keyReleased()
{
  if(key=='a'){left= false;}
  if(key=='d'){right = false;}
  if(key=='w'){up= false;thrust =false;}
  if(key=='s'){down=false;}
    if(key == 'h')//hyperspace      
    {
      if(hyperspaceCD == 0)
      {
        flash=255;
        spaceship.setDirectionX(0);
        spaceship.setDirectionY(0);
        spaceship.setX((int)((Math.random()*600)));
        spaceship.setY((int)((Math.random()*600)));
        spaceship.setPointDirection((int)((Math.random()*360)));
        hyperspaceCD=700;
      }
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
    if(sqrt(pow((int)spaceship.getDirectionX(),2)+pow((int)spaceship.getDirectionY(),2)) > 15)// use pythagroems theorem to figure out speed
    {
      spaceship.setDirectionX(spaceship.getDirectionX()*.9);
      spaceship.setDirectionY(spaceship.getDirectionY()*.9);
    }
  }
  if(down== true)
  {
    spaceship.accelerate(-.069);
    if(sqrt(pow((int)spaceship.getDirectionX(),2)+pow((int)spaceship.getDirectionY(),2)) > 15)// use pythagroems theorem to figure out speed
    {
      spaceship.setDirectionX(spaceship.getDirectionX()*.9);
      spaceship.setDirectionY(spaceship.getDirectionY()*.9);
    }
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
