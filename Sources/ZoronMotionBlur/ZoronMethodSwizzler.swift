import Foundation
import ObjectiveC

public class ZoronMethodSwizzler {
    public static func swizzle(cls: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
        guard let originalMethod = class_getInstanceMethod(cls, originalSelector),
              let swizzledMethod = class_getInstanceMethod(cls, swizzledSelector) else {
            print("[ZoronMotionBlur] Failed to find methods for swizzling: \(originalSelector)")
            return
        }
        
        let didAddMethod = class_addMethod(cls,
                                           originalSelector,
                                           method_getImplementation(swizzledMethod),
                                           method_getTypeEncoding(swizzledMethod))
        
        if didAddMethod {
            class_replaceMethod(cls,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
        print("[ZoronMotionBlur] Successfully swizzled \(originalSelector)")
    }
}
