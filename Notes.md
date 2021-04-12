# Notes

## Manage State

- Use ScopeModel Packages
- `ScopeModelDescendant<ScopeCounter>`
- notifyListeners()
- Floating Action Button

  - Onpressed
  - tooltip
  - child

- RaiseButton

- Wraparound scopeModel

  - model (context,child,model)

- Icon

  - Icons.Add

- TextFormField

- SnackBar

## Webview

- ThemeData
  primarySwatch
  fontFamily
  textTheme  
   button
  title

# Infocus

## Cb

- GestureTapCallback

## Btn

- RawMaterialButton
- ## Icons

## Shape

- StadiumBorder

## Struct Block

- can use `const`
- SizedBox
- Icon
- GestureDectector
- RotatedBox

- ListView
  - ItemCount
  - ItemExtent (Height)
  - ItemBuilder

* Wrap

* Align

* TabBar

  - Items
  - TabBuilder

* NavigationBar

* Switch

# Check platform

- TargetPlatform.android

## Theme

- textTheme
  - headline

* ThemeData

* CopyWith

## Context Pattern

- of

## Dialog

- Simple Diaglog

  - ContentPadding

- ActionSheet
- ShowModalPopup

## Stateful

- didUpdateWidget(Type oldWidget)

## Stream

- StreamBuilder

## Inhertited Widget

- Constructor (Child, field)

- updateShouldNotify

- Get accesss `context.inheritFromWidgetOfExactType().field`

- Static of method

- FocusScopec
- FittedBox

## keys

- ValueKey (todo)
- ObjectKey
- UniqueKey (distinct)
- PageStoreKey (Scroll)
- GlobalKey

## Web_view

- Constructor
  - Initial URL
  - JavascriptMode
  - OnWebViewCreated

* Controller

* Completer
* FutureBuilder

  - completer.future | completer.isCompleted

* gestureRecognizers

* PageController | PageView

* Hero

# Async

- Isolate
  - spawn

* Compute func

## Future

- then
- catchError

  - test

- FutureBuilder

- whenComplete
- value
- delayed
- Duration

## Stream

- listen
- onCancle
- onDone
- cancleOnCancle
- asBroadCastStream

* map
* where (filter)
* distinct

### Stream Controller

- sink
  - add

### Subscription

- pause
- resume
- cancle

### Timer

- periodic

- TRy Catch On Fianlly

## Generator

- sync\* yield
- yeild\*
