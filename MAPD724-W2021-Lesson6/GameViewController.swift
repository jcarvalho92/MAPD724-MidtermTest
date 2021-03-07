//  File: GameViewController.swift
//  Created by Juliana de Carvalho
//  Student Id: 301137060
//  Date: March 7, 2021

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController
{

    @IBOutlet weak var LivesLabel: UILabel!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
               
                if( !OrientationManager.Portrait ){
                    scene.size = CGSize(width: scene.frame.height, height: scene.frame.width)
                }

                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
        }
        
        CollisionManager.gameViewController = self

        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)
            if UIDevice.current.orientation.isLandscape {
                OrientationManager.Portrait = false
            } else {
                OrientationManager.Portrait = true
            }
            viewDidLoad()
        }

    override var shouldAutorotate: Bool
    {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    func updateScoreLabel() -> Void
    {
        ScoreLabel.text  = "Score: \(ScoreManager.Score)"
    }
        
    func updateLivesLabel() -> Void
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
}
