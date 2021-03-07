//  File: Island.swift
//  Created by Juliana de Carvalho
//  Student Id: 301137060
//  Date: March 7, 2021

import SpriteKit
import GameplayKit

class Island: GameObject
{
    
    // constructor
    init()
    {
        super.init(imageString: "island", initialScale: PositionManager.islandScale)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func CheckBounds()
    {
        
        if( (OrientationManager.Portrait && position.y <= PositionManager.islandCGFloat * -1) ||
            (!OrientationManager.Portrait && position.x <= PositionManager.islandCGFloat * -1))
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // get a pseudo-random number (e.g: from -313 to 313)
        let random:Int = (randomSource?.nextInt(upperBound: PositionManager.bound * 2))! - PositionManager.bound
        
        if(OrientationManager.Portrait){
            position.y =  PositionManager.islandCGFloat
            position.x = CGFloat(random)
        }
        else{
            position.x =  PositionManager.islandCGFloat
            position.y = CGFloat(random)
        }

        isColliding = false
    }
    
    // initialization
    override func Start()
    {
        zPosition = PositionManager.islandZposition
        Reset()

        if(OrientationManager.Portrait){
            dy = PositionManager.d
        }
        else{
            dx = PositionManager.d
        }
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        
        if(OrientationManager.Portrait){
            position.y -= dy!
        }
        else{
            position.x -= dx!
        }
    }
}
