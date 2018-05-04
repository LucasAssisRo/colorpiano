import UIKit

public class MusicGridView: UIView {
    
    var pixelView: UIView!
    
    override public var bounds: CGRect {
        didSet {
            self.pixelView.center = CGPoint(x: self.bounds.midX,
                                            y: self.bounds.midY)
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public convenience init(notes: [(key: PianoKeys, length: Int)]) {
        self.init(frame: UIScreen.main.bounds)
        self.backgroundColor = .white
        
        self.pixelView = UIView()
        self.pixelView.bounds.size = CGSize(width: 256, height: 256)
        
        for i in 0 ..< notes.count {
            let bigPixelSize: CGFloat = 64
            let hex = SoundColourUtils.hex(from: notes[i].key.rawValue)
            let matrixPosition = HilbertCurve.getCoordinate(from: i, n: 3)
            let bigPixelView = UIView()
            bigPixelView.bounds.size = CGSize(width: bigPixelSize,
                                              height: bigPixelSize)
            bigPixelView.center = CGPoint(x: bigPixelSize / 2 + bigPixelSize * CGFloat(matrixPosition.x),
                                          y: bigPixelSize / 2 + bigPixelSize * CGFloat(matrixPosition.y))
            bigPixelView.backgroundColor = UIColor(red: CGFloat((hex & 0xff0000) >> 16) / 255,
                                                   green: CGFloat((hex & 0x00ff00) >> 8) / 255,
                                                   blue: CGFloat((hex & 0x0000ff)) / 255,
                                                   alpha: 1)
            self.pixelView.addSubview(bigPixelView)
        }
    
        
        self.addSubview(self.pixelView)
    }
}
