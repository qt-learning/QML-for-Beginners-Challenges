# Introduction to Qt Quick Controls Challenge

Welcome to the **Introduction to Qt Quick Controls Challenge**! This challenge is designed to help you apply and test the skills you've gained from completing the Introduction to Qt Quick Controls course. By working through this practical exercise, you'll solidify your understanding of **Qt Quick Controls** and gain confidence in your ability to create rich interactive applications.

## Introduction

Learning from a course provides you with information, but exercising that knowledge through practical application leads to a richer understanding. This challenge will give you the opportunity to:

- Demonstrate your foundational **Qt Quick Controls knowledge**
- Apply what you've learned in a practical context
- Gain confidence in your Qt Quick Controls skills

Upon completion, you'll feel comfortable progressing to other courses at Qt Academy that will prepare you for your onward Qt journey.

## Challenge Brief

In this challenge, you'll design and create a simple **restaurant menu ordering application** that uses a variety of Qt Quick Controls to implement the UI. Your menu should advertise different items that can be ordered with their prices. You'll include a way to select the quantity of each item and show the calculated order total. The application will also include a button which causes a message to display showing the order is being processed and when it is complete.

The aim of this challenge is to use and become familiar with as many of the Qt Quick Controls as you wish, looking particularly at [ApplicationWindow](https://doc.qt.io/qt-6/qml-qtquick-controls2-applicationwindow.html), [Page](https://doc.qt.io/qt-6/qml-qtquick-controls2-page.html), and [Pane](https://doc.qt.io/qt-6/qml-qtquick-controls2-pane.html) as great ways to group and organize visual content.

## Requirements

Your menu ordering application should contain the following:

- A variety of **Controls** from the [Qt Quick Controls](https://doc.qt.io/qt-6/qtquickcontrols-index.html) module such as [Page](https://doc.qt.io/qt-6/qml-qtquick-controls2-page.html), [Pane](https://doc.qt.io/qt-6/qml-qtquick-controls2-pane.html), [Button](https://doc.qt.io/qt-6/qml-qtquick-controls2-button.html), [Slider](https://doc.qt.io/qt-6/qml-qtquick-controls2-slider.html), [RadioButton](https://doc.qt.io/qt-6/qml-qtquick-controls2-radiobutton.html), or [Dial](https://doc.qt.io/qt-6/qml-qtquick-controls2-dial.html)
- An **ApplicationWindow** that has a suitably appetising-looking background
- A **restaurant name** that you can put in the ApplicationWindow title and header
- A **cuisine-themed font** to use across your whole design
- Change the ApplicationWindow **palette** to customize the colors of your Controls
- Organize your menu into visual **Pages** with titles for Starters, Mains, and Desserts, listing menu items, showing a price and a quantity selection
- The **total cost** of the selected items should be shown in the ApplicationWindow footer
- Consider how your design could be made from **re-usable components** as QML Files
- Add a **Button** for "submitting" the order and show a visual status that the order is busy being processed, and then completed. A [Timer](https://doc.qt.io/qt-6/qml-qtqml-timer.html) can be used to simulate this
- If using anchors to arrange your design becomes complex, try using [RowLayout](https://doc.qt.io/qt-6/qml-qtquick-layouts-rowlayout.html) and [ColumnLayout](https://doc.qt.io/qt-6/qml-qtquick-layouts-columnlayout.html) from the Qt Quick Layouts module

## Stretch Goals

Once you've completed the basic challenge, you can extend your skills with these additional goals:

- Use [TabBar](https://doc.qt.io/qt-6/qml-qtquick-controls2-tabbar.html), [TabButton](https://doc.qt.io/qt-6/qml-qtquick-controls2-tabbutton.html), and [StackLayout](https://doc.qt.io/qt-6/qml-qtquick-layouts-stacklayout.html) to separate meal courses into tabs and add a [PageIndicator](https://doc.qt.io/qt-6/qml-qtquick-controls2-pageindicator.html)
- Investigate the effect of using Control's **padding** and **inset** properties
- Ensure that your design is **responsive** to window size changes
- Replace the fake Popups with Qt Quick Controls [Dialog](https://doc.qt.io/qt-6/qml-qtquick-controls2-dialog.html) and commonize the design
- Use Qt Quick [Positioner](https://doc.qt.io/qt-6/qtquick-positioning-layouts.html) and [Layouts](https://doc.qt.io/qt-6/qtquicklayouts-index.html) components to see how they help with otherwise complex anchoring
- Create a **Dark mode Palette** and a way to switch between light and dark Palettes. Hint: You can use the `Application.styleHints.colorScheme` which changes automatically with your system mode. You should also try using the provided dark mode images and incorporating them into the code using a dynamic image URL

## Overview of Starting Project

To help you focus on being creative in your problem-solving, we've prepared a basic project template for you. This template contains all the necessary project setup to get you started. You can find it in the [StartingProject](./StartingProject/) folder in this repository.

The starting project includes:

- A **CMakeLists.txt** file with a ready main.cpp and Main.qml file
- A simple **Qt Quick Controls ApplicationWindow** with some initial properties to get you going

The starting project doesn't come with any images or fonts, but you are free to add your own as needed for your design. Remember to add any resources you use to the RESOURCES property in the QT_add_qml_module() function in your CMakeLists.txt file.

## Overview of Solution

While there are many ways to meet the requirements of this challenge, a sample solution is provided in the [SolutionProject](./SolutionProject/) folder. This solution demonstrates:

- Using **ApplicationWindow** with background, header, and footer components to organize the layout
- Setting a **custom font** and **palette** application-wide
- Creating **re-usable QML components** for menu sections and labels
- Using **property bindings** to calculate order totals automatically
- Implementing **interactive elements** like SpinBox, RadioButton, Dial, and Slider
- Using **Timer** to control the order processing workflow
- Organizing content with [RowLayout](https://doc.qt.io/qt-6/qml-qtquick-layouts-rowlayout.html) and [ColumnLayout](https://doc.qt.io/qt-6/qml-qtquick-layouts-columnlayout.html) to simplify positioning

The key components of the solution include:

- **MenuLabel**: A component combining a Label and SpinBox to show item name, price, and quantity selection
- **MenuSection**: A Page containing multiple MenuLabels organized in a ColumnLayout
- **Order processing UI**: Simple Panes that appear over the main UI, controlled by a Timer

The solution code is thoroughly commented to help you understand the approach and techniques used. The solution only demonstrates the basic solution and not the stretch goals.

## Useful Resources

- [Qt Documentation](https://doc.qt.io)
- [Qt Quick Controls Documentation](https://doc.qt.io/qt-6/qtquickcontrols-index.html)
- [ApplicationWindow Documentation](https://doc.qt.io/qt-6/qml-qtquick-controls2-applicationwindow.html)
- [Page Documentation](https://doc.qt.io/qt-6/qml-qtquick-controls2-page.html)
- [Styling Qt Quick Controls](https://doc.qt.io/qt-6/qtquickcontrols2-styles.html)
- [Qt Quick Layouts Documentation](https://doc.qt.io/qt-6/qtquicklayouts-index.html)
- [Qt Quick Controls Examples](https://doc.qt.io/qt-6/qtquickcontrols-examples.html)
- [Customizing Qt Quick Controls](https://doc.qt.io/qt-6/qtquickcontrols2-customize.html)
- [Qt Quick Examples](https://doc.qt.io/qt-6/qtquick-codesamples.html)
- [Qt Academy](https://qt.io/academy)
- [Qt Forum](https://forum.qt.io)

## Next Steps

### Continue Learning

After completing this challenge, we encourage you to continue your learning journey with more courses at [Qt Academy](https://qt.io/academy). The skills you've developed here will provide a solid foundation for exploring more advanced topics in Qt and QML development, including Qt Quick Layouts which was briefly introduced in this challenge.

### Share Your Work

We strongly encourage you to **share your project** with the Qt community! Posting your work helps you receive valuable feedback, showcase your progress, and inspire others who are on the same learning path.

To share your project:

- Post in the [Qt Forum's Qt Quick Controls challenge thread](https://forum.qt.io/category/73/qt-courses)
- Include **screenshots** of your restaurant menu application
- Consider creating a short **video demonstration** showing the interactive elements
- Share a **link to your repository** so others can see your implementation
- Describe any challenges you faced and how you overcame them
- Mention which stretch goals you tackled and how you approached them

Engaging with the community is a fantastic way to improve your skills and connect with other Qt developers around the world.

Happy coding!
