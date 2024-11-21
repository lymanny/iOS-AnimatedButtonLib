
# AnimatedButtonLib 🚀

## 📚 Overview
`AnimatedButtonLib` is a Swift package that provides a powerful set of animations for `UIButton` and `UIView`, designed to enhance user interactions in iOS applications. These animations are easy to integrate, lightweight, and customizable, making it simple to add delightful visual effects to your app's UI.

## 🔑 Features
### UIButton Animations
- `pulsate()` - Adds a subtle pulsing effect to grab attention.
- `flash()` - Creates a quick flashing effect for emphasis.
- `shake()` - Applies a shaking motion to indicate errors or alerts.
- `press(completion:)` - Simulates a press effect with scaling animation and completion handler.

### UIView Animations
- `zoomIn()` / `zoomOut()` - Smoothly scales the view in and out.
- `zoomInWithEasing()` / `zoomOutWithEasing()` - Adds easing effects to zoom animations for a smoother experience.
- `bounce()` - Adds a spring-like bounce effect to views.
- `fadeIn()` / `fadeOut()` - Gradually fades views in or out for smooth transitions.

## 📋 Requirements
- iOS 13.0+
- Swift 5.9+
- Xcode 12+

## 📦 Installation

### Swift Package Manager (SPM)
You can easily integrate `AnimatedButtonLib` into your project using Swift Package Manager:

1. In Xcode, go to **File > Add Packages**.
2. Enter the repository URL:
   ```
   https://github.com/lymanny/iOS-AnimatedButtonLib.git
   ```
3. Select the latest version and add it to your project.

## 🛠️ Usage Examples

### UIKit Example using `@IBAction`
This example demonstrates how to use the `press` animation with a `UIButton` using `@IBAction` in a storyboard setup:

#### In your ViewController
Make sure to import the library:
```swift
import AnimatedButtonLib

@IBAction func btnClick(_ sender: UIButton) {
    sender.press {
        print("Button Pressed!")
    }
}
```

### SwiftUI Example
This example shows how to use the `press` method in SwiftUI by wrapping a UIKit `UIButton` using `UIViewRepresentable`.

```swift
import SwiftUI
import AnimatedButtonLib

struct ContentView: View {
    var body: some View {
        VStack {
            // SwiftUI Button with animation from `AnimatedButtonLib`
            AnimatedButton()
                .frame(width: 200, height: 50)
                .padding()
        }
    }
}

// Creating a SwiftUI-compatible UIButton using UIViewRepresentable
struct AnimatedButton: UIViewRepresentable {
    func makeUIView(context: Context) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Press Me", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        
        // Call the `press()` function when the button is tapped
        button.addAction(UIAction { _ in
            button.press {
                print("SwiftUI Button pressed using `press()`!")
            }
        }, for: .touchUpInside)
        
        return button
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

### Explanation
- The `UIViewRepresentable` approach is used to wrap your UIKit `UIButton` for use in SwiftUI.
- The button uses `addAction(UIAction)` to call the `press()` method whenever it's clicked.
- The `press()` method handles the animation and prints a message to the console.

## 📂 Project Structure
```
AnimatedButtonLib/
├── Sources/
│   └── AnimatedButtonLib/
└── Tests/
    └── AnimatedButtonLibTests/
```

## 🤝 Contributing
Contributions are welcome! Please feel free to submit issues, fork the repository, and create pull requests.

## 📄 License
This project is licensed under the [MIT License](LICENSE).  
Parts of the code were inspired by solutions found on [Stack Overflow](https://stackoverflow.com/questions/31320819/scale-uibutton-animation-swift).

## 👩‍💻 Author
lymanny - iOS Developer  
🌐 [Portfolio](https://lymanny.onrender.com)
