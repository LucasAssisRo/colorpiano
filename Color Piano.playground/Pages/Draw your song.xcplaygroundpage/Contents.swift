//#-hidden-code
import UIKit
import PlaygroundSupport
//#-end-hidden-code
//: [Previous](@previous)
/*:
 **Color Grid**
 ================
 
 Now how can we transform color code into sound frequencies? Let's have a look at the details of a simple example.
 
 First we need to decide which range of frequencies we are going to use. For this playground, we will use the sounds produced by a piano. Piano frequencies vary between 16 and 7902 Hz, and the color code is a number between 0 and 16,777,215. To associate those two ranges, we can take advantage the mathematical concept of linear interpolation.
 
 Because we know the maximum and minimum value for both the sound and the colors, we can create the following table and use interpolation to estimate the sound of each color:
 
 7902 Hz....16777215
 
 Sound..............Color
 
 16 Hz.....................0

 ---
 * Experiment:
 Select the size of your grid:
 
     1. 2 x 2
     2. 4 x 4
     3. 8 x 8
 
 Once your grid is set, use the small color selector to pick the color of the next square you touch. You may leave some squares in black to create gaps. Tap play to listen to your tune!
 */
//Index of the grid
var size = /*#-editable-code size*/2/*#-end-editable-code*/

//Piano Settings
var volume = /*#-editable-code volume*/0.5/*#-end-editable-code*/
var noteDuration = /*#-editable-code duration*/10/*#-end-editable-code*/
//#-hidden-code
let view = ColorPianoView(size: CGFloat(size))
view.volume = Float32(volume)
view.length = Int(noteDuration)
PlaygroundPage.current.liveView = view
//#-end-hidden-code
//: [Next](@next)
