# Fluid Elements and Animations with QML Challenge

Welcome to the **Fluid Elements and Animations Challenge**! This challenge is designed to help you apply and test the skills you've gained from completing the Fluid Elements and Animations course. By working through this practical exercise, you'll solidify your understanding of **animations, states, and transitions** in QML and gain confidence in creating dynamic, engaging user interfaces.

## Introduction

Learning from a course provides you with information, but exercising that knowledge through practical application leads to a richer understanding. This challenge helps move your learning from merely knowledge to understanding—a great step along the path to wisdom.

This challenge focuses on using **Animations**, **States**, and **Transitions** to breathe life into an otherwise static UI. The primary goal is to demonstrate how to achieve significant visual impact with minimal code by incorporating simple motion of properties, rather than building extensive functionality.

## Challenge Brief

In this challenge, you'll create a simple "**desktop application launcher**." We've all seen different styles and types used in popular operating systems, and may have wondered how they work. While the idea might sound complex, it doesn't have to be—as you'll discover through completing the requirements.

You'll create a launcher with icons that respond to mouse interaction, and application windows that open, close, and maximize with smooth animations between states. This challenge puts you in the role of a UI developer creating an intuitive and visually pleasing desktop environment.

## Requirements

The requirements for this challenge can be broken down into two main parts:

### Part 1: Application Launcher

- Create a large window with a background color or image to represent your desktop area
- Create a desktop application launcher with a line of icons representing imaginary applications positioned on one edge of the screen (top, right, bottom, or left)
- Your icons might be simple [Rectangles](https://doc.qt.io/qt-6/qml-qtquick-rectangle.html) or [Images](https://doc.qt.io/qt-6/qml-qtquick-image.html) and should include the name of the application
  - There is an example model you could use as the basis for a view delegate in the starting project
- Animate the icons to **enlarge on mouse hover**, and return to normal size when the mouse is not hovering
  - You could use "[Behavior on](https://doc.qt.io/qt-6/qml-qtquick-behavior.html)" for a simple solution
- Select the most suitable **animation type**, **duration**, and **easing curve** to create a pleasing "wave" effect when you hover your mouse over the icons

### Part 2: Application Windows

- Create an Item to represent each application window and position it appropriately on your desktop
  - The Item should reference the application somehow using the icon, name, or background color
  - The Qt Quick Controls [Page](https://doc.qt.io/qt-6/qml-qtquick-controls2-page.html) is a great choice for a window item since it has a convenient header, contentItem, and footer
- Define three item **states**: **closed, open, and maximized**
  - Trigger state changes through user actions (e.g., clicking the launcher icon to open, using buttons in the window Item to maximize, minimize, and close)
- For each state, decide which properties should change and how
  - Consider properties like size, position, scale, or opacity
- Define [Transitions](https://doc.qt.io/qt-6/qml-qtquick-transition.html) that provide the animations that cause those properties to change gradually as the state changes
  - Hint: Transitions can be made reversible to save on duplication
  - Experiment with different animations until you reach a suitable set of window transitioning effects
- When toggling between the "maximized" and "normal" states, use [AnchorChanges](https://doc.qt.io/qt-6/qml-qtquick-anchorchanges.html) in the **State** with [AnchorAnimation](https://doc.qt.io/qt-6/qml-qtquick-anchoranimation.html) in the **Transition**

When you have met these requirements, you should have a nice application launcher that interacts with mouse-hovering, and that can open and close windows with smooth animations between their states.

## Overview of Starting Project

To help you focus on being creative in your problem-solving, we've prepared a basic project template for you. This template contains the necessary project setup to get you started. You can find it in the [StartingProject](./StartingProject/) folder in this repository.

The starting project includes:

- A **CMakeLists.txt** file with a ready main.cpp and Main.qml file
- An **AppModel.qml** file - a simple [ListModel](https://doc.qt.io/qt-6/qml-qtqml-models-listmodel.html) containing data for a few applications in the form of "appName", "appColor", and "appIcon" roles
- An **images folder** with icon resources already added to the RESOURCES property in the CMakeLists.txt file

This provides everything you need to focus on implementing the animations, states, and transitions required for the challenge.

## Overview of Solution

A sample solution is provided in the [SolutionProject](./SolutionProject/) folder that demonstrates one approach to meeting the challenge requirements. This solution shows:

- A hierarchical structure of components that work together to create a complete desktop environment:
  - **Main.qml**: Sets up the desktop with background, layers, and the app launcher
  - **ActiveLayer.qml**: Manages which window is currently active and on top
  - **AppLauncher.qml**: Creates the launcher bar with animated app icons
  - **AppMenuItem.qml**: Individual app icons that scale and change opacity on hover
  - **AppWindow.qml**: Window components with states and transitions for opening, closing, and maximizing

Key animation techniques demonstrated include:

- Using **Behavior on** with [NumberAnimation](https://doc.qt.io/qt-6/qml-qtquick-numberanimation.html) to animate property changes like opacity and scale in response to hover events
- Defining window **States** for "closed," "normal," and "maximized" conditions
- Creating **Transitions** between states with appropriate animations
- Using **AnchorChanges** and **AnchorAnimation** to animate position and size changes
- Implementing a **SequentialAnimation** to coordinate multiple animations in sequence
- Using **easing curves** to create more natural, pleasing motion

The solution also demonstrates important architectural patterns:

- Managing window focus and z-order with a layering system
- Using signals and slots to communicate between components
- Creating dynamic objects at runtime
- Implementing window dragging and control buttons

The solution code is thoroughly commented to help you understand the approach and techniques used. The solution only demonstrates the basic solution and not the stretch goals.

## Stretch Goals

Once you've completed the basic challenge, you can extend your skills with these additional goals:

- Make the app menu item **bounce** for a few seconds when it opens a new window
- Read up on the difference between **Animations and Animators** and try to replace some of the NumberAnimations with appropriate [Animator](https://doc.qt.io/qt-6/qml-qtquick-animator.html) elements for better visual performance
- Create a Qt Quick Controls [Dialog](https://doc.qt.io/qt-6/qml-qtquick-controls2-dialog.html) that opens on the click of a button (e.g., an "Are you sure" Dialog that intercepts the close button's click handler)
  - Animate the Dialog opening and closing
- Try using [ParentAnimation](https://doc.qt.io/qt-6/qml-qtquick-parentanimation.html) to animate the AppWindow from the AppMenu icon's position (and even size) to the AppWindow's "normal" state position and size
- Add a **full screen mode** which animates the AppWindow header away, leaving instead a Qt Quick Controls [Drawer](https://doc.qt.io/qt-6/qml-qtquick-controls2-drawer.html) fixed to the top edge
  - The Drawer should animate on a swipe-down and contain the same icon, title, and buttons as the header
  - Consider making a re-usable component for this
- Experiment with other Animation types like [RotationAnimation](https://doc.qt.io/qt-6/qml-qtquick-rotationanimation.html) to make the window open and close in different ways
- Animate all open windows so you can see them simultaneously without overlapping in an exploded view, as is popular in many desktop operating systems
- Modify the window creation code so that if a window of the desired type already exists, it becomes active rather than creating a new instance
  - Ensure you handle the case when the window is destroyed when closed

## Useful Resources

- [Qt Quick Animation Overview](https://doc.qt.io/qt-6/qtquick-statesanimations-animations.html)
- [States and Transitions](https://doc.qt.io/qt-6/qtquick-statesanimations-states.html)
- [Animation and Transitions](https://doc.qt.io/qt-6/qtquick-statesanimations-animations.html)
- [Behavior Documentation](https://doc.qt.io/qt-6/qml-qtquick-behavior.html)
- [NumberAnimation Documentation](https://doc.qt.io/qt-6/qml-qtquick-numberanimation.html)
- [AnchorChanges Documentation](https://doc.qt.io/qt-6/qml-qtquick-anchorchanges.html)
- [AnchorAnimation Documentation](https://doc.qt.io/qt-6/qml-qtquick-anchoranimation.html)
- [Easing Curves](https://doc.qt.io/qt-6/qml-qtquick-propertyanimation.html#easing.type-prop)
- [Qt Quick Controls Documentation](https://doc.qt.io/qt-6/qtquickcontrols-index.html)
- [Qt Academy](https://qt.io/academy)
- [Qt Forum](https://forum.qt.io)

## Next Steps

### Continue Learning

After completing this challenge, we encourage you to continue your learning journey with more courses at Qt Academy. The skills you've developed here in creating fluid, animated interfaces will provide a solid foundation for building more engaging and intuitive applications.

### Share Your Work

We strongly encourage you to **share your project** with the Qt community! Posting your work helps you receive valuable feedback, showcase your progress, and inspire others who are on the same learning path.

To share your project:

- Post in the [Qt Forum's Fluid Elements and Animations challenge thread](https://forum.qt.io/category/73/qt-courses)
- Include **screenshots** or GIFs of your animated launcher in action
- Consider creating a short **video demonstration** showing the dynamic nature of your interface
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

This code repository contains code samples and other materials designed to help you learn and practice QML development. The materials provided are intended for educational purposes to help test your understanding of **animations, states, and transitions** in QML and gain confidence in creating dynamic, engaging user interfaces.

### Terms and Conditions

If you, your employer, or the legal entity you act on behalf of hold commercial license(s) with a Qt Group entity, this software package constitutes Pre-Release Code under the Qt License/Frame Agreement governing those licenses, and that agreement's terms and conditions govern your access and use of this software package.

This software package may provide links or access to third party libraries or code (collectively "Third-Party Software") to implement various functions. Use or distribution of Third-Party Software is discretionary and in all respects subject to applicable license terms of applicable third-party right holders.

### Third-Party Attributions

- The icons used in this project are sourced from [Material Symbols Library](https://fonts.google.com/icons) provided by Google. The icons are available under the [Apache License Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).

- `wallpaper.jpg` provided in both the StartingProject and SolutionProject is a photo by [Annie Spratt](https://unsplash.com/@anniespratt) on [Unsplash](https://unsplash.com/photos/black-textile-in-close-up-photography-gM8igOIP5MA) and is licensed under the [Unsplash License](https://unsplash.com/license).
