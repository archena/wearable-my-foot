# AI For Your Feet

This is a project to track gait, posture and exercise with wearable _things_. The project covers a full AI stack, from hardware to models to cloud-deployed web services.

AI For Your Feet, also known as *Wearable, [my foot](https://en.wiktionary.org/wiki/my_foot)* is built by [Fuzzy Labs](https://fuzzylabs.ai).

## Hardware

The hardware is based on an [Arduino Nano IOT microcontroller](https://store.arduino.cc/arduino-nano-33-iot).

n.b. the current generation of hardware is a prototype. Future iterations will have a better form-factor by using smaller components. Example product links are included for purchasing the components.

* 1 breadboard: https://www.amazon.co.uk/ELEGOO-Breadboard-Solderless-Distribution-Connecting/dp/B01M0QJTI5
* Wires: https://www.amazon.co.uk/Elegoo-120pcs-Multicolored-Breadboard-arduino-colorful/dp/B01EV70C78/
* Arduino Nano IOT microcontroller: https://www.amazon.co.uk/Arduino-Nano-IoT-headers-mounted/dp/B07WPFQZQ1/
* Resistors: 3x 10kohm
* Pressure sensors: https://uk.farnell.com/ohmite/fsr04be/force-sensing-resistor-02ah9085/dp/3216598

## Microcontroller code

The code for the Arduino is built using PlatformIO.

In the [arduino-nano](arduino-nano) directory:

### Optional Virtualenv setup

Feel free to skip if you're installing / have installed PlatformIO using a different method. To initialise the environment using Python 3 and `pip`:

```
python -m venv env
env/bin/activate
pip install -r requirements.txt
```

To activate the environment, `source env/bin/activate`.

### Building and deploying to the device

To *Just build*

```
platformio run
```

*Build and upload*

```
platformio run -t upload
```

*Attach a serial monitor*

```
platformio run -t monitor
```

*Run the tests* - this builds a new image and uploads it so that tests are run on the device

```
platformio test
```

## Android app

The Android app allows the device to connect via Bluetooth and upload data. It's written in [Kotlin](https://kotlinlang.org).

### Building and deploying via Android Studio

TODO

### Screen sharing Android device on linx

TODO (scrcpy)

## Jupyter notebooks

## Data

The [data](data) directory contains some example data generated by the device.

## Data dashboard (Dash)

The [dash](dash) directory contains a dashboard generated by the [Dash](https://plotly.com/dash) framework. Dash is Python-based, and uses the [Flask](https://flask.palletsprojects.com) web framework; Dash is similar to [R-Shiny](https://shiny.rstudio.com).

### Running locally

```
pip install -r requirements.txt
```

```
python app.py
```

### Modification

* For a guide to Plot.ly graphs etc, see [here](https://plotly.com/python).

## Other wearable feet things

### Commercial Pressure Sensing Insoles

* [Nurvv](https://www.nurvv.com/en-gb/) - aimed at runners but [this one doesn't like it](https://www.youtube.com/watch?v=bdbcMtIYq24)
* [Arion](https://www.arion.run/) - aimed at runners
* [Digitsole](https://www.digitsole.com/) - running / cycling / health
* [Retisense](https://retisense.com/) - aimed at gait analysis / physio tool
* [Salted](https://www.salted.ltd/insole) - aimed at golfers

### Open Source / DIY Pressure Sensing Insoles

TODO

### Commercial Foot Pods

* [Stryd](https://www.stryd.com/) - Running power meter, they are [quite opaque](https://support.stryd.com/hc/en-us/articles/115003992194-How-Does-Stryd-Measure-Power-) about how it works although it seems to generally get good reviews.
* [RunScribe](https://runscribe.com) - Measures gait, power and others. [More transparent](https://runscribe.com/power/) than Stryd on how they calculate running power.
* [Garmin Running Dynamics Pod](https://buy.garmin.com/en-GB/GB/p/561205) - Measures cadence, stride length etc, can also do power when used with other Garmin devices. [DC Rainmaker review](https://www.dcrainmaker.com/2017/12/garmin-running-power-good.html)
* [Coros](https://www.coros.com/pod.php) - Running power and other metrics

### Open Source / DIY Foot Pods

TODO

### Running Power

* [George Ron on the Physics](http://www.georgeron.com/2017/09/the-physics-of-running-power.html)
* [George Ron on Stryd](http://www.georgeron.com/2017/12/stryd-running-power-model.html)
* [George Ron on RunScribe (GOVSS)](http://www.georgeron.com/2017/11/the-govss-running-power-algorithm-and.html)
* [Difference between Running and Cycling Power](https://www.trainingpeaks.com/blog/the-differences-between-running-and-cycling-power/)
* [Running Power meters compared by Outside Online](https://www.outsideonline.com/2413011/running-power-meter-comparison-study) - interesting references to VO2 measurements.
* [Running Power meters compared by DC Rainmaker](https://www.dcrainmaker.com/2017/12/garmin-running-power-good.html) - focussed initially on Garmin but interesting comparisons with Stryd and RunScribe.
* [Running Power meters compared by Sport Tracks](https://sporttracks.mobi/blog/how-to-choose-a-running-power-meter)
* [Polar measure running power using only their smart watch](https://www.polar.com/uk-en/smart-coaching/running-power) - no need for a foot pod. Uses their "proprietary algorithm and it is based on your speed and altitude gradient"
