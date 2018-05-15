//#-hidden-code
import UIKit
import PlaygroundSupport
//#-end-hidden-code
/*:
 **Color Piano**
 ================
 
 Welcome to Color Piano!
 
 In this playground we will be transforming images into songs, and vice-versa.
 
 We will start with images. For a computer, an image is a collection of pixels, each of which contains a color. If we could read each pixel and associate its color to a sound frequency, we could compose a song based on the picture.
 
 The simplest way to read an image is line by line. Using that approach, however, a pixel sitting below another one will be played only after the entire line has been read. To fix that problem, we need to go into the amazing world of space-filling fractals.
 
 The Hilbert curve is a space-filling fractal represented by a series of straight lines that strike through every point of a square while maintaining a constant line density. If we use square images, we can take advantage of that Hilbert curve special property so the time between each note closely matches the proximity of each pixel touched by the line. Do not worry if it sounds too abstract at this point! Running the code is the best of explanations.
 
 ---
 * Experiment: Try changing the image being played:
     1. Ode to Joy
     2. Greensleeves
     3. Coffee Cup
     4. Detail of \"Dunes at Domburg - Piet Mondriaan - 1910\"
 
     Only pictures 1 and 2 will display the Hilbert Curve
 */
//Index of the image to be played
var image = /*#-editable-code image*/2/*#-end-editable-code*/
//Color of the fractal lines
var curveColor = /*#-editable-code color*/#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)/*#-end-editable-code*/
/*:
 You can also change the volume and the duration of each note!
*/
//Piano Settings
var volume = /*#-editable-code volume*/0.5/*#-end-editable-code*/
var noteDuration = /*#-editable-code duration*/10/*#-end-editable-code*/
//#-hidden-code

var uiImage: UIImage?
var uiImageExtended: UIImage?

if image < 1 || image > 4 { image = 1 }

switch image {
case 2:
    uiImage = UIImage(named: "greensleeves")
    uiImageExtended = UIImage(named: "greensleeves_extended")
case 3:
    uiImage = UIImage(named: "coffee_cup")
    uiImageExtended = UIImage(named: "coffee_cup")
case 4:
    uiImage = UIImage(named: "dunes_at _domburg")
    uiImageExtended = UIImage(named: "dunes_at _domburg")
default:
    uiImage = UIImage(named: "ode_to_joy")
    uiImageExtended = UIImage(named: "ode_to_joy_extended")
}

let view = ImagePlayerView(image: uiImageExtended)

if volume > 5 { volume = 5 }
if volume < 0 { volume = 0 }

// Ignore hilbert curve for the high resolution pictures
if image < 3 , let imageView = view.imageView {
    var points = HilbertCurve.divide(frame: imageView.bounds, iterations: Int(log2(uiImage!.size.width)))
    let curveLayer = CAShapeLayer()
    curveLayer.frame = imageView.bounds
    curveLayer.fillColor = UIColor.clear.cgColor
    curveLayer.strokeColor = curveColor.cgColor
    curveLayer.lineWidth = 2
    curveLayer.strokeEnd = 0
    
    //Create hilbert curve path
    let hilbertPath = UIBezierPath()
    hilbertPath.move(to: CGPoint(x: 0, y: points[0][0].y))
    for i in 0 ..< points.count * points[0].count {
        let point = HilbertCurve.getCoordinate(from: i, n: 5)
        hilbertPath.addLine(to: points[point.x][point.y])
    }
    
    hilbertPath.addLine(to: CGPoint(x: 0, y: points[points.count - 1][points[0].count - 1].y))
    //Move path to match the picture
    hilbertPath.apply(CGAffineTransform(translationX: -imageView.bounds.midX, y: -imageView.bounds.midY))
    hilbertPath.apply(CGAffineTransform(rotationAngle: 90 * .pi / 180))
    hilbertPath.apply(CGAffineTransform(scaleX: -1, y: 1))
    hilbertPath.apply(CGAffineTransform(translationX: imageView.bounds.midX, y: imageView.bounds.midY))
    
    curveLayer.path = hilbertPath.cgPath
    imageView.layer.addSublayer(curveLayer)
    
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.toValue = 1
    animation.duration = 1.47 * TimeInterval(noteDuration)
    animation.fillMode = kCAFillModeForwards
    animation.isRemovedOnCompletion = false
    curveLayer.add(animation, forKey: "strokeEnd")
}


PlaygroundPage.current.liveView = view
Synthesizer.shared.play(image: uiImage, volume: Float32(volume), length: Int(noteDuration))
//#-end-hidden-code
//: [Next](@next)


