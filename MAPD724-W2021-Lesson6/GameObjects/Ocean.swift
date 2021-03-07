//  File: Ocean.swift
//  Created by Juliana de Carvalho
//  Student Id: 301137060
//  Date: March 7, 2021

import SpriteKit
import GameplayKit

class Ocean: GameObject
{
    
    // constructor
    init()
    {
        super.init(imageString: "ocean", initialScale: PositionManager.oceanScale)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func CheckBounds()
    {

        if( (OrientationManager.Portrait && position.y <= PositionManager.oceanCGFloat * -1) ||
            (!OrientationManager.Portrait && position.x <= PositionManager.oceanCGFloat * -1))
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        if(OrientationManager.Portrait){
            position.y = PositionManager.oceanCGFloat
        }
        else{
            position.x = PositionManager.oceanCGFloat
        }
    }
    
    // initialization
    override func Start()
    {
        zPosition = PositionManager.oceanZposition
        
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
