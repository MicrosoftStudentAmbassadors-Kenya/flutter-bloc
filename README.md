# blocapp

A Flutter application that uses the Bloc architecture. This application will help us understand why Bloc is:
1. A Design Pattern.
1. A State Management Library.
1. An Architectural Pattern.

### File Structure.
```
.
├── logic
│   └── cubit
|       ├── counter_cubit.dart
│       └── counter_state.dart
├── presentation
│   └── screens
|       ├── home_screen.dart
│       ├── second_screen.dart
│       └── third_screen.dart
├── test
│   └── counter_cubit_test.dart
└── main.dart
```

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

# Routing.

Navigation within Flutter apps can be configured to use either:

1. `Anonymous Routing` - which is recommended for `SMALL` projects.

1. `Named Routing` - Recommended for `MEDIUM` projects.

1. `Generated Routing` - Recommended for `LARGE` projects.

The GOAL is to `provide a unique instance of a bloc/cubit, meaning there shouldn't be MULTIPLE instances of the same bloc/cubit` within your app.

It is worth noting that `BlocProvider` - creates a new instance of a bloc/cubit, and `BlocProvider.value()` takes an already created instance then provides it further in the subtree.

### How to provision bloc/cubit instances.

a. `Locally` - This is when you want to provide the instance to a single screen.

b. `Specifically` - When you want to specifically provide an instance across one or more screens.

c. `Globally` - When you want to provide an instance across all your screens.


![Types of Routing in Flutter](https://user-images.githubusercontent.com/46367331/151413441-055a05d0-4318-4b19-9d96-1f915f5b41d4.png)

## Anonymous Routing.

![Anonymous Routing](https://user-images.githubusercontent.com/46367331/151413566-bbd8c587-14b8-4ee7-a523-2de9615654b4.png)

## Named Routing.

* Why use `Named Routing`?
![Named Routing Benefits](https://user-images.githubusercontent.com/46367331/151414354-dfc90a72-1334-41c7-8bc5-a1666f549837.png)


![Named Routing Example](https://user-images.githubusercontent.com/46367331/151414294-e4b09257-7666-4a3e-9478-4d0ed2340bc0.png)


## Generated Routing.

* This Route Access Method is similar to `Named Routing`, thus sharing some advantages. 
* Though similar, there are some differences such as `Generated Route - Integrates the entire navigation feature inside one file and function.`
* This declutters the main.dart file, destructuring the code, making it more maintainable and easier to understand and navigate.

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


<!-- TO-DO: ADD IMAGE MultiBlocProvider. -->


### Why not just use the BuildContext?

* The BuildContext doesn't know where to provide the existing unique instance of the bloc/cubit. Local Access means providing an instance of a bloc/cubit to a single screen (to its entire widget tree.)

# Why would you use `bloc` instead of `cubit`?
1. Bloc not only emits a stream of states but also receives a stream of events, unlike cubit which only receives a set of pre-baked fns.

 # Getting Started

This project is a starting point for a Flutter application using Bloc, as a Design Pattern, State management library.

Before cloning the app ensure you have Flutter `2.8.1^` and above installed.

1. Clone the app by running:

```sh

git clone git@github.com:MicrosoftStudentAmbassadors-Kenya/flutter-bloc.git

cd flutter-bloc

flutter pub get

```

1. After getting all the required packages you can run the tests by running:

```sh

flutter test

```

1. Run the application by running:

```sh

flutter run -d linux

```

# BuildContext in Flutter.

* Be able to understand & tackle different scenarios to see how `BuildContext` can cause the unwanted BlocProvider.of() fails to find a context containing a specific bloc/cubit.

- Remember everything in Flutter is a widget and that Flutter uses a `widget tree`, to organize & structure the widgets you've set up in your application.

## But how is a widget restructured?

* You guessed it `BuildContext`. So what is it?

- It is somewhat a tool which helps handle the location of a widget inside the widget.

* So you're saying every widget is built within a context, right ? Absolutely correct. But not all widget have a user accessible context.

- For instance a Text(widget), will be built within a context, but that context will be anonymous.


## Let's restructure our thinking.

* Here are some `completely wrong assumptions` you might have made during the development of your app.

1. That since (in the example below), the context(1) is the same, as context(2), and is the same as context(3), since they have the same name.


```sh

@override
  Widget build(BuildContext context(1)) {
    return MultiBlocProvider(
        providers: [
            BlocProvider<InternetCubit>(
                create (context(2)) => InternetCubit(connectivity: connectivity),
            ),
            BlocProvider<CounterCubit>(
                create (context(2)) => CounterCubit(),
            ),
        ]
    )
  }
}

```

* It is key to understand that `context`, in each case (context(2) & context(3)) is the name of a BuildContext instance, which is passed as an argument to different functions. THis means there will be different values passed as argument(s), even though the name is the same.

* This means that we can imagine the name context as being the BuildContext in which the current widget is being created. This means the following app will run just fine, which is recommended practice in developing your apps.


```sh

@override
  Widget build(BuildContext myAppContext) {
    return MultiBlocProvider(
        providers: [
            BlocProvider<InternetCubit>(
                create (internetCubitCOntext) => InternetCubit(connectivity: connectivity),
            ),
            BlocProvider<CounterCubit>(
                create (counterCubitContext) => CounterCubit(),
            ),
        ]
    )
  }
}

```
---------------------------------------------------------------

2. That if there is no context instance passed to a widget, then it isn't built within a BuildContext.


```sh

MaterialButton(
    color: widget.color,
    onPressed: () {
        Navigator.of(context).pushNamed('/second');
    },
    child: const Text('Go to second screen.'),
),

```

* It is worth noting that every widget in FLutter has a BuildContext. Some like the above may not be outwardly called in a fn but exist. Within every widget there is a BuildContext and will be placed correctly inside the widget tree.




---------------------------------------------------------------

3. That if the context in which the next child will built, won't be related to the parent context inside the widget tree.


<!-- TO-DO: ADD IMAGE. -->


* It is essential to know that the BuildContext of a widget keeps track only of its direct parent and nothing else.


<!-- TO-DO: ADD IMAGE. -->


* The relationship between BuildContexts is a `Bottom-up` relationship, since the only way a widget can know what's at the top of the tree is to start from the bottom child and work its way up asking at each step for every parent that is above, until it reaches the top.

* BuildContext only cares about its parent context. It doesn't hold or record any information about its child or children. THis helps us understand that the only way you can move inside a widget tree, is by choosing the context and navigating up.


---------------------------------------------------------------












