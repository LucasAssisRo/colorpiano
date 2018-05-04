import UIKit

public struct HilbertCurve {
    
    // Adapted to swift from https://en.wikipedia.org/wiki/Hilbert_curve
    static func getDistance(from coordinate: (x: Int, y: Int), n: Int) -> Int {
        var x = coordinate.x
        var y = coordinate.y
        var directionX: Int
        var directionY: Int
        var d = 0
        var i = n / 2
        repeat {
            directionX = (x & i) > 0 ? 1 : 0;
            directionY = (y & i) > 0 ? 1 : 0;
            d += i * i * ((3 * directionX) ^ directionY);
            self.rotate(n: i, x: &x, y: &y, directionX: directionX, directionY: directionY);
            i /= 2
        } while(i > 0)
        
        return d
    }
    
    // Adapted to swift from https://en.wikipedia.org/wiki/Hilbert_curve
    public static func getCoordinate(from distance: Int, n: Int) -> (x: Int, y: Int) {
        var directionX: Int
        var directionY: Int
        var distance = distance
        var i = 1
        var coordinate: (x: Int, y: Int) = (0, 0)
        repeat {
            directionX = 1 & (distance / 2);
            directionY = 1 & (distance ^ directionX);
            self.rotate(n: i, x: &coordinate.x, y: &coordinate.y, directionX: directionX, directionY: directionY);
            coordinate.x += i * directionX;
            coordinate.y += i * directionY;
            distance /= 4;
            i *= 2
        } while(i < n)
        
        return coordinate
    }
    
    // Adapted to swift from https://en.wikipedia.org/wiki/Hilbert_curve
    private static func rotate(n: Int, x: inout Int, y: inout Int, directionX: Int, directionY: Int) {
        if directionY == 0 {
            if directionX == 1 {
                x = n - 1 - x
                y = n - 1 - y
            }
            
            let aux = x
            x = y
            y = aux
        }
    }

    public static func divide(frame: CGRect, iterations: Int) -> [[CGPoint]] {
        var pointsMatrix: [[CGPoint]] = []
        var matrixRow: [CGPoint] = []
        let numberOfSlices = pow(2, CGFloat(iterations))
        let referenceFrame = CGRect(x: frame.minX,
                                    y: frame.minY,
                                    width: frame.width / numberOfSlices,
                                    height: frame.height / numberOfSlices)
        matrixRow.append(CGPoint(x: referenceFrame.midX, y: referenceFrame.midY))
        
        var xRef = referenceFrame.maxX
        var yRef = referenceFrame.minY
        while (yRef < frame.maxY) {
            while (xRef < frame.maxX) {
                matrixRow.append(CGPoint(x: xRef + referenceFrame.width / 2,
                                         y: yRef + referenceFrame.height / 2))
                xRef += referenceFrame.maxX
            }
            
            xRef = referenceFrame.minX
            yRef += referenceFrame.maxY
            pointsMatrix.append(matrixRow)
            matrixRow = []
        }
        
        return pointsMatrix
    }

}
