# Introduction to Qt Quick Challenge

Welcome to the **Introduction to Qt Quick Challenge**! This challenge is designed to help you apply and test the skills you've gained from completing the Introduction to Qt Quick course. By working through this practical exercise, you'll solidify your understanding of **Qt Quick fundamentals** and gain confidence in your ability to create interactive UI applications.

## Introduction

Learning from a course provides you with information, but exercising that knowledge through practical application leads to a richer understanding. This challenge will give you the opportunity to:

- Demonstrate your foundational **Qt Quick knowledge**
- Apply what you've learned in a practical context
- Gain confidence in your Qt Quick skills

Upon completion, you'll feel comfortable progressing to other courses in the Qt Academy that will prepare you for your onward Qt journey.

## Challenge Brief

In this challenge, you'll design and create a simple **TV Remote Control application** that contains UI controls that you would typically find on any home TV remote. There will be various kinds of items for you to implement for controlling features such as **volume**, **channel**, **mute**, and **power** - which will need arranging in a visually appealing layout.

## Requirements

Your remote control application should contain the following:

- Add a **Window** with dimensions which resemble the kind of **remote control shape** you want
- Use components from the **Qt Quick module** such as [Text](https://doc.qt.io/qt-6/qml-qtquick-text.html), [Image](https://doc.qt.io/qt-6/qml-qtquick-image.html), [Rectangle](https://doc.qt.io/qt-6/qml-qtquick-rectangle.html) and any other components you want to use in your design
- Include a number of **Buttons** providing features such as **Volume up and down**, **Mute**, **Channel up and down**, **Power on and off**, and perhaps even some **cursor arrows**
- Add **image resources** to your project and use them in your design, demonstrating how the image URL might be changed using **bindings inside a string template expression**
- Add a **font** to your project and use a [FontLoader](https://doc.qt.io/qt-6/qml-qtquick-fontloader.html) to use the font in your Text components
- Create **re-usable items** using **inline components** adding any "required" properties where necessary
- Use **bindings and signal handlers** to connect your UI elements to the provided **tvControl object** so that interacting with your Buttons can change the visible, enabled, or color properties of other elements based on changes to the tvControl object's property values

## Stretch Goals

Once you've completed the basic challenge, you can extend your skills with these additional goals:

- Make the remote control look more believable by making the window color **transparent** and setting its **flags property** to `Qt.FramelessWindowHint`
- With no window frame to drag the frameless window around, use a [MouseArea](https://doc.qt.io/qt-6/qml-qtquick-mousearea.html) filling the parent window, whose `onPressedChanged` handler reads: `if(pressed) window.startSystemMove()` to have the window follow the mouse while pressed
- Add another row of buttons (e.g., based on KeyButton) that can change the `window.themeColor` when clicked - and have each button preview the intended color inside itself
- Add some other new features to the tvControl object and create new UI to control them
- Experiment with different [Gradient](https://doc.qt.io/qt-6/qml-qtquick-gradient.html) fills with more [GradientStops](https://doc.qt.io/qt-6/qml-qtquick-gradientstop.html) to try out different button effects
- Try adding Text and Image as children of a custom button and provide **property aliases** for the Text's text and Image's source properties
- Simplify the app by exploring components such as [Button](https://doc.qt.io/qt-6/qml-qtquick-controls2-button.html), [Switch](https://doc.qt.io/qt-6/qml-qtquick-controls2-switch.html), and [Slider](https://doc.qt.io/qt-6/qml-qtquick-controls2-slider.html) from the [QtQuick.Controls](https://doc.qt.io/qt-6/qtquickcontrols-index.html) module

## Overview of Starting Project

To help you focus on being creative in your problem-solving, we've prepared a basic project template for you. This template contains all the necessary project setup and resources required for the challenge. You can find it in the [StartingProject](./StartingProject/) folder in this repository.

The starting project includes:

- A **CMakeLists.txt** file with a ready main.cpp and Main.qml file
- Two subfolders: **"fonts"** and **"images"** containing a selection of icons and the **"SilkScreen"** font (which is a "dot matrix" style font) for your inspiration
- A **Main.qml** file with:
  - A summary of the challenge requirements
  - A Window setup with initial properties, including a **themeColor** property
  - Several inline components you can use as building blocks:
    - **BorderGradient**: A simple Rectangle with a 2-color gradient
    - **DoubleBorderGradient**: A BorderGradient with another one nested inside
    - **Button**: A clickable DoubleBorderGradient with a useful clicked signal
    - **CircleButton**: A circular Button with logic to handle clicks within the circular area
  - The **tvControl** object with properties like volume, channel, HDR enabled, and Cast Connected

If you want to use any of the provided files or add your own, you should add the filenames to the RESOURCES property in the main QT_add_qml_module() function in the CMakeLists.txt file.

**Pro Tip**: If you're using Qt 6.8 LTS or later, you can use the QML Preview Tool from the Qt Creator "Build > QML Preview" menu option for a live preview of your application that responds to every edit - even before you save!

## Overview of Solution

While there are many ways to meet the requirements of this challenge, a sample solution is provided in the [SolutionProject](./SolutionProject/) folder. This solution demonstrates:

- A window with a **two-tone border**, rounded corners, and gradient background
- A **power button** with an SVG icon
- An **LCD-style panel** showing various properties from the tvControl object:
  - Channel number string
  - Channel name
  - Volume indicator (with mute icon)
  - Icons representing features being turned on or off
- A row of **feature toggle buttons** below the LCD screen
- A **DPad** - a carefully constructed arrangement of five overlapping and clipped CircleButtons
- **Double buttons** for incrementing/decrementing the channel and volume

The solution also shows:

- How to **load and use custom fonts** with FontLoader
- How to **change image URLs dynamically** using string template expressions
- How to use **property bindings** to create responsive UI elements
- How to create and use **custom inline components** for reusability
- How to use **rotation and clipping** to create complex UI shapes

The solution code is thoroughly commented to help you understand the approach and techniques used. The solution only demonstrates the basic solution and not the stretch goals.

## Useful Resources

- [Qt Documentation](https://doc.qt.io)
- [Qt Quick Documentation](https://doc.qt.io/qt-6/qtquick-index.html)
- [Qt Quick Controls Documentation](https://doc.qt.io/qt-6/qtquickcontrols-index.html)
- [QML Property Binding](https://doc.qt.io/qt-6/qtqml-syntax-propertybinding.html)
- [Positioning with Anchors](https://doc.qt.io/qt-6/qtquick-positioning-anchors.html)
- [Image Element Documentation](https://doc.qt.io/qt-6/qml-qtquick-image.html)
- [Gradients in Qt Quick](https://doc.qt.io/qt-6/qml-qtquick-gradient.html)
- [Font Handling in Qt Quick](https://doc.qt.io/qt-6/qml-qtquick-fontloader.html)
- [Qt Quick Examples](https://doc.qt.io/qt-6/qtquick-codesamples.html)
- [Qt Academy](https://qt.io/academy)
- [Qt Forum](https://forum.qt.io)

## Next Steps

### Continue Learning

After completing this challenge, we encourage you to continue your learning journey with more courses from [Qt Academy](https://qt.io/academy). The skills you've developed here will provide a solid foundation for exploring more advanced topics in Qt and QML development.

### Share Your Work

We strongly encourage you to **share your project** with the Qt community! Posting your work helps you receive valuable feedback, showcase your progress, and inspire others who are on the same learning path.

To share your project:

- Post in the [Qt Forum's Qt Quick challenge thread](https://forum.qt.io/category/73/qt-courses)
- Include **screenshots** of your remote control application
- Consider creating a short **video demonstration** showing the interactive elements
- Share a **link to your repository** so others can see your implementation
- Describe any challenges you faced and how you overcame them
- Mention which stretch goals you tackled and how you approached them

Engaging with the community is a fantastic way to improve your skills and connect with other Qt developers around the world.

Happy coding!
