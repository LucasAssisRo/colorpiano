import UIKit

public class ImagePlayerView: UIView {
    
   public var imageView: UIImageView!
    
    override public var bounds: CGRect {
        didSet {
            self.imageView.center = CGPoint(x: self.bounds.midX,
                                            y: self.bounds.midY)
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public convenience init(image: UIImage?) {
        self.init(frame: UIScreen.main.bounds)
        self.backgroundColor = .white
        
        self.imageView = UIImageView()
        self.imageView.image = image
        self.imageView.sizeToFit()
        self.addSubview(self.imageView)
    }
}
