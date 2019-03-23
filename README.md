# day_selector

Flutter widget to select week day easily, week day or workable day mode are available, same as unique, multiple selection

## Usage

```dart
DaySelector(
  value: null,
  onChange: (value) {},
  color: Colors.red,
  mode: DaySelector.modeFull
),

```

`value`: set the initial value of the widget, as int
`onChange`: callback when a day is selected or unselected, selected day are represented as an integer value
`color`: background color of the selector
`mode`: select days showed by the selector, default to workday

## Allowing only few days
Available days are selected with `mode` parameter, by default you have two mode:

- full the will show all days
- workdays that will not show sunday

If you want your own days, you can do it like this: 

```dart
DaySelector(
  value: null,
  onChange: (value) {},
  color: Colors.red,
  mode: DaySelector.monday | DaySelector.friday,
),

```