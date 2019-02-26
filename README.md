# day_selector

Flutter widget to select week day easily, week day or workable day mode are available, same as unique, multiple selection

## Usage

```dart
DaySelector(
  onChange: (value) {},
  color: Colors.red,
  mode: DaySelector.modeFull
),

```

`onChange`: callback when a day is selected or unselected
`color`: background color of the selector
`mode`: select days showed by the selector, default to workday