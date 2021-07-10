import GPUImage
import Cocoa

guard let imageUrl = Bundle.module.url(forResource: "WID-small", withExtension: "jpg") else {
    fatalError("image file not found")
}

print(imageUrl)
guard let testImage = NSImage(contentsOf: imageUrl) else {
    fatalError("failed to load image")
}

/* basicFilter() */
advancedFilter()

func basicFilter() {
    let toonFilter = SmoothToonFilter()
    let filteredImage = testImage.filterWithOperation(toonFilter)
    let newImageUrl = imageUrl.deletingLastPathComponent().appendingPathComponent("WID-small-new.jpg")
    print(newImageUrl)
    /* try filteredImage.jpgData?.write(to: newImageUrl, options: .atomic) */
    filteredImage.jpgWrite(to: newImageUrl)
}

func advancedFilter() {
    let toonFilter = SmoothToonFilter()
    let luminanceFilter = Luminance()
    let filteredImage = testImage.filterWithPipeline {
        $0 --> toonFilter --> luminanceFilter --> $1
    }
    let newImageUrl = imageUrl.deletingLastPathComponent().appendingPathComponent("WID-small-advanced.jpg")
    print(newImageUrl)
    filteredImage.jpgWrite(to: newImageUrl)
}
