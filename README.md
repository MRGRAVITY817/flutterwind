# Flutterwind

Style your Flutter widgets with TailwindCSS-like syntax.

## Example: A simple card

###  Without Flutterwind - 39 lines of code

```dart
Container(
  padding: EdgeInsets.all(8),
  margin: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Hello World',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        'This is a simple card',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.grey.shade600,
        ),
      ),
    ],
  ),
)
```

### With Flutterwind - 17 lines of code 😁

```dart
FwContainer(
  style: "p-8 m-8 bg-white rounded-lg shadow-md",
  child: FwFlex(
    style: "flex-col items-center justify-center",
    children: [
      FwText(
        "Hello World",
        style: "text-2xl font-bold text-black",
      ),
      const SizedBox(height: 8),
      FwText(
        "This is a simple card",
        style: "text-base font-normal text-gray-600",
      ),
    ],
  ),
)
```




