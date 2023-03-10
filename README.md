
<h1 align="center"> GNB App </h1>

<h4 align="center">iOS demo app</h4>

<p align="center">
    <img src="https://img.shields.io/badge/language-swift-red">
    <br>
    <img src="https://img.shields.io/badge/-mvvm-blue">
    <br>
    <img src="https://img.shields.io/badge/-async%2Fawait-orange">
</p>

## Content
 * Clean architecture + MVVM for the presentation layer
 * No third party libraries used
 * Some unit tests
 * Localized into ES and EN
 * Configuration files
 * Async/await
 * UILayer with SwiftUI
 * Developed following a gitflow workflow for the repository
 
There is a Welcome screen, that leads to a Home screen where we can see alist of products. Each product row is tapable, which leads to a new detail screen in which we can see the total amount for the transactions of that product, in EUR currency, and the list of transactions as well.

<details>
  <summary>Video preview</summary>
  
https://user-images.githubusercontent.com/48457119/211371324-2a7c5cbf-0b6e-4834-bbde-e66a9ea9a0d3.mp4

</details>

## Improvements
The app was developed just in a few hours so there is room for improvements:
- Add UI Tests.
- Separation of the different modules into their single respective SPM Module, so we can apply a modular architecture.
- The exchange Rate algorithm to look for a conversion is pretty ad-hoc. It would be nice to abstract the functionlaity as template so it could be used in an abstract object (Tree or Graph, for example)
- Develop a DI injector or use a third-party library like Swinject or Resolver to remove the Singleton "Injector"







