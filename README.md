# blocapp

A Flutter application that uses the Bloc architecture. This application will help us understand why Bloc is:
1. A Design Pattern.
1. A State Management Library.
1. An Architectural Pattern.

## Required-ish.

What is assumed before engagingwith this repository is:

1. Understanding of Dart, null safety and types.
1. Some practical knowledge in Flutter is really handy in understanding how this will help in building your apps.
1. Understanding the tree structure of widgets in Flutter.
1. A Desire to achieve more ;)


# Architecture Definition.

![Bloc Architecture Definition](https://user-images.githubusercontent.com/46367331/151333886-8fa43ca2-d53f-4733-8778-bba919828f18.png)


### Where do I start now that I know how to code?

Typically, one begins at the data layer, where you start by defining your universal abstract models, your data provider, and your repositories.

## Data Layer.
![Data Layer Representation](https://user-images.githubusercontent.com/46367331/151334561-146181d1-0b91-46d5-9fd3-74203ff4a91d.png)

1. A `model` is a blueprint to the data your application will work with.

1. A `data provider` is typically an API for your app, typically a class with different methods that serve as a communication with external data sources.

1. A `repository` is where we we will have our Model classes instantiated as objects. It is a wrapper around more than one data providers.
Here data can be fine-tuned before sending it to the Business Logic Layer.

![Data Request-Response Representation](https://user-images.githubusercontent.com/46367331/151333995-bc1c3623-8182-4edc-8362-a9d96f5336f7.png)

## Business Logic Layer.
* The Business Logic Area is where all the Blocs and Cubits will be created and reside. Its main responsibility is to respond to the user input from the presentation layer with new emitted states.

* As the mediator between the Presentation Layer and the Data Layer, this is the last layer that can intercept and catch any errorsfrom within the data layer and protect the app from crashing.

* It is worth noting that blocs and cubits can communicate with one another, such as a bloc for listening whether an internet connection is present, this will have to be overridden by .close() methos to avoid leaks, but will tell other blocs, "hey guys no internet" state.

## Presentation Layer.

* Final layer where the user gets the presented data, is the User Interface, has widgets, user inputs, lifecycle events, animations etc.
Its responsible of `rendering itself`, based on one or more bloc states.


# Testing.

* `CODE is CODE and CODE will BREAK!`
Testing helps pre-empt some errors that might be a problem.

 
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

The BuildContext doesn't know where to provide the existing unique instance of the bloc/cubit. Local Access means providing an instance of a bloc/cubit to a single screen (to its entire widget tree.)

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
