# Overview:

- iOS Swift (Tasks / Notes) Application using VIPER Architecture,  RxSwift, and RxCocoa.

This is a simple Todo and Notes application using VIPER architecture RxSwift, RxCocoa and CoreData, I prefer using Delegate Protocols rather than Third Party Library such as Rx but at this project I make it as an example on how to using VIPER with Rx.The application also support localization and I save the tasks or notes at CoreData.



# VIPER

VIPER is an application of Clean Architecture. The word VIPER is a backronym for View, Interactor, Presenter, Entity, and Routing (And I use another component called Contrcat). Clean Architecture divides an app’s logical structure into distinct layers of responsibility. This makes it easier to isolate dependencies (e.g. your database) and to test the interactions at the boundaries between layers.



# Key Features

- VIPER Architecture
- RxSwift, RxCocoa
- Splash Screen
- Localization
- CoreData
- Caching at UserDefaults
- Extensions (UITableView, UICollectionView)
- Extensions (UITableViewCell, UICollectionViewCell)
- Extensions for UI
- Date formatting
- Light & Dark mode
- Storyboards for UI



# App Structure

- App

- Extenions
-- Swift
-- UIKit

- Local
-- CoreDate
-- Caching
-- Models

- Modules
-- Base
-- Main
-- Tasks
-- Splash
-- Root
-- Navbar

- ReusableViews
-- AlertController
-- EmptyScreenController
-- LoadingController

- Resources

- Utilities



# Author

Created by Mohamed Elbana on 2020. Copyright © 2020 Mohamed Elbana.
[LinkedIN](https://www.linkedin.com/in/mohamed-elbana-a5a214ab)


Please don't hesitate to ask any clarifying questions about the project if you have any.

