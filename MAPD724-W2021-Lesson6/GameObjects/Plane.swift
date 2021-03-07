//  File: Plane.swift
//  Created by Juliana de Carvalho
//  Student Id: 301137060
//  Date: March 7, 2021

import SpriteKit
import GameplayKit

class Plane: GameObject
{
    
    // constructor
    init()
    {
        super.init(imageString: "plane", initialScale: PositionManager.planeScale)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func CheckBounds()
    {
        if(OrientationManager.Portrait){
            // constrain on the left - left boundary
            if(position.x <= PositionManager.planeLeftBound)
            {
                position.x = PositionManager.planeLeftBound
            }
            // constrain on the right - right boundary
            if(position.x >= PositionManager.planeRightBound)
            {
                position.x = PositionManager.planeRightBound
            }
        }
        else{
            // constrain on the left - left boundary
            if(position.y <= PositionManager.planeLeftBound)
            {
                position.y = PositionManager.planeLeftBound
            }
            // constrain on the right - right boundary
            if(position.y >= PositionManager.planeRightBound)
            {
                position.y = PositionManager.planeRightBound
            }
        }
    }
    
    override func Reset()
    {
       
    }
    
    // initialization
    override func Start()
    {
        zPosition = PositionManager.planeZposition
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    func TouchMove(newPos: CGPoint)
    {
        position = newPos
    }
}
