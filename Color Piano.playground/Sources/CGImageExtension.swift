import UIKit
extension CGImage {
    public var rgbaMatrix: [[(r: UInt8, g: UInt8, b: UInt8, a: UInt8)]] {
        let size = self.width * self.height * 4
        let step = self.width * 4
        var rgbBuffer = [UInt8](repeating: 0, count: size)
        
        guard let rbgContext = CGContext(data: &rgbBuffer,
                                         width: self.width,
                                         height: self.height,
                                         bitsPerComponent: self.bitsPerComponent,
                                         bytesPerRow: step,
                                         space: CGColorSpaceCreateDeviceRGB(),
                                         bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)
            else { return [] }
        
        rbgContext.draw(self, in: CGRect(x: 0, y: 0, width: self.width, height: self.height))        

        var result: [[(r: UInt8, g: UInt8, b: UInt8, a: UInt8)]] = []
        for i in 0 ..< self.height {
            result.append([])
            for j in stride(from: 0, to: step, by: 4) {
                result[i].append((
                    r: rgbBuffer[j + 0 + step * i],
                    g: rgbBuffer[j + 1 + step * i],
                    b: rgbBuffer[j + 2 + step * i],
                    a: rgbBuffer[j + 3 + step * i]
                ))
            }
        }
        
        return result
    }
    
    public var rgbaHexMatrix: [[UInt32]] {
        var result: [[UInt32]] = []
        let rgbaMatrix = self.rgbaMatrix
        for i in 0 ..< rgbaMatrix.count {
            result.append([])
            for j in 0 ..< rgbaMatrix[i].count {
                let r = UInt32(rgbaMatrix[i][j].r) * 0x1000000
                let g = UInt32(rgbaMatrix[i][j].g) * 0x10000
                let b = UInt32(rgbaMatrix[i][j].b) * 0x100
                let a = UInt32(rgbaMatrix[i][j].a) * 0x1
                result[i].append(r + g + b + a)
            }
        }
        
        return result
    }
    
    public var soundMatrix: [[(frequency: Float32, length: Float32)]] {
        let hexMatrix = self.rgbaHexMatrix
        var result: [[(frequency: Float32, length: Float32)]] = []
        for i in  0 ..< hexMatrix.count {
            result.append([])
            for j in  0 ..< hexMatrix[i].count {
                result[i].append((SoundColourUtils.sound(from: Float32(hexMatrix[i][j] / 0x100)),
                                  SoundColourUtils.length(from: Float32(hexMatrix[i][j] % 0x100))))
            }
        }
        
        return result
    }
}
