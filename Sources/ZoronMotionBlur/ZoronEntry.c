#include <stdio.h>
#include <dlfcn.h>
#include <objc/runtime.h>
#include <objc/message.h>

// Forward declaration of the Swift bootstrap function
extern void _ZMB_InitSwiftEngine(void);

__attribute__((constructor))
static void ZoronMotionBlurEntry(void) {
    printf("[ZoronMotionBlur] Dylib loaded into memory. Initializing Sub-Frame Accumulation Engine...\n");
    
    // Call the Swift bootstrap function
    _ZMB_InitSwiftEngine();
    
    printf("[ZoronMotionBlur] Swift Engine Initialized successfully.\n");
}
