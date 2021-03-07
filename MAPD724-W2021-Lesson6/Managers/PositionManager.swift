import SpriteKit
import UIKit

class PositionManager
{
    public static var oceanZposition:  CGFloat = 0
    public static var islandZposition: CGFloat = 1
    public static var planeZposition:  CGFloat = 2
    public static var cloudZposition:  CGFloat = 3
    
    public static var oceanScale:  CGFloat = 2.0
    public static var islandScale: CGFloat = 2.0
    public static var planeScale:  CGFloat = 2.0
    public static var cloudScale:  CGFloat = 1.0
    
    public static var islandCGFloat: CGFloat = 730
    public static var oceanCGFloat: CGFloat = 773
    public static var planeCGFloat: CGFloat = -495
    public static var cloudCGFloat: CGFloat = 756
    
    public static var alpha: CGFloat = 0.5
    public static var bound: Int = 310
    public static var planeLeftBound: CGFloat = CGFloat(bound * -1)
    public static var planeRightBound: CGFloat = CGFloat(bound)
    public static var cloudBound: Int = 262
    public static var cloudUpperBound: Int = 10
    
    public static var d: CGFloat = 5.0
    public static var dRandomFrom: CGFloat = -4.0
    public static var dRandomTo: CGFloat = 2.0
    
    public static func GetOceanPosition() -> CGPoint
    {
        if(OrientationManager.Portrait){
            return CGPoint(x: 0, y: oceanCGFloat)
        }
        return CGPoint(x: oceanCGFloat, y: 0)
    }
    
    public static func GetPlanePosition() -> CGPoint
    {
        if(OrientationManager.Portrait){
            return CGPoint(x: 0, y: planeCGFloat)
        }
        return CGPoint(x: planeCGFloat, y: 0 )
    }
    
    public static func GetPlaneTouchMove(atPoint pos : CGPoint) -> CGPoint
    {
        if(OrientationManager.Portrait){
            return CGPoint(x: pos.x, y: planeCGFloat)
        }
        return CGPoint(x: planeCGFloat, y: pos.y)
    }
    
}




