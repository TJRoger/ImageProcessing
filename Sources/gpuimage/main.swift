import GPUImage
import UIKit

print("Hello, world!")
guard let testImage = UIImage(named: "WID-small.jpg") else {
    print("failed to load image")
    return
}
let toonFilter = SmoothToonFilter()
let filteredImage = testImage.filterWithOperation(toonFilter)

    func advancedFilter() {
        guard let testImage = UIImage(named: "WID-small.jpg") else {
            print("failed to load image")
                return
        }
        let toonFilter = SmoothToonFilter()
        let luminanceFilter = Luminance()
        let filteredImage = testImage.filterWithPipeline {
            $0 --> toonFilter --> luminanceFilter --> $1
        }
    }
