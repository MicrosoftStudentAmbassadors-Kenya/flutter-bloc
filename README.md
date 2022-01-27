# blocapp

A new Flutter project, that delves deeper in to working BLoC as a state management tool.
Backed by Google and Felix Angelov this amazing tool has a lot to help build amazing apps.


## Required-ish.

What is assumed before engagingwith this repository is:

1. Some practical knowledge in Flutter is really handy in understanding how this will help in building your apps.
1. Understanding the tree structure of widgets in Flutter.
1. Understanding of Dart, null safety and types.
1. A Desire to achieve more ;)


# What is BLoC?


## BLoC Terminologies.

| Keyword | README |
| ------ | ------ |
| BlocListener | This is a Flutter widget that listens to any states changing. |
| BlocProvider | Creates & Provides the only instance of a Bloc to the subtree. |
| BlocBuilder | A widget that re-builds the UI for every new state coming from the Bloc. |
| BlocConsumer | A widget which combines both BlocListener and BlocBuilder in to a single widget. |
| RepositoryProvider | A widget that provides a unique instance of a Repository instead of a Bloc |


* `BlocBuilder` - Re-builds the UI for every new state coming from the bloc. This means the builder fn may be called multiple times per state due to how Flutter Engine works.


* `BlocListener` -This is a Flutter widget that listens to any states changing. It takes a void listener fn called once per state, not including the initial state. 

Optional listenWhen fn as optional buildWhen for BlocBuilder. Similar structure to BlocBuilder but different in many ways.


* `BlocProvider` - Creates & Provides the only instance of a bloc to the subtree.

* `RepositoryProvider` - Is a widget similar to the BlocProvider, except that it only provides a a unique instance of a Repository instead of a Bloc.

* `BlocConsumer` - This is a widget which combines both 'BlocListener' and 'BlocBuilder' in to a single widget. This means instead of writing BlocListener on top of BlocBuilder, we can write both of them inside the BlocConsumer widget.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
