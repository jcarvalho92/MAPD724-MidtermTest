//  File: GameScene.swift
//  Created by Juliana de Carvalho
//  Student Id: 301137060
//  Date: March 7, 2021

import UIKit
import AVFoundation
import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene
{
    
    // instance variables
    var ocean: Ocean?
    var island: Island?
    var plane: Plane?
    var clouds: [Cloud] = []
    
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height

        name = "GAME"
        
        // add ocean to the scene
        ocean = Ocean() // allocate memory
        ocean?.position = PositionManager.GetOceanPosition()
      
        if(!OrientationManager.Portrait){
            ocean?.zRotation =  .pi / 2
        }
        
        addChild(ocean!) // add object to the scene
        
        // add island to the scene
        island = Island()
        addChild(island!)
        
        // add plane to the scene
        plane = Plane()
        plane?.position = PositionManager.GetPlanePosition()
        if(!OrientationManager.Portrait){
            plane?.zRotation =  3 * .pi / 2
        }
  
        addChild(plane!)
        
        // add 2 clouds to the scene
        for index in 0...1
        {
            let cloud: Cloud = Cloud()
            clouds.append(cloud)
            addChild(clouds[index])
        }
        
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        self.addChild(engineSound)
        engineSound.autoplayLooped = true
        
        // preload sounds
        do {
            let sounds:[String] = ["thunder", "yay"]
            for sound in sounds
            {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url: URL = URL(fileURLWithPath: path)
	                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            }
        } catch {
        }
        
    }
    
    
    func touchDown(atPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: PositionManager.GetPlaneTouchMove(atPoint: pos))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: PositionManager.GetPlaneTouchMove(atPoint: pos))

    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: PositionManager.GetPlaneTouchMove(atPoint: pos))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    // this is where all the fun happens - this function is called about 60fps - every 16.666ms
    override func update(_ currentTime: TimeInterval)
    {
        ocean?.Update()
        island?.Update()
        plane?.Update()
        
        CollisionManager.SquaredRadiusCheck(scene: self, object1: plane!, object2: island!)
        
        for cloud in clouds
        {
            cloud.Update()
            CollisionManager.SquaredRadiusCheck(scene: self, object1: plane!, object2: cloud)
        }
        
        
    }
}
