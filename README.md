# blocapp

A Fluuter application that uses the Bloc architecture. This application will help us understand what Bloc is:
1. A Design Pattern.
1. A State Management Library.
1. An Architectural Pattern.

![Bloc Architecture Definition](https://user-images.githubusercontent.com/46367331/151332504-5e99bd55-aec1-41eb-9676-dfff233319ce.png)


## Required-ish.

What is assumed before engagingwith this repository is:

1. Some practical knowledge in Flutter is really handy in understanding how this will help in building your apps.
1. Understanding the tree structure of widgets in Flutter.
1. Understanding of Dart, null safety and types.
1. A Desire to achieve more ;)


# What is BLoC? 
- [Reference Material](https://pub.dev/packages/bloc) - Bloc Docs. 

* A predictable state management library that helps implement the BLoC (Business Logic Component) design pattern.

This design pattern helps to separate presentation from business logic. Following the BLoC pattern facilitates testability and reusability. This package abstracts reactive aspects of the pattern allowing developers to focus on writing the business logic.

## BLoC Terminologies.

| Keyword | README |
| ------ | ------ |
| Cubit | A class which extends BlocBase and can be extended to manage any type of state. |
| BlocListener | This is a Flutter widget that listens to any states changing. |
| BlocProvider | Creates & Provides the only instance of a Bloc to the subtree. |
| BlocBuilder | A widget that re-builds the UI for every new state coming from the Bloc. |
| BlocConsumer | A widget which combines both BlocListener and BlocBuilder in to a single widget. |
| RepositoryProvider | A widget that provides a unique instance of a Repository instead of a Bloc |

* `async*` - An async generator function that returns an asynchronous stream of data.

* `cubit` - This is a special kind of stream component, based on fn called from the UI, (not part of a stream) that rebuild the UI, by emitting different states on a stream. As compared to bloc, the cubit fns are not part of a stream, rather a simple pre-baked list of what a cubit can do. It is a subset of Bloc, where it Bloc extends Cubit.

* `bloc` - An advanced class which relies on events to trigger state changes rather than functions. However, rather than calling a function on a Bloc and directly emitting a new state, Blocs receive events and convert the incoming events into outgoing states. Bloc also extends BlocBase which means it has a similar public API as Cubit.

* `BlocBuilder` - Re-builds the UI for every new state coming from the bloc. This means the builder fn may be called multiple times per state due to how Flutter Engine works.


* `BlocListener` -This is a Flutter widget that listens to any states changing. It takes a void listener fn called once per state, not including the initial state. 

Optional listenWhen fn as optional buildWhen for BlocBuilder. Similar structure to BlocBuilder but different in many ways.


* `BlocProvider` - Creates & Provides the only instance of a bloc to the subtree.

* `RepositoryProvider` - Is a widget similar to the BlocProvider, except that it only provides a a unique instance of a Repository instead of a Bloc.

* Repository Class - This is a class which has the main functions that enable Flutter communicate with the outer data layer, such as the APIs, the databases etc.

* `BlocConsumer` - This is a widget which combines both 'BlocListener' and 'BlocBuilder' in to a single widget. This means instead of writing BlocListener on top of BlocBuilder, we can write both of them inside the BlocConsumer widget.

As our app grows so do our Blocs, so hoow do we keep track of all the Blocs in our app, we use MultiBlocProvider, MultiBlocListener and MultiRepositoryProvider to pass our Blocs respectively.

# Why would you use `bloc` instead of `cubit`?
1. Bloc not only emits a stream of states but also receives a stream of events, unlike cubit which only receives a set of pre-baked fns.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
