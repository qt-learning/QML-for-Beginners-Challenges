# QML Debugging with Qt Creator Challenge

Welcome to the **QML Debugging with Qt Creator Challenge**! This challenge is designed to help you apply and test the skills you've gained from completing the QML Debugging with Qt Creator course. By working through this practical exercise, you'll solidify your understanding of **debugging techniques** and gain confidence in finding and fixing issues in QML applications.

## Introduction

The QML Debugger is a powerful tool that allows you to inspect the state of your QML application at runtime. You can use it to step through code, examine variables, and track down the source of errors. With the debugger, you can recreate the conditions under which problems occur, and then analyze your application's behavior to identify what's going wrong.

Knowing how the QML Debugger works, its features, views, and capabilities is only as valuable as your ability to apply that knowledge. As someone once said, "you can learn about driving a car and pass the test, but it isn't until you start driving for real that you actually begin to learn how to drive."

This challenge provides a practical exercise to help you become familiar with the QML debugger's operation and move beyond theoretical knowledge to practical competence.

## Challenge Brief

Imagine that you have successfully developed and launched a software product - a **virtual guitar pedal** - similar to the one you may have encountered in the Intro to Qt Quick course.

One day, you receive a customer report indicating that they're experiencing issues with the software. This is where your debugging skills come into play. Your task is to utilize the QML Debugger to investigate the reported problems, identify the root causes, and implement the necessary fixes.

## Requirements

### Original Application Requirements

The virtual guitar pedal was designed with the following requirements:

- Three dials for **Time**, **Level**, and **Feedback** parameters where the dials rotate clockwise to increase the value and anti-clockwise to decrease
  - The dials should intuitively respond to rotational input handling
- The main **foot switch** turns the virtual guitar pedal on or off and should show the pedal being pressed or not, as well as a "Standby/On LED" reflecting the same state
- A **mode switch** can be selected in an up or down position to change the mode of the effect being applied

### Reported Issues

The customer has reported the following problems:

- The dials don't rotate as expected, behaving erratically
  - They don't seem to be able to rotate fully clockwise, getting stuck at the "3 o'clock" position
- Pressing the foot pedal makes the foot pedal image and the LED disappear
- The mode switch also vanishes when it is clicked

Your challenge is to use the QML Debugger in Qt Creator to help you find where the problems are and to fix the code to make it behave properly.

## Overview of Starting Project

To help you focus on the debugging process, we've prepared a project that exhibits the reported issues. You can find it in the [StartingProject](./StartingProject/) folder in this repository.

The starting project includes:

- A **CMakeLists.txt** file with main.cpp and Main.qml files, along with image and font resources
- A virtual guitar pedal application with the reported issues:
  - Erratic dial rotation that stops at the 3 o'clock position
  - Disappearing foot pedal and LED when pressed
  - Vanishing mode switch when clicked

The Main.qml file contains the complete application, including:

- A **Window** with fixed size properties
- **FontLoaders** for specialized text rendering
- A **background image** of the red pedal
- **ScrewImage** instances in each corner
- Two text components: **DeviceText** and **InfoText**
- A **SwitchImage** component that changes its source based on state
- A **DeviceSwitch** component extending SwitchImage with text
- **Mode Switch** and **FootSwitch** instances
- A **DeviceDial** component with rotational behavior
  - Used for the Time, Level, and Feedback controls

## Debugging Approach

To successfully complete this challenge, you'll need to use several QML debugging techniques:

1. **Setting breakpoints** at key locations in the code:
   - In signal handlers (e.g., onTapped, onCentroidChanged)
   - In property bindings like the Image source property
   - With conditions to target specific scenarios

2. **Using expression evaluators** to inspect:
   - Variable values like file URLs
   - Property values for components
   - Complex expressions to test fixes

3. **Stepping through code** with:
   - Step Into (to examine function internals)
   - Step Over (to execute a line and move to the next)
   - Step Out (to complete the current function)
   - Run To Line (to jump to a specific point)

4. **Analyzing errors** in the application output
   - Looking for patterns in error messages
   - Tracing errors back to their source

5. **Testing fixes** incrementally:
   - Making one change at a time
   - Restarting the debugger to apply changes
   - Verifying each fix addresses the issue

By methodically applying these techniques, you can identify and fix all the reported issues in the virtual guitar pedal application.

## Overview of Solution

The solution approach for this challenge involves using the QML debugger to locate and fix three specific issues. A fixed version is provided in the [SolutionProject](./SolutionProject/) folder as a reference.

The key issues identified and fixed are:

1. **Dial rotation direction**:
   - Setting a breakpoint in the DragHandler's onCentroidChanged signal handler
   - Stepping into the updateValueAndRotation() function
   - Discovering a sign error in the angle calculation
   - Removing an incorrect negative sign

2. **Dial rotation range limitation**:
   - Creating a conditional breakpoint for when dial.value equals 100
   - Examining the startAngle and endAngle values
   - Finding that endAngle is set to 90 degrees (3 o'clock) instead of 140 degrees (5 o'clock)
   - Correcting the endAngle constant to allow full rotation

3. **Disappearing switch images**:
   - Setting a conditional breakpoint on the SwitchImage source binding
   - Examining the filename pattern in the expression evaluator
   - Noticing that the checked image filenames include a hyphen before "Checked"
   - Fixing the string template to add the missing hyphen

The debugging process demonstrates how to systematically isolate and fix issues using the QML debugger's various features.

The solution code is thoroughly commented to help you understand the approach and techniques used. The solution only demonstrates the basic solution and not the stretch goals.

## Stretch Goals

Once you've completed the basic challenge, you can extend your debugging skills with these additional goals:

- Practice **setting and hitting breakpoints** and commit the debugger stepping operations' keyboard shortcuts to memory
- Add breakpoints for **function calls** and practice the difference between "step in", "step over", "step out", and "run to line"
- Create **conditional breakpoints** for specific scenarios (e.g., when a dial value exceeds 75)
- Make the dials deliberately rotate in the **opposite direction** and check values in the expression evaluator
- Add **expression evaluators** that are not just properties but JavaScript expressions
  - For example, evaluate entire string templates to test different conditions
- Explore additional debugging operations, such as **attaching the debugger** to an already running application
- **Read the documentation** to fully familiarize yourself with all features and shortcuts

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

After completing this challenge, we encourage you to continue your learning journey with more courses at Qt Academy. The debugging skills you've developed here will prove invaluable as you build more complex applications and need to troubleshoot issues efficiently.

### Share Your Work

We strongly encourage you to **share your debugging experience** with the Qt community! Sharing your process helps others learn and may provide you with additional insights.

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

This code repository contains code samples and other materials designed to help you learn and practice QML development. The materials provided are intended for educational purposes to help test your understanding of **debugging techniques** and gain confidence in finding and fixing issues in QML applications.

### Terms and Conditions

If you, your employer, or the legal entity you act on behalf of hold commercial license(s) with a Qt Group entity, this software package constitutes Pre-Release Code under the Qt License/Frame Agreement governing those licenses, and that agreement's terms and conditions govern your access and use of this software package.

This software package may provide links or access to third party libraries or code (collectively "Third-Party Software") to implement various functions. Use or distribution of Third-Party Software is discretionary and in all respects subject to applicable license terms of applicable third-party right holders.

### Third-Party Attributions

#### Fonts

- The [Prisma](/00-Assets/fonts/Prisma.ttf) font was created by [Dieter Steffman](http://www.steffmann.de/) and originally designed by Rudolf Koch for the type foundry Klingspor Brothers (Offenbach/M.), 1932. It was downloaded from [DaFont](https://www.dafont.com/prisma.font) and is licensed under attribution to the original creator, Dieter Steffman.

- The [RussoOne](/00-Assets/fonts/RussoOne-Regular.ttf) font was created by [Ivan Gladkikh](https://typetype.org/) and is licensed under the [SIL Open Font License](/LICENSES/OFL.txt).

#### Images

- The images used in this project are sourced and adapted from [Dzianis Rakhuba](https://stock.adobe.com) / stock.adobe.com
