# QML Best Practice Challenge

Welcome to the **QML Best Practice Challenge**! This challenge will help you apply and test the skills you've gained from completing the QML Best Practice course. By working through this practical exercise, you'll solidify your understanding of **writing high-quality QML code** and develop habits that will make your applications more robust and maintainable.

## Introduction

This challenge is not so much about exercising your ability to use certain APIs, Layouts, or Controls, but rather an opportunity to test your ability to **write the best QML** - the language and glue that ties all those things together and brings your applications to life.

QML is a very dynamic and flexible language, and there are many ways you can unknowingly (or in some cases sadly knowingly) abuse what is afforded for precise crafting of your amazing project. This challenge reinforces the recommendations and principles explained in the course to ensure that you know how to make your code as **robust and maintainable** as possible.

## Challenge Brief

Imagine that you have successfully developed and launched a software product - a **virtual guitar pedal** - similar to the one you may have encountered in the Intro to Qt Quick course.

One day, you receive a customer report indicating that they're experiencing issues with the software. This is where your debugging skills come into play. Your task is to utilize the QML Debugger to investigate the reported problems, identify the root causes, and implement the necessary fixes.

## Requirements

The specific improvements you need to make are organized into the same sections as the QML Best Practice course. Each fix is small but will make a big difference to code quality:

### QML Language Features: Use Strong Typing (3 issues)

- **Use Strongly Typed Properties** by choosing better types for any `var` properties in the code
- **Use Declarative Bindings Rather Than Imperative Assignments** by refactoring JavaScript functions and assignments into declarative bindings
  - For example, see if you can remove the `updateDrawerDimensions()` function in Main.qml completely
- **Use Typed List Properties** by ensuring any list properties are declared to contain the correct types only

### QML Language Features: Required Properties, and More (4 issues)

- **Use [Required Properties](https://doc.qt.io/qt-6/qtqml-syntax-objectattributes.html#required-properties) in Components and Delegates** by updating unqualified uses of "model" with correctly typed required properties
- **Don't Use ids if You Don't Need Them** by removing any ids on components bound to properties that could be replaced from outside
- **Assign meaningful objectNames** to your QML objects where needed - particularly delegates in a View using string interpolation to create unique objectNames
- **Use [String Interpolation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals)** in chapter texts to use template literals (backticks) instead of double quotes and replace string concatenations with string templates

### QML Language Features: Signals, States, and More

- **Use Explicit URL Resolution** in any URL properties which should be using [`Qt.resolvedUrl()`](https://doc.qt.io/qt-6/qml-qtqml-qt.html#resolvedUrl-method)
- **Use [Group Property Syntax](https://doc.qt.io/qt-6/qtqml-syntax-objectattributes.html#grouped-properties)** for properties that could be better expressed this way
- **[Connections Function Syntax](https://doc.qt.io/qt-6/qml-qtqml-connections.html#function-syntax)** should be used instead of signal handlers when possible
- **Prefer UI Interaction Signals Over Changed Signals** by refactoring signal handlers to use UI interaction signals instead of visual property change signals

### QML Language Features: Styling and Properties

- **Use Compile-Time Style Selection** by appending a named style any time you import [QtQuick.Controls](https://doc.qt.io/qt-6/qtquickcontrols-styles.html#compile-time-style-selection)
- **Avoid Shadowing Properties** by fixing the Chapter header to make its properties FINAL to remove property shadowing potential

### Unqualified Access

- **Avoid Implicit Lookup in the Root Scope** by adding correct id qualifications on properties in child items which bind to properties of the QML document
- **Avoid Referencing Objects Outside the Component** by fixing external access to the drawer inside the SettingsButton where its id is not available by emitting a signal for handling externally
- **Avoid Using parent for Property Qualification** by using a qualified id rather than using "parent" in property binding expressions other than anchors

### QML and JavaScript

- **Use [Type Annotations on Functions](https://doc.qt.io/qt-6/qtqml-javascript-hostenvironment.html#type-annotations-and-assertions)** which don't specify any types for their parameters or return values

## Overview of Starting Project

To help you focus on the debugging process, we've prepared a project that exhibits the reported issues. You can find it in the [StartingProject](./StartingProject/) folder in this repository.

The starting project includes:

The starting project includes:

- A **CMakeLists.txt** file with main.cpp and QML files, a C++ class, and image resources
- A **target property** `QT_QML_CACHEGEN_ARGUMENTS "--verbose"` which tells the QML compiler to be more verbose, allowing us to see more warnings
- **Main.qml** with an ApplicationWindow containing:
  - Header with SettingsButton, title Label, Font Size Slider, and Dark Mode Switch
  - Footer with Previous/Next buttons and Page Indicator
  - SwipeView containing BookPage delegates for each chapter
  - Drawer with duplicate controls
- **Theme.qml** - A QML Singleton for styling
- **Book.qml** and **GreatNightIn.qml** - Components for book data
- **BookPage.qml** - Page delegate for displaying chapters
- Various control components with best practice violations

The application builds and runs successfully but generates many warnings that need to be addressed.

## Overview of Solution

A corrected version is provided in the [SolutionProject](./SolutionProject/) folder that demonstrates all the fixes applied. The solution maintains the same functionality and visual appearance while addressing all QML best practice violations.

Key improvements made include:

- **Strong typing**: Converting `var` properties to specific types, replacing imperative assignments with declarative bindings, and properly typing list properties
- **Required properties**: Adding required properties to delegates, removing unnecessary ids, adding meaningful objectNames, and using string interpolation
- **Signal handling**: Using explicit URL resolution, group property syntax, Connections function syntax, and UI interaction signals
- **Compile-time optimizations**: Using explicit style imports and adding FINAL keywords to C++ properties
- **Qualified access**: Properly qualifying property access, using signals instead of external references, and avoiding parent qualification
- **Type annotations**: Adding type information to JavaScript functions

**Proof of improvement**: The AOT (Ahead-of-Time) compilation statistics show the dramatic improvement:

- **Starting Project**: 18 of 58 bindings compiled successfully (31.03%)
- **Solution Project**: 59 of 59 bindings compiled successfully (100%)

The solution code is thoroughly commented to help you understand the approach and techniques used. The solution only demonstrates the basic solution and not the stretch goals.

## Stretch Goals

Once you've completed the basic challenge, you can extend the application with a new feature while applying best practices:

**Add a Chapter Selection Feature to the Drawer:**

- Add a [ColumnLayout](https://doc.qt.io/qt-6/qml-qtquick-layouts-columnlayout.html) to the Drawer to hold vertically arranged Buttons - one for each chapter in the Book
- Use a [Repeater](https://doc.qt.io/qt-6/qml-qtquick-repeater.html) to create the Buttons using the Book's chapters list property as the model
- Ensure each Button is the same width using appropriate [Layout attached properties](https://doc.qt.io/qt-6/qml-qtquick-layouts-layout.html)
- Alternatively, use a [ListView](https://doc.qt.io/qt-6/qml-qtquick-listview.html) if you prefer scrolling capability
- Set the Button's font to one of the Theme fonts
- Ensure the Button changes its palette colors with the Light/Dark Mode switch
  - Hint: Add new palette color roles to Theme.qml and use them in the ApplicationWindow's palette bindings
- Bind the relevant Button properties to **required properties** from the model
- When the button is clicked, make the SwipeView change its index based on the Button's index
- Highlight the button to indicate the current chapter based on the SwipeView's currentIndex
- Add a **breakpoint** on your Button's onClicked handler to inspect its index and verify SwipeView updates

## Useful Resources

- [Qt Creator Debugging QML](https://doc.qt.io/qtcreator/creator-debugging-qml.html)
- [QML Debugging and Profiling](https://doc.qt.io/qt-6/qtquick-debugging.html)
- [Qt Creator Debug Mode](https://doc.qt.io/qtcreator/creator-debug-mode.html)
- [Setting Breakpoints](https://doc.qt.io/qtcreator/creator-breakpoints-view.html)
- [Using Expressions for Debugging](https://doc.qt.io/qtcreator/creator-expressions-view.html)
- [Qt Quick Examples](https://doc.qt.io/qt-6/qtquick-codesamples.html)
- [Qt Academy](https://qt.io/academy)
- [Qt Forum](https://forum.qt.io)

## Next Steps

### Continue Learning

After completing this challenge, we encourage you to continue your learning journey with more courses at Qt Academy. Reflecting on your entire journey helps solidify your learning and inspire others who are just beginning.

### Share Your Work

We strongly encourage you to **share your experience** with the Qt community! Sharing your process helps others learn and may provide you with additional insights.

To share your experience:

- Post in the [Qt Forum's QML Debugging challenge thread](https://forum.qt.io/category/73/qt-courses)
- Describe the debugging techniques that you found most useful
- Share any alternative approaches you discovered for finding the issues
- Discuss any challenges you faced and how you overcame them
- Mention which stretch goals you tackled and what you learned from them

Remember that debugging is an essential skill for any developer, and sharing your experiences can help both you and other developers improve your problem-solving abilities.

Happy debugging!

## Licensing Information

```
Copyright (C) 2026 Qt Group.
SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only
```

This code repository contains code samples and other materials designed to help you learn and practice QML development. The materials provided are intended for educational purposes to help your understanding of **writing high-quality QML code** and develop habits that will make your applications more robust and maintainable.

### Terms and Conditions

If you, your employer, or the legal entity you act on behalf of hold commercial license(s) with a Qt Group entity, this software package constitutes Pre-Release Code under the Qt License/Frame Agreement governing those licenses, and that agreement's terms and conditions govern your access and use of this software package.

This software package may provide links or access to third party libraries or code (collectively "Third-Party Software") to implement various functions. Use or distribution of Third-Party Software is discretionary and in all respects subject to applicable license terms of applicable third-party right holders.

### Third-Party Attributions

- The icons used in this project are sourced from [Material Symbols Library](https://fonts.google.com/icons) provided by Google. The icons are available under the [Apache License Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).
