import SwiftUI
import Foundation


struct Flower:Identifiable{
    let id = UUID()
    let name:String
    let description:String
    let conditions:String
    let temperature:String
    let blossomTime:String
    let radius:Int
    let image:Image
}
