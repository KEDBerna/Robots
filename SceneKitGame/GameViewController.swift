import UIKit
import SceneKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let sceneView: SCNView
        if let scnView = self.view as? SCNView {
            sceneView = scnView
        } else {
            sceneView = SCNView(frame: self.view.bounds)
            self.view.addSubview(sceneView)
        }

        sceneView.scene = createScene()
        sceneView.allowsCameraControl = true
        sceneView.showsStatistics = true
    }

    private func createScene() -> SCNScene {
        let scene = SCNScene()

        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
        scene.rootNode.addChildNode(cameraNode)

        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)

        let geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        let node = SCNNode(geometry: geometry)
        scene.rootNode.addChildNode(node)

        let rotateAction = SCNAction.repeatForever(
            SCNAction.rotateBy(x: 0, y: CGFloat.pi * 2, z: 0, duration: 5)
        )
        node.runAction(rotateAction)

        return scene
    }

    override var prefersStatusBarHidden: Bool { true }
}
