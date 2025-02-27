# Introduction to QML Challenge

Welcome to the **Introduction to QML Challenge**! This challenge is designed to help you apply and test the skills you've gained from completing the Intro to QML course. By working through this practical exercise, you'll solidify your understanding of **QML fundamentals** and gain confidence in your ability to create simple yet effective QML applications.

## Introduction

Learning from a course provides you with information, but exercising that knowledge through practical application leads to a richer understanding. This challenge will give you the opportunity to:

- Demonstrate your foundational **QML knowledge**
- Apply what you've learned in a practical context
- Gain confidence in your QML skills

Upon completion, you'll feel comfortable progressing to other courses in the Qt Academy, such as the **Intro to Qt Quick** course.

## Challenge Brief

In this challenge, you'll design and create a simple application that displays business contact information in the form of a **business card**. You'll need to arrange various kinds of data (such as name and address) in a visually appealing layout, with some information revealed only when desired.

## Requirements

Your business card application implementation should include the following:

- **Window** having the size of a business card (approximately **1:1.586 ratio**)
- Use Items from [Qt Quick](https://doc.qt.io/qt-6/qtquick-index.html) such as [Window](https://doc.qt.io/qt-6/qml-qtquick-window.html), [Text](https://doc.qt.io/qt-6/qml-qtquick-text.html), [MouseArea](https://doc.qt.io/qt-6/qml-qtquick-mousearea.html)/[TapHandler](https://doc.qt.io/qt-6/qml-qtquick-taphandler.html), [Rectangle](https://doc.qt.io/qt-6/qml-qtquick-rectangle.html), [Image](https://doc.qt.io/qt-6/qml-qtquick-image.html)
- Use of [Anchors](https://doc.qt.io/qt-6/qtquick-positioning-anchors.html) to position Items within the application
- Create [property bindings](https://doc.qt.io/qt-6/qtqml-syntax-propertybinding.html) and [signal handlers](https://doc.qt.io/qt-6/qtqml-syntax-signals.html)
- A Text element for each of the **ContactInfo properties**
- The **name and photo image** should be shown all the time
- The other ContactInfo properties should be grouped into two categories: **"Basic Info"** and **"Details"**
- Create a **button** using a MouseArea or TapHandler that can be used to **toggle** the display showing either the "Basic Info" or "Details", showing different colors for checked and clicking states
- Use a **larger font size** for the main Text items and a slightly smaller font for the rest of the Text items

## Stretch Goals

Once you've completed the basic challenge, you can extend your skills with these additional goals:

- Reduce the repetition in your solution by creating **re-usable inline components** for the TitleText, HeadingText, and BodyText to tidy everything up
- Create a re-usable inline component for the **Button** - you'll need to add a **property alias** for the text
- Create a **unified theme** for your components using color properties. You may choose different colors or even explore some of the Qt global object color functions such as [`Qt.rgba()`](https://doc.qt.io/qt-6/qml-qtqml-qt.html#rgba-method) or [`Qt.hsla()`](https://doc.qt.io/qt-6/qml-qtqml-qt.html#hsla-method) to set your colors
- Make it possible to **click the website address** using the [`Qt.openUrlExternally()`](https://doc.qt.io/qt-6/qml-qtqml-qt.html#openUrlExternally-method) function

## Overview of Starting Project

To help you focus on being creative in your problem-solving, we've prepared a basic project template for you. This template contains all the necessary project setup and resources required for the challenge. You can find it in the [StartingProject](./StartingProject/) folder in this repository.

The starting project includes:

- A **CMakeLists.txt** file configured for the challenge
- A **Main.qml** template file
- An **IDPhoto.png** resource
- The **ContactInfo** object with all required properties

## Overview of Solution

While there are many ways to meet the requirements of this challenge, a sample solution is provided in the [SolutionProject](./SolutionProject/) folder. This solution demonstrates:

- Creating a properly sized window with a **business card ratio**
- Using **Rectangles with rounded corners** for decoration and button styling
- Positioning elements with **anchors** to create a clean layout
- Implementing a **toggle button** to switch between "Basic Info" and "Details" views
- Using **property bindings** to ensure responsive design
- Setting appropriate **font properties** to emphasize important information

The solution code is thoroughly commented to help you understand the approach and techniques used.

## Useful Resources

- [Qt Documentation](https://doc.qt.io)
- [QML Documentation](https://doc.qt.io/qt-6/qmlreference.html)
- [Qt Quick Examples](https://doc.qt.io/qt-6/qtquick-codesamples.html)
- [QML Property Binding](https://doc.qt.io/qt-6/qtqml-syntax-propertybinding.html)
- [Positioning with Anchors](https://doc.qt.io/qt-6/qtquick-positioning-anchors.html)
- [Qt Academy](https://qt.io/academy)
- [Qt Forum](https://forum.qt.io)

## Next Steps

### Continue Learning

After completing this challenge, we encourage you to continue your learning journey with more courses from [Qt Academy](https://qt.io/academy). The skills you've developed here will provide a solid foundation for exploring more advanced topics in Qt and QML development.

### Share Your Work

We strongly encourage you to **share your project** with the Qt community! Posting your work helps you receive valuable feedback, showcase your progress, and inspire others who are on the same learning path.

To share your project:

- Post in the [Qt Forum's QML for Beginners challenge thread](https://forum.qt.io/category/73/qt-courses)
- Include **screenshots** of your business card application
- Consider creating a short **video demonstration** showing the interactive elements
- Share a **link to your repository** so others can see your implementation
- Describe any challenges you faced and how you overcame them
- Mention which stretch goals you tackled and how you approached them

Engaging with the community is a fantastic way to improve your skills and connect with other Qt developers around the world.

Happy coding!
