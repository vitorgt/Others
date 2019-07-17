ite = 1
size = 0

function setup() {
  size = Math.min(windowWidth, windowHeight);
  createCanvas(windowWidth, windowHeight);
  background(0);
  noStroke();
  frac(width / 2 - size / 2, height / 2 - size / 2, size, size, 0, 0);
}

function frac(x, y, w, h, i, f) {
  if (f == 255) {
    fill(f);
    rect(x, y, w, h);
  }
  for (var j = 0; f != 255 && j < 3; j++) {
    for (var k = 0; k < 3; k++) {
      if (j == 1 && k == 1) {
        frac(x + (k * w) / 3, y + (j * h) / 3, w / 3, h / 3, i, 255);
      } else if (i + 1 < ite) {
        frac(x + (k * w) / 3, y + (j * h) / 3, w / 3, h / 3, i + 1, f);
      }
    }
  }
}

function draw() {
  text(ite, ite * 15, 10)
}

function mousePressed() {
  ite++;
  frac(width / 2 - size / 2, height / 2 - size / 2, size, size, 0, 0);
}

function keyTyped() {
  if (key === 's') {
    save('frac.png');
  }
}
