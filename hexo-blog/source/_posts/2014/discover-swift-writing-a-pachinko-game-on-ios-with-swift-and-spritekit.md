---
title: 'Discover Swift: Writing a Pachinko game on iOS with Swift and SpriteKit'
tags:
  - iOS
  - Swift
id: 5973
categories:
  - Development
date: 2014-08-06 17:22:58
---

![pachinko screenshot](screenshot.png) Pachinko, a.k.a. Japanese pinball game[/caption]

Do you like Swift programming language come with XCode 6 from Apple? You may not know, but I like it after writing a game with it. I am going to show you how to write a game with Swift. If you would like to jump right into the [source code](https://github.com/neoalienson/pachinko) of this game, you can download/clone from [GitHub](https://github.com/neoalienson/pachinko)
<!--more-->

# Getting start with XCode 6

First of all you need to download XCode 6\. At this moment XCode 6 is not official released, so you need to join 'iOS Developer Program' to download. After you have installed XCode and choose to Create a new Xcode project, you can create a iOS Application with Game template,

![new_xcode_game](new_xcode_game.png)

Fill in product name, choose language Swift and SpriteKit,

![new_xcode_game_2](new_xcode_game_2.png)

# Type Inference

Once the canned game is created, you can set scaleMode in GameViewController.swift to .AspectFit, e.g.,
```scene.scaleMode = .AspectFit```
The canned version sets scaleMode to .AspectFill. I got lost with the coordinates with .AspectFill and found part of the game scene isn't being shown under this mode. I found .AspectFit would be easier to learn the coordinate system because all scene is shown. Empty spaces are added with .AspectFit if they do not match instead, so you will not miss any part of your scene. You do not need to reference type for .AspectFit as in objective-C, as it can deduce the type from scene.scaleMode with Type Inference. Also, the semicolon is not required to end a statement. Starting to love it?

# Handling different scene aspect ratio

Next, resize scene in GameScene.sks to 640 width and 1136 height such that it fits aspect ratio to iPhone 5\. The numbers are not in pixel unit because the scene could be scaled according to scaleMode, using 640 is easier for reference in the game program. It could be difficult to see the selected game scene because it fits the editor on the first launch, zooming out with the '-' icon could help. You know you have selected the scene from breadcrumb or property window on right.

![gamesene_sks](gamesene_sks.png)

# Build basic game elements with SpriteKit

SpriteKit is very familiar to me as I have experience with Cocos2d and Cocos2d-x. It is an all-in-one physics engine, 2d graphics engine, animation engine. Let's start to create pins, fences and border
{% codeblock lang:swift %}
import SpriteKit

class GameScene: SKScene {
  var borderBottom: SKShapeNode? = nil

  override func didMoveToView(view: SKView) {
    let top = scene.size.height;
    let right = scene.size.width;

    // pins
    let pinRadius : CGFloat = 5
    let pinSpacing : CGFloat = 100
    for var x : CGFloat = 75; x &lt; 500; x += pinSpacing {
      for var y : CGFloat = 200; y &lt; 800; y += pinSpacing {
        let sprite = SKShapeNode(circleOfRadius: pinRadius)
        sprite.physicsBody = SKPhysicsBody(circleOfRadius: pinRadius)
        sprite.physicsBody.dynamic = false
        // straggered pins
        sprite.position.x = x + (y % (pinSpacing * 2)) / 2
        sprite.position.y = y
        sprite.fillColor = UIColor.whiteColor()
        self.addChild(sprite)
      }
    }

    // fences
    let fenceSpacing : CGFloat = 100
    let fenceSize = CGSize(width: 5, height: 75)
    for var x : CGFloat = fenceSpacing; x &lt; right - 100; x += fenceSpacing {
      let sprite = SKShapeNode(rectOfSize: fenceSize)
      sprite.physicsBody = SKPhysicsBody(rectangleOfSize: fenceSize)
      sprite.physicsBody.dynamic = false
      sprite.position = CGPoint(x: x, y: fenceSize.height / 2)
      sprite.fillColor = UIColor.whiteColor()
      self.addChild(sprite)
    }

    // bottom
    let pathBottom = CGPathCreateMutable()
    CGPathMoveToPoint(pathBottom, nil, 0, 0)
    CGPathAddLineToPoint(pathBottom, nil, right, 0)
    borderBottom = SKShapeNode(path: pathBottom)
    borderBottom?.physicsBody = SKPhysicsBody(edgeChainFromPath: pathBottom)
    borderBottom?.physicsBody.dynamic = false
    self.addChild(borderBottom)

    // other borders
    let path = CGPathCreateMutable()
    CGPathMoveToPoint(path, nil, 0, 0)
    CGPathAddLineToPoint(path, nil, 0, top)
    CGPathAddLineToPoint(path, nil, right - 150, top)
    CGPathAddLineToPoint(path, nil, right - 50, top - 50)
    CGPathAddLineToPoint(path, nil, right, top - 150)
    CGPathAddLineToPoint(path, nil, right, 0)
    let borders = SKShapeNode(path: path)
    borders.physicsBody = SKPhysicsBody(edgeChainFromPath: path)
    borders.physicsBody.dynamic = false
    self.addChild(borders)
  }
}
{% endcodeblock %}

# Non-optional/Optional Variable?

You may wonder what SKShapeNode? is in 'var borderBottom: SKShapeNode? = nil'. Variables in Swift are non-optional variables and they are not allow to set nil (or null) by default. You have to declare the variable to optional variable by putting ? the end of variable type. This make Swift more 'fool-proof' because many developers in other language dereference variable by accident, causes many null pointer exception or calling method from undefined object. Having null annotation could be helpful but your code would filled with annotations. Long words, but we still have no game to play. Now lets try to add some action to have fun

{% codeblock lang:swift %}
override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
  // launch a ball
  let sprite = SKSpriteNode(imageNamed:"Spaceship")

  sprite.xScale = 0.15
  sprite.yScale = 0.15

  sprite.position = CGPoint(x: 605, y: 40)

  sprite.physicsBody = SKPhysicsBody(circleOfRadius: 30)
  sprite.physicsBody.contactTestBitMask = 1

  self.addChild(sprite)

  // give some randomless
  sprite.physicsBody.velocity.dy = 3000 + CGFloat(rand()) * 300 / CGFloat(RAND_MAX);
}
{% endcodeblock %}

The spaceships fills up the screen if you tap non-stop. Let's do something when the spaceship hit the floor,

# Handle object collision

First, make the GameScence to conforms to SKPhysicsContactDelegate, which means it could have a function to handle contact between physics objects

{% codeblock lang:swift %}
class GameScene: SKScene, SKPhysicsContactDelegate {
    var score = 0
{% endcodeblock %}

And below is the function to handle objects contact,

{% codeblock lang:swift %}
func didBeginContact(contact: SKPhysicsContact!) {
  if contact.bodyA == borderBottom?.physicsBody {
    let body = contact.bodyB

    // disable futher collision
    body.contactTestBitMask = 0

    let node = body.node

    // fade out
    node.runAction(SKAction.sequence([
        SKAction.fadeAlphaTo(0, duration: 1),
        SKAction.removeFromParent()]))

    // update score
    score += 10
    let label = self.childNodeWithName("score") as SKLabelNode
    label.text = String(score)

    // score float up from the ball
    let scoreUp = SKLabelNode(text: "+10")
    scoreUp.position = node.position
    self.addChild(scoreUp)
    scoreUp.runAction(SKAction.sequence([
        SKAction.moveBy(CGVector(dx: 0, dy: 50), duration: 1),
        SKAction.removeFromParent()
        ]))
  }
}
{% endcodeblock %}

You should set contact delegate to the GameScene as it conforms to the protocol,
{% codeblock lang:swift %}
override func didMoveToView(view: SKView) {
  // setup collision delegate
  self.physicsWorld.contactDelegate = self
}
{% endcodeblock %}

Cool! Hope you are not addict to the game. [Download/browe source in GitHub](https://github.com/neoalienson/pachinko). Wish one day Swift and SpriteKit would become cross-platform.
