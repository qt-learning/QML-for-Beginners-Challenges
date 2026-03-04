# Model View Delegate Challenge

Welcome to the **Model View Delegate Challenge**! This challenge is designed to help you apply and test the skills you've gained from completing the Model View Delegate course. By working through this practical exercise, you'll solidify your understanding of the **Model-View-Delegate pattern** in QML and gain confidence in creating dynamic, data-driven interfaces.

## Introduction

In the Model View Delegate course, you were introduced to the three main Qt building blocks:

- **Models**: Data sources that provide information to views
- **Views**: Components that display data from models
- **Delegates**: Templates that define how each data item should be presented

This challenge will help you explore these concepts further by creating a practical application that leverages the Model-View-Delegate pattern to create a visually appealing and efficient user interface.

## Challenge Brief

In this challenge, you'll create a simple but visually appealing **graphic equalizer display**. This display will provide a visual representation of the mocked levels of an audio source as measured across different frequencies. The number of frequency measurements will determine the graph's visual resolution.

Your graphic equalizer display should show moving levels (based on a Timer and randomly generated values - no need to analyze real audio). Think of a Hi-Fi display that might show horizontally arranged bars for each frequency band, with each bar containing individual LED elements that turn on and off according to the level of the frequency band.

## Requirements

The requirements for this challenge can be broken down into three main components:

1. **LED Element**:
   - Design a small, LED-style element to serve as the individual visual unit within an LED bar
   - Each LED should have a customizable **threshold** at which it turns on and off
   - The LED's **color** could change as the level increases
   - Keep it simple as hundreds of these elements may be created in the final display

2. **LED Bar**:
   - Create a container for multiple LED elements
   - Determine its **orientation** (either vertical or horizontal)
   - Choose the desired **number of LEDs** it will contain
   - Arrange the LEDs to fill the bar, with each bar representing the level for a single frequency band
   - The LED bar's overall **level** should dictate the behavior of individual LEDs
   - Use an **integer model** for the number of LEDs, a **delegate** (a single LED), and a **View or Repeater** with a Layout to generate and arrange the delegates

3. **Graphic Equalizer Display**:
   - Define a **model** that generates random volume level data at each index at a given Timer interval
   - This model will store the volume level data for each frequency band
   - Select an appropriate **View** to create LED Bar delegates
   - Ensure each delegate reads its corresponding frequency band's volume level from the model
   - Arrange the LED bars within the View to fill the window
   - **Tip**: Maintain all level values and thresholds normalized (between 0 and 1) to simplify bindings

## Overview of Starting Project

To help you focus on being creative in your problem-solving, we've prepared a basic project template for you. This template contains the necessary project setup to get you started. You can find it in the [StartingProject](./StartingProject/) folder in this repository.

The starting project includes:

- A **CMakeLists.txt** file with a ready main.cpp and Main.qml file
- A simple **Qt Quick Window** with some initial properties

The starting project doesn't come with any additional resources, but you should be able to achieve impressive results just using Qt Quick Rectangles in this challenge. You're free to add your own resources if desired for your design.

## Overview of Solution

A sample solution is provided in the [SolutionProject](./SolutionProject/) folder that demonstrates one approach to meeting the challenge requirements. This solution shows:

- A hierarchical structure of components that build upon each other:
  - **LED.qml**: A simple Rectangle with properties for threshold and volumeLevel
  - **LEDBar.qml**: A ColumnLayout that uses a Repeater to create multiple LEDs
  - **LEDMeter.qml**: A horizontal ListView that arranges multiple LEDBars
  - **Main.qml**: Sets up the LEDMeter with the FrequencyBandModel

- Key techniques demonstrated include:
  - Using **required properties** to pass data from models to delegates
  - Creating nested views where one delegate becomes the view for another set of delegates
  - Using **opacity animations** to create smooth transitions when LEDs turn on and off
  - Leveraging **Layout attached properties** to make components resize responsively
  - Using **color functions** (Qt.hsla) to create color gradients based on thresholds
  - Creating a dynamic model (**FrequencyBandModel**) that updates volume levels at timed intervals

The solution demonstrates how the Model-View-Delegate pattern, though initially challenging, leads to significant code reduction and well-structured, maintainable code.

The solution code is thoroughly commented to help you understand the approach and techniques used. The solution only demonstrates the basic solution and not the stretch goals.

## Stretch Goals

Once you've completed the basic challenge, you can extend your skills with these additional goals:

- Add a **peak indicator** that stays at the highest volume level in each frequency band
- Add a control such as a [Slider](https://doc.qt.io/qt-6/qml-qtquick-controls2-slider.html) to modify:
  - The quantity of LEDs per bar
  - The quantity of frequency bands
- Use a [ComboBox](https://doc.qt.io/qt-6/qml-qtquick-controls2-combobox.html) to change the update interval:
  - The ComboBox should use an appropriate [ListModel](https://doc.qt.io/qt-6/qml-qtqml-models-listmodel.html) or **JSON model**
  - Provide names for different intervals (e.g., Slow, Medium, Fast) and their corresponding values in milliseconds
  - Tip: Use the ComboBox's textRole, valueRole, and currentValue properties
- Display a vertical line moving over the frequency bands to indicate the average level across all bands
- Create your own style of bar by customizing the LED component or creating a completely new graphic equalizer display concept
- Experiment with visual effects:
  - Use [ShaderEffectSource](https://doc.qt.io/qt-6/qml-qtquick-shadereffectsource.html) to create an inverted mirror effect
  - Add [Particles](https://doc.qt.io/qt-6/qtquick-effects-particles.html) for sparkle effects
  - Apply [MultiEffect](https://doc.qt.io/qt-6/qml-qtquick-effects-multieffect.html) for shader-based fill and shadow effects

## Useful Resources

- [Qt Quick Models](https://doc.qt.io/qt-6/qtquick-modelviewsdata-modelview.html)
- [ListView Documentation](https://doc.qt.io/qt-6/qml-qtquick-listview.html)
- [Repeater Documentation](https://doc.qt.io/qt-6/qml-qtquick-repeater.html)
- [Required Properties](https://doc.qt.io/qt-6/qtqml-syntax-objectattributes.html#required-properties)
- [Qt Quick Layouts Documentation](https://doc.qt.io/qt-6/qtquicklayouts-index.html)
- [Animation and Transitions](https://doc.qt.io/qt-6/qtquick-statesanimations-animations.html)
- [Qt Quick Controls Documentation](https://doc.qt.io/qt-6/qtquickcontrols-index.html)
- [Qt Quick Effects](https://doc.qt.io/qt-6/qtquick-effects-topic.html)
- [Qt Academy](https://qt.io/academy)
- [Qt Forum](https://forum.qt.io)

## Next Steps

### Continue Learning

After completing this challenge, we encourage you to continue your learning journey with more courses at Qt Academy. The skills you've developed here in creating dynamic, data-driven interfaces using the Model-View-Delegate pattern will provide a solid foundation for building more complex applications.

### Share Your Work

We strongly encourage you to **share your project** with the Qt community! Posting your work helps you receive valuable feedback, showcase your progress, and inspire others who are on the same learning path.

To share your project:

- Post in the [Qt Forum's Model View Delegate challenge thread](https://forum.qt.io/category/73/qt-courses)
- Include **screenshots** or GIFs of your graphic equalizer in action
- Consider creating a short **video demonstration** showing the dynamic nature of your equalizer
- Share a **link to your repository** so others can see your implementation
- Describe any challenges you faced and how you overcame them
- Mention which stretch goals you tackled and how you approached them

Engaging with the community is a fantastic way to improve your skills and connect with other Qt developers around the world.

Happy coding!

## Licensing Information

```
Copyright (C) 2026 Qt Group.
SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only
```

This code repository contains code samples and other materials designed to help you learn and practice QML development. The materials provided are intended for educational purposes to help test your understanding of the **Model-View-Delegate pattern** in QML and gain confidence in creating dynamic, data-driven interfaces.

you've gained from completing the Intro to QML course.

### Terms and Conditions

If you, your employer, or the legal entity you act on behalf of hold commercial license(s) with a Qt Group entity, this software package constitutes Pre-Release Code under the Qt License/Frame Agreement governing those licenses, and that agreement's terms and conditions govern your access and use of this software package.

This software package may provide links or access to third party libraries or code (collectively "Third-Party Software") to implement various functions. Use or distribution of Third-Party Software is discretionary and in all respects subject to applicable license terms of applicable third-party right holders.
