//  File: Cloud.swift
//  Created by Juliana de Carvalho
//  Student Id: 301137060
//  Date: March 7, 2021

import SpriteKit
import GameplayKit

class Cloud: GameObject
{
    
    // constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: PositionManager.cloudScale)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func CheckBounds()
    {
        
        if( (OrientationManager.Portrait && position.y <= PositionManager.cloudCGFloat * -1) ||
            (!OrientationManager.Portrait && position.x <= PositionManager.cloudCGFloat * -1))
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        
        if(OrientationManager.Portrait){
            dy = CGFloat((randomSource?.nextUniform())! * Float(PositionManager.d)) + PositionManager.d
            dx = CGFloat((randomSource?.nextUniform())! * Float(PositionManager.dRandomFrom)) + PositionManager.dRandomTo
            
            // get a pseudo-random number
            let randomX:Int = (randomSource?.nextInt(upperBound: PositionManager.cloudBound * 2))! - PositionManager.cloudBound
            position.x = CGFloat(randomX)
            
            let randomY:Int = (randomSource?.nextInt(upperBound: PositionManager.cloudUpperBound))! + Int(PositionManager.cloudCGFloat)
            position.y = CGFloat(randomY)
            
        }
        else{
            dx = CGFloat((randomSource?.nextUniform())! * Float(PositionManager.d)) + PositionManager.d
            dy = CGFloat((randomSource?.nextUniform())! * Float(PositionManager.dRandomFrom)) + PositionManager.dRandomTo
            
            // get a pseudo-random number 
            let randomY:Int = (randomSource?.nextInt(upperBound: PositionManager.cloudBound * 2))! - PositionManager.cloudBound
            position.y = CGFloat(randomY)
            
            let randomX:Int = (randomSource?.nextInt(upperBound: PositionManager.cloudUpperBound))! + Int(PositionManager.cloudCGFloat)
            position.x = CGFloat(randomX)
            
        }

        
        isColliding = false
    }
    
    // initialization
    override func Start()
    {
        zPosition = PositionManager.cloudZposition
        alpha = PositionManager.alpha
        Reset()
        
        
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
