# Positioners and Layouts Challenge

Welcome to the **Positioners and Layouts Challenge**! This challenge is designed to help you apply and test the skills you've gained from completing the Positioners and Layouts course. By working through this practical exercise, you'll solidify your understanding of **Qt Quick Layout techniques** and gain confidence in creating responsive UI designs.

## Introduction

The Positioners and Layouts course introduced powerful layout techniques using Qt Quick Positioner components like [Row](https://doc.qt.io/qt-6/qml-qtquick-row.html) and [Column](https://doc.qt.io/qt-6/qml-qtquick-column.html), and their counterparts [RowLayout](https://doc.qt.io/qt-6/qml-qtquick-layouts-rowlayout.html) and [ColumnLayout](https://doc.qt.io/qt-6/qml-qtquick-layouts-columnlayout.html) among others. While the course provided the building blocks to arrange content, it also gave a preview of building responsive and adaptive layouts. This challenge allows you to explore that further and test what you have learned by choosing the best approach to create such a layout.

Learning from a course provides you with information, but exercising that knowledge through practical application leads to a richer understanding. This challenge will give you the opportunity to:

- Demonstrate your understanding of **Qt Quick Layouts**
- Apply responsive design principles to a real-world application
- Create flexible, maintainable UI structures that adapt to changing conditions

Upon completion, you'll feel comfortable applying these layout techniques in your own projects.

## Challenge Brief

In this challenge, you'll design and build the basic elements of a **chat application** - focusing on making the design **responsive** rather than making it actually functional.

Being responsive simply means that Items re-position and resize appropriately as their parent items or window change position and size, but the overall layout structure stays the same. It's similar to considering Items as being somewhat "elastic."

The aim of the challenge is to become more familiar with planning your visual layout using Qt Quick Positioners and Layouts by defining one responsive layout for a desktop display. You'll quickly discover that by using Qt Quick Layouts you can create very flexible layouts easily!

## Requirements

Your chat application should include the following:

- Use [Qt Quick Layouts](https://doc.qt.io/qt-6/qtquicklayouts-index.html) to design a suitable **Desktop Layout** for your application
- Use the **Layout attached properties** such as:
  - `Layout.fillWidth` and `Layout.fillHeight`
  - `Layout.preferredWidth` and `Layout.preferredHeight`
  - `Layout.alignment` and `Layout.margins` to customize the layouts
- Create sections in your application showing:
  - The **name of the person** who you are chatting with
  - A **two-way conversation** using "chat bubbles" (this can be static content for now)
  - A **text input** for writing a potential reply
  - A **send button**
- The **chat bubbles** should:
  - Contain some text
  - Be positioned on the left or right depending on whose chat bubble it is (similar to popular messaging apps)
  - Have alternating colors to distinguish between participants

## Overview of Starting Project

To help you focus on being creative in your problem-solving, we've prepared a basic project template for you. This template contains the necessary project setup to get you started. You can find it in the [StartingProject](./StartingProject/) folder in this repository.

The starting project includes:

- A **CMakeLists.txt** file with a ready main.cpp and Main.qml file
- A simple **Qt Quick Controls ApplicationWindow** with some initial properties

The starting project doesn't come with any other resources such as images or fonts, but you are free to add your own as desired for your design. Remember to add any resources you use to the RESOURCES property in the QT_add_qml_module() function in your CMakeLists.txt file.

## Overview of Solution

A sample solution is provided in the [SolutionProject](./SolutionProject/) folder that demonstrates one approach to meeting the challenge requirements. This solution shows:

- A **three-column layout** using RowLayout:
  - Left column: List of chat contacts
  - Middle column: Current chat header and reply area
  - Right column: Chat conversation with alternating chat bubbles
- **Responsive behavior** where:
  - The left and middle columns maintain fixed widths
  - The right column (chat area) expands and contracts with window resizing
  - Chat bubbles reflow text and adjust their size as the available space changes
  - The send button stays at the bottom while the reply area expands vertically with the window
- **Custom components** including:
  - ChatList: A list of buttons to select different conversations
  - ChatHeader: Shows the name of the current chat partner
  - ChatFooter: Contains the reply text area and send button
  - ChatFlickable: A scrollable area containing the chat bubbles
  - ChatBubble: Individual message bubbles that position themselves left or right

Key techniques demonstrated include:

- **Nested layouts** (RowLayouts inside ColumnLayouts and vice versa)
- Proper use of **Layout attached properties** to control sizing behavior
- Using **Flickable** for scrolling content that exceeds the available space
- **Responsive text wrapping** in chat bubbles
- Dynamic UI updates based on user interaction

The solution code is thoroughly commented to help you understand the approach and techniques used. The solution only demonstrates the basic solution and not the stretch goals.

## Stretch Goals

Once you've completed the basic responsive layout challenge, you can extend your skills by making the layout **adaptive** rather than just responsive. While responsive layouts consider the elastic nature of items, adaptive layouts offer complete layout changes at run-time to optimize the content for different screen sizes or devices.

For this extension challenge:

- Make your application have separate **desktop and mobile layouts** that can switch between the two as the window size changes
- Use [LayoutItemProxy](https://doc.qt.io/qt-6/qml-qtquick-layouts-layoutitemproxy.html) to achieve this (as introduced in the final part of the Positioners and Layouts course)
- Consider the following approach:
  - Move items in the top-level layout outside of the layout (as children of the window)
  - Add LayoutItemProxy items targeting them in their place
  - Provide the desired Layout attached properties on the LayoutItemProxy items, not on the actual items
  - Create a new layout design for the "mobile" view
  - Add window width break points to determine when to switch between layouts
  - Consider using a [StackLayout](https://doc.qt.io/qt-6/qml-qtquick-layouts-stacklayout.html) with a [TabBar](https://doc.qt.io/qt-6/qml-qtquick-controls2-tabbar.html) and [TabButton](https://doc.qt.io/qt-6/qml-qtquick-controls2-tabbutton.html) to show different chat conversations in the mobile layout
  - Think about how the layout might need to change if the dimensions were portrait vs landscape

## Useful Resources

- [Qt Quick Layouts Overview](https://doc.qt.io/qt-6/qtquicklayouts-index.html)
- [RowLayout Documentation](https://doc.qt.io/qt-6/qml-qtquick-layouts-rowlayout.html)
- [ColumnLayout Documentation](https://doc.qt.io/qt-6/qml-qtquick-layouts-columnlayout.html)
- [Layout Attached Properties](https://doc.qt.io/qt-6/qml-qtquick-layouts-layout.html)
- [LayoutItemProxy Documentation](https://doc.qt.io/qt-6/qml-qtquick-layouts-layoutitemproxy.html)
- [Flickable Documentation](https://doc.qt.io/qt-6/qml-qtquick-flickable.html)
- [Qt Quick Controls Documentation](https://doc.qt.io/qt-6/qtquickcontrols-index.html)
- [Repeater Documentation](https://doc.qt.io/qt-6/qml-qtquick-repeater.html)
- [Qt Quick Examples](https://doc.qt.io/qt-6/qtquick-codesamples.html)
- [Qt Academy](https://qt.io/academy)
- [Qt Forum](https://forum.qt.io)

## Next Steps

### Continue Learning

After completing this challenge, we encourage you to continue your learning journey with more courses at Qt Academy. The skills you've developed here in creating responsive and adaptive layouts will provide a solid foundation for building more complex applications that can adapt to different screen sizes and orientations.

### Share Your Work

We strongly encourage you to **share your project** with the Qt community! Posting your work helps you receive valuable feedback, showcase your progress, and inspire others who are on the same learning path.

To share your project:

- Post in the [Qt Forum's Positioners and Layouts challenge thread](https://forum.qt.io/category/73/qt-courses)
- Include **screenshots** of your chat application at different window sizes to demonstrate responsiveness
- If you completed the stretch goal, include screenshots showing the adaptive layout
- Consider creating a short **video demonstration** showing how your layout responds to size changes
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

This code repository contains code samples and other materials designed to help you learn and practice QML development. The materials provided are intended for educational purposes to help test the skils of **Qt Quick Layout techniques** and gain confidence in creating responsive UI designs.

### Terms and Conditions

If you, your employer, or the legal entity you act on behalf of hold commercial license(s) with a Qt Group entity, this software package constitutes Pre-Release Code under the Qt License/Frame Agreement governing those licenses, and that agreement's terms and conditions govern your access and use of this software package.

This software package may provide links or access to third party libraries or code (collectively "Third-Party Software") to implement various functions. Use or distribution of Third-Party Software is discretionary and in all respects subject to applicable license terms of applicable third-party right holders.

### Third-Party Attributions

- The icons used in this project are sourced from [Material Symbols Library](https://fonts.google.com/icons) provided by Google. The icons are available under the [Apache License Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).
