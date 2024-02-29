import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
  
  var scoreLabel: SKLabelNode!
  var editLabel: SKLabelNode!
  
  var numberOfBalls = 5
  
  var score = 0 {
    didSet {
      scoreLabel.text = "Score: \(score)"
    }
  }
  
  var editingMode: Bool = false {
    didSet {
      if editingMode {
        editLabel.text = "Done"
      } else {
        editLabel.text = "Edit"
      }
    }
  }
  
  override func didMove(to view: SKView) {
    let background = SKSpriteNode(imageNamed: "background")
    background.position = CGPoint(x: 512, y: 384)
    background.blendMode = .replace
    background.zPosition = -1
    addChild(background)
    
    scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
    scoreLabel.text = "Score: 0"
    scoreLabel.horizontalAlignmentMode = .right
    scoreLabel.position = CGPoint(x: 980, y: 700)
    addChild(scoreLabel)
    
    editLabel = SKLabelNode(fontNamed: "Chalkduster")
    editLabel.text = "Edit"
    editLabel.position = CGPoint(x: 80, y: 700)
    addChild(editLabel)
    
    physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    physicsWorld.contactDelegate = self
    
    prepareScenario()
  }
  
  func didBegin(_ contact: SKPhysicsContact) {
    guard let nodeA = contact.bodyA.node else { return }
    guard let nodeB = contact.bodyB.node else { return }
    
    if nodeA.name == "ball" {
      collisionBetween(ball: nodeA, object: nodeB)
    } else if nodeB.name == "ball" {
      collisionBetween(ball: nodeB, object: nodeA)
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else { return }
    let location = touch.location(in: self)
    let objects = nodes(at: location)
    
    if objects.contains(editLabel) {
      editingMode.toggle()
    } else {
      if editingMode {
        let box = createBox(at: location)
        addChild(box)
      } else if numberOfBalls > 0 {
        let fixedYLocation = CGPoint(x: location.x, y: 700.00)
        let ball = createBall(at: fixedYLocation)
        numberOfBalls -= 1
        addChild(ball)
      }
    }
  }
  
  func prepareScenario() {
    addChild(createBouncer(at: CGPoint(x: 0, y: 30)))
    addChild(createBouncer(at: CGPoint(x: 256, y: 30)))
    addChild(createBouncer(at: CGPoint(x: 512, y: 30)))
    addChild(createBouncer(at: CGPoint(x: 768, y: 30)))
    addChild(createBouncer(at: CGPoint(x: 1024, y: 30)))
    
    makeSlot(at: CGPoint(x: 128, y: 30), isGood: true)
    makeSlot(at: CGPoint(x: 384, y: 30), isGood: false)
    makeSlot(at: CGPoint(x: 640, y: 30), isGood: true)
    makeSlot(at: CGPoint(x: 896, y: 30), isGood: false)
  }
  
  func makeSlot(at position: CGPoint, isGood: Bool) {
    let slotBase: SKSpriteNode = {
      let node = SKSpriteNode(imageNamed: isGood ? "slotBaseGood" : "slotBaseBad")
      node.name = isGood ? "good" : "bad"
      return node
    }()
    
    let slotGlow: SKSpriteNode =
    SKSpriteNode(imageNamed: isGood ? "slotGlowGood" : "slotGlowBad")
    
    slotBase.position = position
    slotGlow.position = position
    
    slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
    slotBase.physicsBody?.isDynamic = false
    
    addChild(slotBase)
    addChild(slotGlow)
    
    let spin = SKAction.rotate(byAngle: .pi, duration: 10)
    let spinForever = SKAction.repeatForever(spin)
    slotGlow.run(spinForever)
  }
  
  func createBouncer(at location: CGPoint) -> SKSpriteNode {
    let node = SKSpriteNode(imageNamed: "bouncer")
    node.position = location
    node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2.0)
    node.physicsBody?.isDynamic = false
    return node
  }
  
  func createBox(at location: CGPoint) -> SKSpriteNode {
    let node = SKSpriteNode(
      color: UIColor(
        red: CGFloat.random(in: 0...1),
        green: CGFloat.random(in: 0...1),
        blue: CGFloat.random(in: 0...1),
        alpha: 1
      ),
      size: CGSize(
        width: Int.random(in: 16...128),
        height: 16
      )
    )
    node.zRotation = CGFloat.random(in: 1...3)
    node.position = location
    node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
    node.physicsBody?.isDynamic = false
    node.name = "obstacle"
    return node
  }
  
  func createBall(at location: CGPoint) -> SKSpriteNode {
    let balls = ["ballBlue", "ballCyan", "ballGreen", "ballGrey", "ballPurple", "ballRed", "ballYellow"]
    let node = SKSpriteNode(imageNamed: balls.randomElement() ?? "ballRed")
    node.position = location
    node.physicsBody = SKPhysicsBody(circleOfRadius: node.size.width / 2.0)
    node.physicsBody?.restitution = 0.4
    node.name = "ball"
    
    /**
     The collisionBitMask bitmask means "which nodes should I bump into?" By default, it's set to everything, which is why our ball are already hitting each other and the bouncers. The contactTestBitMask bitmask means "which collisions do you want to know about?" and by default it's set to nothing. So by setting contactTestBitMask to the value of collisionBitMask we're saying, "tell me about every collision."
     */
    if let collisionBitMask = node.physicsBody?.collisionBitMask {
      node.physicsBody?.contactTestBitMask = collisionBitMask
    }
    
    return node
  }
  
  func collisionBetween(ball: SKNode, object: SKNode) {
    if object.name == "good" {
      destroy(ball)
      score += 1
      numberOfBalls += 1
    } else if object.name == "bad" {
      destroy(ball)
      score -= 1
    } else if object.name == "obstacle" {
      destroy(object)
    }
  }
  
  func destroy(_ node: SKNode) {
    if 
      let fireParticles = SKEmitterNode(fileNamed: "FireParticles"),
      node.name != "obstacle" {
      fireParticles.position = node.position
      addChild(fireParticles)
    }
    node.removeFromParent()
  }
}

/**
 CGFloat is yet another way of representing decimal numbers, just like Double and Float. Behind the scenes, CGFloat can be either a Double or a Float depending on the device your code runs on. Swift also has Double.pi and Float.pi for when you need it at different precisions.
 
 Angles are specified in radians, not degrees. This is true in UIKit too. 360 degrees is equal to the value of 2 x Pi – that is, the mathematical value π. Therefore π radians is equal to 180 degrees.
 */
