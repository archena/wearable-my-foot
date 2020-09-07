/**
 * This is a processing.org sketch. It's *NOT* for loading onto your Arduino.
 * The sketch connects to the Arduino's serial port, reads device data and visualises this
 */

import processing.serial.*;
import java.awt.event.KeyEvent;
import java.io.IOException;

Serial arduino;
float gX, gY, gZ;
long lastDataTime = millis();
boolean connected = false;

/**
 * Parameters to configure for connecting to the device
 */
String portName = "/dev/ttyACM0";  // The serial port to read
int portNumber = 9600;

void setup() {
  size (1600, 800, P3D);
  arduino = new Serial(this, portName, portNumber);
}

void draw() {
  if (millis() - lastDataTime > 1000 && connected) {
    connected = false;
    arduino.stop();
    delay(250);
    try{
      arduino = new Serial(this, portName, portNumber);
    } catch (RuntimeException ex) {
      connected = true;
      println(ex);
    }
  }

  textSize(22);
  translate(width / 2, height / 2, 0);

  if (connected) {
    background(0, 150, 0);
    text("Connected to: " + portName, -300, -300);
  } else {
    background(150, 0, 0);
    text("Not connected to: " + portName + ", check portName/portNumber", -300, -300);
  }

  drawBox("gyro\n","Raw gyroscope reading", -450, gX, gY, gZ);
}

void drawBox(String name, String description, int xShift, float gX, float gY, float gZ) {
  pushMatrix();
  translate(xShift, 0, 0);
  rotateX(radians(gX));
  rotateZ(radians(-gY));
  rotateY(radians(-gZ));
  textSize(16);
  fill(0, 76, 183);
  box(160, 40, 300);
  fill(255, 255, 255);
  text(name, -60, 5, 151);
  popMatrix();
  text(name + description + "\npitch: " + int(gY) + "\nroll: " + int(gX) + "\nyaw: " + int(gZ), xShift -20, 200);
}

void serialEvent(Serial port) {
  String data = port.readStringUntil('\n');
  if (data != null) {
    connected = true;
    lastDataTime = millis();
    data = trim(data);

    String items[] = split(data, ',');
    if (items.length > 1) {
      gX = float(items[3]);
      gY = float(items[4]);
      gZ = float(items[5]);
    }
  }
}
