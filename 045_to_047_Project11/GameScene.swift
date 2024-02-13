import SpriteKit

class GameScene: SKScene {
  override func didMove(to view: SKView) {
    let background = SKSpriteNode(imageNamed: "background")
    background.position = CGPoint(x: 512, y: 384)
    background.blendMode = .replace
    background.zPosition = -1
    addChild(background)
    
    physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    
    addBouncers()
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else { return }
    let location = touch.location(in: self)
    
    /*
     let box = createBox(at: location)
     addChild(box)
     */
    
    let ball = createBall(at: location)
    addChild(ball)
  }
  
  func addBouncers() {
    addChild(createBouncer(at: CGPoint(x: 0, y: 0)))
    addChild(createBouncer(at: CGPoint(x: 256, y: 0)))
    addChild(createBouncer(at: CGPoint(x: 512, y: 0)))
    addChild(createBouncer(at: CGPoint(x: 768, y: 0)))
    addChild(createBouncer(at: CGPoint(x: 1024, y: 0)))
  }
  
  func createBouncer(at location: CGPoint) -> SKSpriteNode {
    let node = SKSpriteNode(imageNamed: "bouncer")
    node.position = location
    node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2.0)
    node.physicsBody?.isDynamic = false
    return node
  }
  
  func createBox(at location: CGPoint) -> SKSpriteNode {
    let node = SKSpriteNode(color: .red, size: CGSize(width: 64,height: 64))
    node.position = location
    node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 64,height: 64))
    return node
  }
  
  func createBall(at location: CGPoint) -> SKSpriteNode {
    let node = SKSpriteNode(imageNamed: "ballRed")
    node.position = location
    node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2.0)
    node.physicsBody?.restitution = 0.4
    return node
  }
}
