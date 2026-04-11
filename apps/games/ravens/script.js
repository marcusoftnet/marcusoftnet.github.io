/** @type {HTMLCanvasElement} */
const canvas = document.getElementById("canvas1");
const ctx = canvas.getContext("2d");
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

const collisionCanvas = document.getElementById("collisionCanvas");
const collisionCanvasCtx = collisionCanvas.getContext("2d");
collisionCanvas.width = window.innerWidth;
collisionCanvas.height = window.innerHeight;

let timeToNextRaven = 0;
let ravenInterval = 500;
let lastTime = 0;
let gameOver = false;

let score = 0;
ctx.font = "50px Impact";

let ravens = [];
class Raven {
  constructor() {
    this.spriteWidth = 271;
    this.spriteHeight = 194;
    this.sizeModifier = Math.random() * 0.6 + 0.4;

    this.width = this.spriteWidth * this.sizeModifier;
    this.height = this.spriteHeight * this.sizeModifier;
    this.x = canvas.width;
    this.y = Math.random() * (canvas.height - this.height);

    this.directionX = Math.random() * 5 + 3;
    this.directionY = Math.random() * 5 - 2.5;

    this.image = new Image();
    this.image.src = "./resources/raven.png";

    this.markedForDeletion = false;

    this.frame = 0;
    this.maxFrame = 4;

    this.timeSinceFlap = 0;
    this.flapInterval = Math.random() * 50 + 50;

    this.randomColors = [
      Math.floor(Math.random() * 255),
      Math.floor(Math.random() * 255),
      Math.floor(Math.random() * 255),
      Math.floor(Math.random() * 255),
    ];
    this.color = `rgb(${this.randomColors[0]}, ${this.randomColors[1]}, ${this.randomColors[2]}, ${this.randomColors[3]})`;
  }
  update(deltaTime) {
    if (this.y < 0 || this.y > canvas.height - this.height) {
      this.directionY = this.directionY * -1;
    }
    this.x -= this.directionX;

    if (this.x < 0 - this.width) this.markedForDeletion = true;

    this.timeSinceFlap += deltaTime;
    if (this.timeSinceFlap > this.flapInterval) {
      if (this.frame > this.maxFrame) this.frame = 0;
      else this.frame++;
      this.timeSinceFlap = 0;
    }

    if (this.x < 0 - this.width) gameOver = true;
  }
  draw() {
    collisionCanvasCtx.fillStyle = this.color;
    collisionCanvasCtx.fillRect(this.x, this.y, this.width, this.height);
    ctx.drawImage(
      this.image,
      this.frame * this.spriteWidth,
      0,
      this.spriteWidth,
      this.spriteHeight,
      this.x,
      this.y,
      this.width,
      this.height
    );
  }
}

let explosions = [];
class Explosion {
  constructor(x, y, size) {
    this.image = new Image();
    this.image.src = "./resources/boom.png";
    this.spriteWidth = 200;
    this.spriteHeight = 179;
    this.size = size;
    this.x = x;
    this.y = y;

    this.frame = 0;
    this.sound = new Audio();
    this.sound.src = "./resources/boom.wav";

    this.timeSinceLastFrame = 0;
    this.frameInterval = 200;

    this.markedForDeletion = false;
  }

  update(deltaTime) {
    if (this.frame === 0) this.sound.play();
    this.timeSinceLastFrame += deltaTime;
    if (this.timeSinceLastFrame > this.frameInterval) {
      this.frame++;
      this.timeSinceLastFrame = 0;
      if (this.frame > 5) this.markedForDeletion = true;
    }
  }
  draw() {
    ctx.drawImage(
      this.image,
      this.frame * this.spriteWidth,
      0,
      this.spriteWidth,
      this.spriteHeight,
      this.x,
      this.y - this.size / 4,
      this.size,
      this.size
    );
  }
}

let particles = [];
class Particle {
  constructor(x, y, size, color) {
    this.x = x;
    this.y = y;
    this.radius = Math.random() * this.size / 10;
    this.maxRadius = Math.random() * 20 + 35;
    this.speedX = Math.random() * 1 + 0.5;
    this.color = color;
    this.markedForDeletion = false;
  }
  update(deltaTime) {
    this.x += this.speedX;
    this.radius += 0.2;
    if(this.radius > this.maxRadius) this.markedForDeletion = true;
  }
  draw() {
    ctx.beginPath();
    ctx.fillStyle = this.color;
    ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2);
    ctx.fill();
  }
}

function drawScore() {
  ctx.fillStyle = "black";
  ctx.fillText("Score: " + score, 50, 75);
  ctx.fillStyle = "white";
  ctx.fillText("Score: " + score, 55, 80);
}

function drawGameOver() {
  ctx.textAlign = "center";
  ctx.fillStyle = "black";
  ctx.fillText(
    "GAME OVER, Score: " + score,
    canvas.width / 2,
    canvas.height / 2
  );

  ctx.fillStyle = "white";
  ctx.fillText(
    "GAME OVER, Score: " + score,
    (canvas.width / 2) + 5,
    (canvas.height / 2) + 5
  );
}

function colorsAreEqual(colors1, colors2) {
  return (
    colors1[0] === colors2[0] &&
    colors1[1] === colors2[1] &&
    colors1[2] === colors2[2]
  );
}

window.addEventListener("click", function (e) {
  const detectPixelColor = collisionCanvasCtx.getImageData(e.x, e.y, 1, 1);
  const pc = detectPixelColor.data;
  ravens.forEach((r) => {
    if (colorsAreEqual(r.randomColors, pc)) {
      r.markedForDeletion = true;
      score++;
      explosions.push(new Explosion(r.x, r.y, r.width));
    }
  });
});

function animate(timestamp) {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  collisionCanvasCtx.clearRect(0, 0, canvas.width, canvas.height);

  let deltaTime = timestamp - lastTime;
  lastTime = timestamp;
  timeToNextRaven += deltaTime;

  if (timeToNextRaven > ravenInterval) {
    ravens.push(new Raven());
    timeToNextRaven = 0;
    ravens.sort(function (a, b) {
      return a.width - b.width;
    });
  }

  drawScore();

  [...ravens, ...explosions].forEach((r) => r.update(deltaTime));
  [...ravens, ...explosions].forEach((r) => r.draw());

  ravens = ravens.filter((r) => !r.markedForDeletion);
  explosions = explosions.filter((r) => !r.markedForDeletion);

  if (!gameOver) {
    requestAnimationFrame(animate);
  } else {
    drawGameOver();
  }
}

animate(0);
