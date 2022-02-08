PVector ballPos = new PVector(95, 0);
PVector ballVel = new PVector(0, 0);
PVector ballAccel = new PVector(0, 0.3);
float bounceSpeed = -2;
boolean alive = true;
float xPole = 450;
float yPole = random(20, 320);
float xPole2 = 655;
float yPole2 = random(20, 320);
int score = 0;
int highScore = 0;
PImage bird;
float rotation = 0;

void setup() {
  size(300, 525);
  bird = loadImage("bird.png");
}

void draw() {  
  background(#50B9E8);
  fill(#02D80E);
  stroke(0);
  strokeWeight(2);
  rect(-1, 450, width+1, 15);
  fill(#C1BB71);
  rect(-1, 465, width+1, 75);

  nightTimeBackground();
  //dayTimeBackground();

  pole();
  ballVel.add(ballAccel);
  ballPos.add(ballVel);  
  fill(#FF0000);
  stroke(0);
  strokeWeight(1);
  //rotate(rotation);
  //rotation += .1;
  imageMode(CENTER);
  image(bird, 95, ballPos.y, 35, 35);
  //rotation += .1;
  //rotate(0);
  if (ballPos.y >= 450) {
    alive = false;
    ballVel.y = bounceSpeed;
    bounceSpeed += .5;
    ballPos.y = 450;
    if (bounceSpeed >= 0) {
      bounceSpeed = 0;
    }
  } 

  if (ballPos.y <= 480) {
    bounceSpeed = ballVel.y / -5;
  }          
  if (xPole <96.5 && xPole > 94 && (alive == true)) {
    score++;
  }
  if (xPole2 < 96.5 && xPole2 > 94 && (alive == true)) {
    score++;
  }
  if (alive == true) {
    textSize(18);
    fill(0);
    text(score, 5, 510);
  } else {
    fill(255, 180);
    stroke(0);
    strokeWeight(3);
    rect(55, 80, 190, 180);
    textSize(28);
    fill(0, 255);
    text("Your Score:\n        " + score, 72, 115);
    strokeWeight(3);
    line(55, 170, 245, 170);
    textSize(18);
    text("Press 'r' to restart", 72, 240);
    text("High Score: " + highScore, 90, 205);
  }
  if (score > highScore) {
    highScore = score;
  }

}

void mousePressed() {
  if (alive == true) {
    ballVel.y = -7;
  }
}

void keyPressed() {
  if (key == 'r') {
    if (alive == false) {
      score = 0;
      alive = true;      
      xPole = 450;
      xPole2 = 655;
      yPole = random(20, 320);
      yPole2 = random(20, 320);
      ballPos.y = 50;
    }
  }
}

void pole() {
  fill(#71C038);
  stroke(0);
  strokeWeight(2);  
  rect(xPole-15, -5, 45, yPole);
  fill(#99E760);
  stroke(#99E760);
  rect(xPole-13, -5, 15, yPole);

  fill(#71C038);
  stroke(0);
  rect(xPole-16, yPole, 47, -15);
  fill(#99E760);
  stroke(#99E760);
  rect(xPole-14, yPole-2, 14, -11);

  fill(#71C038);
  stroke(0);
  rect(xPole-15, yPole + 120, 45, 330 - yPole);
  fill(#99E760);
  stroke(#99E760);
  rect(xPole-13, yPole + 120, 15, 327 - yPole);

  fill(#71C038);
  stroke(0);
  rect(xPole-16, yPole + 120, 47, 15);
  fill(#99E760);
  stroke(#99E760);
  rect(xPole-14, yPole + 122, 14, 11);

  fill(#71C038);
  stroke(0);
  rect(xPole2-15, -5, 45, yPole2);
  fill(#99E760);
  stroke(#99E760);
  rect(xPole2-13, -5, 15, yPole2);

  fill(#71C038);
  stroke(0);  
  rect(xPole2-16, yPole2, 47, -15);
  fill(#99E760);
  stroke(#99E760);
  rect(xPole2-14, yPole2 - 2, 14, -11);

  fill(#71C038);
  stroke(0);  
  rect(xPole2-15, yPole2 + 120, 45, 330 - yPole2);
  fill(#99E760);
  stroke(#99E760);
  rect(xPole2-13, yPole2 + 120, 15, 327 - yPole2);

  fill(#71C038);
  stroke(0);  
  rect(xPole2-16, yPole2 + 120, 47, 15);
  fill(#99E760);
  stroke(#99E760);
  rect(xPole2-14, yPole2 + 122, 14, 11);

  if (xPole < -85) {
    xPole = width+22.5;
    yPole = random(20, 320);
  }
  if (alive == true) {
    xPole -= 2;
    xPole2 -= 2;
  } 
  if (xPole2 < -85) {
    xPole2 = width+22.5;
    yPole2 = random(20, 320);
  }
  if ((ballPos.y <= yPole + 5) && (95 <= xPole + 41) && (95 >= xPole - 25)) {
    alive = false;
  }
  if ((ballPos.y >= yPole + 105) && (95 <= xPole + 41) && (95 >= xPole - 25)) {
    alive = false;
  }
  if ((ballPos.y <= yPole2 + 5) && (95 <= xPole2 + 41) && (95 >= xPole2 -25)) {
    alive = false;
  }
  if ((ballPos.y >= yPole2 + 105) && (95 <= xPole2 + 41) && (95 >= xPole2 - 25)) {
    alive = false;
  }
}


void dayTimeBackground() {
  //the clouds
  fill(#FFFFFF);
  stroke(#FFFFFF);
  rect(0, 360, 300, 87);
  ellipse(25, 369, 65, 45);
  ellipse(79, 365, 50, 55);
  ellipse(156, 360, 75, 75);
  ellipse(111, 360, 35, 15);
  ellipse(232, 365, 60, 60);
  ellipse(204, 352, 35, 35);
  ellipse(274, 370, 75, 75);
  ellipse(110, 356, 60, 60);
  ellipse(-5, 339, 50, 50);
  ellipse(53, 355, 20, 20);

  //the buildings
  stroke(#A5D1D1);
  strokeWeight(1);
  fill(#CFEFC6);
  rect(-5, 376, 10, 15);
  rect(-5, 382, 23, 66);
  rect(64, 395, 16, 18);
  rect(50, 381, 30, 67);
  rect(73, 391, 13, 57);
  rect(86, 366, 27, 82);
  rect(90, 366, 12, 6);
  fill(#FFFFFF);
  stroke(#FFFFFF);
  rect(86, 364, 3, 7);
  stroke(#A5D1D1);
  fill(#CFEFC6);
  point(87, 372);
  point(88, 372);
  point(89, 372);
  rect(113, 394, 7, 40);
  rect(113, 402, 20, 46);
  rect(157, 381, 15, 7);
  rect(147, 388, 25, 60);  
  rect(193, 364, 25, 84);
  rect(184, 372, 34, 76);
  rect(164, 406, 20, 42);
  rect(218, 384, 15, 10);
  rect(218, 391, 31, 57);
  rect(276, 380, 20, 68);
  rect(266, 389, 30, 59);
  rect(285, 368, 20, 80);

  //windows
  strokeWeight(3);
  //windows for building 1
  point(11, 390);
  point(11, 398);
  point(11, 406);
  point(11, 414);
  point(11, 422);
  point(11, 430);
  point(11, 438);

  point(4, 390);
  point(4, 398);
  point(4, 406);
  point(4, 414);
  point(4, 422);
  point(4, 430);
  point(4, 438);

  //windows for building 2
  point(56, 390);
  point(56, 398);
  point(56, 406);
  point(56, 414);
  point(56, 422);
  point(56, 430);
  point(56, 438);

  point(64, 390);
  point(64, 398);
  point(64, 406);
  point(64, 414);
  point(64, 422);
  point(64, 430);
  point(64, 438);

  point(72, 390);
  point(72, 398);
  point(72, 406);
  point(72, 414);
  point(72, 422);
  point(72, 430);
  point(72, 438);

  //windows for building 3
  point(80, 400);
  point(80, 408);
  point(80, 416);
  point(80, 424);
  point(80, 432);
  point(80, 440);

  //windows for building 4
  point(108, 378);
  point(108, 386);
  point(108, 394);
  point(108, 402);
  point(108, 410);
  point(108, 418);
  point(108, 426);
  point(108, 434);

  point(100, 378);
  point(100, 386);
  point(100, 394);
  point(100, 402);
  point(100, 410);
  point(100, 418);
  point(100, 426);
  point(100, 434);

  point(92, 378);
  point(92, 386);
  point(92, 394);
  point(92, 402);
  point(92, 410);
  point(92, 418);
  point(92, 426);
  point(92, 434);

  //windows for building 5
  point(118, 410);
  point(118, 418);
  point(118, 426);
  point(118, 434);

  point(126, 410);
  point(126, 418);
  point(126, 426);
  point(126, 434);

  //windows for building 6
  point(153, 395);
  point(153, 403);
  point(153, 411);
  point(153, 419);
  point(153, 427);
  point(153, 435);

  point(160, 395);
  point(160, 403);
  point(160, 411);
  point(160, 419);
  point(160, 427);
  point(160, 435);

  point(167, 395);
  point(167, 403);

  //windows for building 7
  point(170, 414);
  point(170, 422);
  point(170, 430);
  point(170, 438);

  point(178, 414);
  point(178, 422);
  point(178, 430);
  point(178, 438);

  //windows for building 8
  point(192, 378);
  point(192, 386);
  point(192, 394);
  point(192, 402);
  point(192, 410);
  point(192, 418);
  point(192, 426);
  point(192, 434);

  point(200, 368);
  point(200, 378);

  point(200, 386);
  point(200, 394);
  point(200, 402);
  point(200, 410);
  point(200, 418);
  point(200, 426);
  point(200, 434);

  point(208, 368);
  point(208, 378);
  point(208, 386);
  point(208, 394);
  point(208, 402);
  point(208, 410);
  point(208, 418);
  point(208, 426);
  point(208, 434);

  //windows for building 9
  point(225, 388);
  point(225, 396);
  point(225, 404);
  point(225, 412);
  point(225, 420);
  point(225, 428);
  point(225, 436);

  point(233, 396);
  point(233, 404);
  point(233, 412);
  point(233, 420);
  point(233, 428);
  point(233, 436);

  point(241, 396);
  point(241, 404);
  point(241, 412);
  point(241, 420);
  point(241, 428);
  point(241, 436);

  //windows for building 10
  point(271, 396);
  point(271, 404);
  point(271, 412);
  point(271, 420);
  point(271, 428);
  point(271, 436);

  point(279, 385);
  point(279, 396);
  point(279, 404);
  point(279, 412);
  point(279, 420);
  point(279, 428);
  point(279, 436);

  //windows for building 11
  point(293, 378);
  point(293, 386);
  point(293, 394);
  point(293, 402);
  point(293, 410);
  point(293, 418);
  point(293, 426);
  point(293, 434);

  //the bushes
  //stroke(#85E38B);
  strokeWeight(1);
  stroke(#285529);
  fill(#85E38B);
  //ellipse(185, 438, 20, 20);
  //ellipse(196, 441, 17, 17);
  rect(-5, 437, 400, 12);
  //stroke(#285529);
  arc(40, 437, 30, 30, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(4, 440, 30, 31, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(68, 437, 30, 33, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(95, 438, 30, 31, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(152, 437, 30, 30, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(128, 437, 30, 28, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(216, 440, 30, 32, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(181, 440, 30, 29, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(250, 437, 30, 32, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(300, 437, 30, 31, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(280, 438, 30, 28, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);

  arc(151, 437, 10, 10, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(40, 437, 15, 7, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);

  arc(50, 443, 22, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(20, 442, 18, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(110, 442, 20, 25, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(80, 440, 19, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(140, 442, 21, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(163, 443, 17, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(202, 440, 18, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(264, 440, 22, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(231, 443, 24, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(300, 441, 20, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);

  arc(195, 445, 15, 10, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
}






void nightTimeBackground() {
  //the sky
  fill(#018793);
  stroke(#018793);
  rect(0, 0, 1000, 449);
  //the clouds
  fill(#00B3C2);
  stroke(#00B3C2);
  rect(0, 360, 300, 87);
  ellipse(25, 369, 65, 45);
  ellipse(79, 365, 50, 55);
  ellipse(156, 360, 75, 75);
  ellipse(111, 360, 35, 15);
  ellipse(232, 365, 60, 60);
  ellipse(204, 352, 35, 35);
  ellipse(274, 370, 75, 75);
  ellipse(110, 356, 60, 60);
  ellipse(-5, 339, 50, 50);
  ellipse(53, 355, 20, 20);

  //the buildings
  stroke(#00828C);
  strokeWeight(1);
  fill(#00828C);
  rect(-5, 376, 10, 15);
  rect(-5, 382, 23, 66);
  rect(64, 395, 16, 18);
  rect(50, 381, 30, 67);
  rect(73, 391, 13, 57);
  rect(86, 366, 27, 82);
  rect(90, 366, 12, 6);
  fill(#00B3C2);
  stroke(#00B3C2);
  rect(86, 364, 3, 7);
  stroke(#00828C);
  fill(#00828C);
  point(87, 372);
  point(88, 372);
  point(89, 372);
  rect(113, 394, 7, 40);
  rect(113, 402, 20, 46);
  rect(157, 381, 15, 7);
  rect(147, 388, 25, 60);  
  rect(193, 364, 25, 84);
  rect(184, 372, 34, 76);
  rect(164, 406, 20, 42);
  rect(218, 384, 15, 10);
  rect(218, 391, 31, 57);
  rect(276, 380, 20, 68);
  rect(266, 389, 30, 59);
  rect(285, 368, 20, 80);

  //windows
  stroke(#F3BA09);
  strokeWeight(3);
  //windows for building 1
  point(11, 390);
  point(11, 398);
  point(11, 406);
  point(11, 414);
  point(11, 422);
  point(11, 430);
  point(11, 438);

  point(4, 390);
  point(4, 398);
  point(4, 406);
  point(4, 414);
  point(4, 422);
  point(4, 430);
  point(4, 438);

  //windows for building 2
  point(56, 390);
  point(56, 398);
  point(56, 406);
  point(56, 414);
  point(56, 422);
  point(56, 430);
  point(56, 438);

  point(64, 390);
  point(64, 398);
  point(64, 406);
  point(64, 414);
  point(64, 422);
  point(64, 430);
  point(64, 438);

  point(72, 390);
  point(72, 398);
  point(72, 406);
  point(72, 414);
  point(72, 422);
  point(72, 430);
  point(72, 438);

  //windows for building 3
  point(80, 400);
  point(80, 408);
  point(80, 416);
  point(80, 424);
  point(80, 432);
  point(80, 440);

  //windows for building 4
  point(108, 378);
  point(108, 386);
  point(108, 394);
  point(108, 402);
  point(108, 410);
  point(108, 418);
  point(108, 426);
  point(108, 434);

  point(100, 378);
  point(100, 386);
  point(100, 394);
  point(100, 402);
  point(100, 410);
  point(100, 418);
  point(100, 426);
  point(100, 434);

  point(92, 378);
  point(92, 386);
  point(92, 394);
  point(92, 402);
  point(92, 410);
  point(92, 418);
  point(92, 426);
  point(92, 434);

  //windows for building 5
  point(118, 410);
  point(118, 418);
  point(118, 426);
  point(118, 434);

  point(126, 410);
  point(126, 418);
  point(126, 426);
  point(126, 434);

  //windows for building 6
  point(153, 395);
  point(153, 403);
  point(153, 411);
  point(153, 419);
  point(153, 427);
  point(153, 435);

  point(160, 395);
  point(160, 403);
  point(160, 411);
  point(160, 419);
  point(160, 427);
  point(160, 435);

  point(167, 395);
  point(167, 403);

  //windows for building 7
  point(170, 414);
  point(170, 422);
  point(170, 430);
  point(170, 438);

  point(178, 414);
  point(178, 422);
  point(178, 430);
  point(178, 438);

  //windows for building 8
  point(192, 378);
  point(192, 386);
  point(192, 394);
  point(192, 402);
  point(192, 410);
  point(192, 418);
  point(192, 426);
  point(192, 434);

  point(200, 368);
  point(200, 378);

  point(200, 386);
  point(200, 394);
  point(200, 402);
  point(200, 410);
  point(200, 418);
  point(200, 426);
  point(200, 434);

  point(208, 368);
  point(208, 378);
  point(208, 386);
  point(208, 394);
  point(208, 402);
  point(208, 410);
  point(208, 418);
  point(208, 426);
  point(208, 434);

  //windows for building 9
  point(225, 388);
  point(225, 396);
  point(225, 404);
  point(225, 412);
  point(225, 420);
  point(225, 428);
  point(225, 436);

  point(233, 396);
  point(233, 404);
  point(233, 412);
  point(233, 420);
  point(233, 428);
  point(233, 436);

  point(241, 396);
  point(241, 404);
  point(241, 412);
  point(241, 420);
  point(241, 428);
  point(241, 436);

  //windows for building 10
  point(271, 396);
  point(271, 404);
  point(271, 412);
  point(271, 420);
  point(271, 428);
  point(271, 436);

  point(279, 385);
  point(279, 396);
  point(279, 404);
  point(279, 412);
  point(279, 420);
  point(279, 428);
  point(279, 436);

  //windows for building 11
  point(293, 378);
  point(293, 386);
  point(293, 394);
  point(293, 402);
  point(293, 410);
  point(293, 418);
  point(293, 426);
  point(293, 434);

  //the bushes
  //stroke(#85E38B);
  strokeWeight(1);
  stroke(#01D10C);
  fill(#01A300);
  rect(-5, 437, 400, 12);

  arc(40, 437, 30, 30, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(4, 440, 30, 31, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(68, 437, 30, 33, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(95, 438, 30, 31, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(152, 437, 30, 30, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(128, 437, 30, 28, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(216, 440, 30, 32, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(181, 440, 30, 29, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(250, 437, 30, 32, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(300, 437, 30, 31, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(280, 438, 30, 28, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);

  arc(151, 437, 10, 10, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(40, 437, 15, 7, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);

  arc(50, 443, 22, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(20, 442, 18, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(110, 442, 20, 25, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(80, 440, 19, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(140, 442, 21, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(163, 443, 17, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(202, 440, 18, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(264, 440, 22, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(231, 443, 24, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
  arc(300, 441, 20, 20, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);

  arc(195, 445, 15, 10, PI-(QUARTER_PI/2), PI+PI+(QUARTER_PI/2), OPEN);
}
