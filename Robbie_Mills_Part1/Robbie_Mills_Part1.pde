//Robbie Mills Particles are deleted when they move off the screen

ArrayList<Particle> listOfParticles;

void setup() {

  size(800, 500); 

  listOfParticles = new ArrayList<Particle>();

  colorMode(HSB, 100);
}

void draw() {

  background(0, 0, 100);

  println(listOfParticles.size());

  listOfParticles.add(new Particle(new PVector(width/2, height/2), 
    10, 
    color(random(0, 100), 100, 100), 
    new PVector(random(-4, 4), 
    random(-4, 4))));

  //for (Particle thisParticle : listOfParticles) {            // This version uses a nicer for loop. You'll hear this described as:
  for (int i = 0; i < listOfParticles.size(); i++) {

    Particle thisParticle = (Particle) listOfParticles.get(i);

    thisParticle.updateParticlePosition();
    thisParticle.drawParticle();

    if (thisParticle.coords.x > width || thisParticle.coords.x < 0) {
      if (thisParticle.coords.y > height || thisParticle.coords.y < 0) {

        listOfParticles.remove(i);
        //background(random(0,255)); //Uncomment to see if statement success
      }
    }
  }
}