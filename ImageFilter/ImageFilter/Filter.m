//
//  Filter.m
//  
//
//  Created by 信勇哥得水牛 on 15/9/8.
//
//

#import "Filter.h"


@implementation Filter

static NSMutableArray * filterNameArr = nil;

+(Filter *)shareFilter
{
    static Filter * filter = nil;

    @synchronized(self){
    
        if (filter == nil) {
            
            filter = [[Filter alloc] init];
            
            filterNameArr = [[NSMutableArray alloc] initWithObjects:
                             // 1
                             @"CIAdditionCompositing",
                             @"CIAffineClamp",
                             @"CIAffineTile",
                             @"CIAffineTransform",
                             @"CIBarsSwipeTransition",
                             //2
                             @"CIBlendWithAlphaMask",
                             @"CIBlendWithMask",
                             @"CIBloom",
                             @"CIBumpDistortion",
                             @"CIBumpDistortionLinear",
                             //3
                             @"CICheckerboardGenerator",
                             @"CICircleSplashDistortion",
                             @"CICircularScreen",
                             @"CIColorBlendMode",
                             @"CIColorBurnBlendMode",
                             //4
                             @"CIColorClamp",
                             @"CIColorControls",
                             @"CIColorCrossPolynomial",
                             @"CIColorCube",
                             @"CIColorCubeWithColorSpace",
                             //5
                             @"CIColorDodgeBlendMode",
                             @"CIColorInvert",
                             @"CIColorMap",
                             @"CIColorMatrix",
                             @"CIColorMonochrome",
                             //6
                             @"CIColorPolynomial",
                             @"CIColorPosterize",
                             @"CIConstantColorGenerator",
                             @"CIConvolution3X3",
                             @"CIConvolution5X5",
                             //7
                             @"CIConvolution9Horizontal",
                             @"CIConvolution9Vertical",
                             @"CICopyMachineTransition",
                             @"CICrop",
                             @"CIDarkenBlendMode",
                             //8
                             @"CIDifferenceBlendMode",
                             @"CIDisintegrateWithMaskTransition",
                             @"CIDissolveTransition",
                             @"CIDotScreen",
                             @"CIEightfoldReflectedTile",
                             //9
                             @"CIExclusionBlendMode",
                             @"CIExposureAdjust",
                             @"CIFalseColor",
                             @"CIFlashTransition",
                             @"CIFourfoldReflectedTile",
                             //10
                             @"CIFourfoldRotatedTile",
                             @"CIFourfoldTranslatedTile",
                             @"CIGammaAdjust",
                             @"CIGaussianBlur",
                             @"CIGaussianGradient",
                             //11
                             @"CIGlideReflectedTile",
                             @"CIGloom",
                             @"CIHardLightBlendMode",
                             @"CIHatchedScreen",
                             @"CIHighlightShadowAdjust",
                             //12
                             @"CIHoleDistortion",
                             @"CIHueAdjust",
                             @"CIHueBlendMode",
                             @"CILanczosScaleTransform",
                             @"CILightenBlendMode",
                             //13
                             @"CILightTunnel",
                             @"CILinearGradient",
                             @"CILinearToSRGBToneCurve",
                             @"CILineScreen",
                             @"CILuminosityBlendMode",
                             //14
                             @"CIMaskToAlpha",
                             @"CIMaximumComponent",
                             @"CIMaximumCompositing",
                             @"CIMinimumComponent",
                             @"CIMinimumCompositing",
                             //15
                             @"CIModTransition",
                             @"CIMultiplyBlendMode",
                             @"CIMultiplyCompositing",
                             @"CIOverlayBlendMode",
                             @"CIPhotoEffectChrome",
                             //16
                             @"CIPhotoEffectFade",
                             @"CIPhotoEffectInstant",
                             @"CIPhotoEffectMono",
                             @"CIPhotoEffectNoir",
                             @"CIPhotoEffectProcess",
                             //17
                             @"CIPhotoEffectTonal",
                             @"CIPhotoEffectTransfer",
                             @"CIPinchDistortion",
                             @"CIPixellate",
                             @"CIQRCodeGenerator",
                             //18
                             @"CIAdditionCompositing",
                             @"CIAffineClamp",
                             @"CIAffineTile",
                             @"CIAffineTransform",
                             @"CIBarsSwipeTransition",
                             //19
                             @"CISharpenLuminance",
                             @"CISixfoldReflectedTile",
                             @"CISixfoldRotatedTile",
                             @"CISmoothLinearGradient",
                             @"CISoftLightBlendMode",
                             //20
                             @"CISourceAtopCompositing",
                             @"CISourceInCompositing",
                             @"CISourceOutCompositing",
                             @"CISourceOverCompositing",
                             @"CISRGBToneCurveToLinear",
                             //21
                             @"CIStarShineGenerator",
                             @"CIStraightenFilter",
                             @"CIStripesGenerator",
                             @"CISwipeTransition",
                             @"CITemperatureAndTint",
                             //22
                             @"CIToneCurve",
                             @"CITriangleKaleidoscope",
                             @"CITwelvefoldReflectedTile",
                             @"CITwirlDistortion",
                             @"CIUnsharpMask",
                             //23
                             @"CIVibrance",
                             @"CIVignette",
                             @"CIVignetteEffect",
                             @"CIVortexDistortion",
                             @"CIWhitePointAdjust",
                             nil];

        }
    
    }
    
    return filter;
    
}
-(NSString *)filterNameWithType:(CIImageFilterType)type
{
 
    return filterNameArr[type];

}

-(UIImage *)imageWithCIImageFilterTypeName:(CIImageFilterType)ciImageFilterType
                                   withImageName:(NSString *)imageName
{
    // 1.导入 CIImage图片
    CIImage * ciImage = [[CIImage alloc] initWithImage:[UIImage imageNamed:imageName]];
    
    // 2.创建出Filter滤镜
    CIFilter * filter = [CIFilter filterWithName:[[Filter shareFilter] filterNameWithType:ciImageFilterType]];
    
    [filter setValue:ciImage forKey:kCIInputImageKey];
    
    [filter setDefaults];
    
    CIImage * outImage = [filter valueForKey:kCIOutputImageKey];
    
    // 3.用CIContext将滤镜中的图片渲染出来，保存到一个结构体中
    CIContext * context = [CIContext contextWithOptions:nil];
    
    CGImageRef cgImage = [context createCGImage:outImage fromRect:[outImage extent]];
    
    // 4.导出图片
    UIImage * showImage = [UIImage imageWithCGImage:cgImage];
    
    CGImageRelease(cgImage);
    
    return showImage;
}

-(UIImage *)imageWIthMixFilterTypes:(NSArray *)types
                      withImageName:(NSString *)imageName
{
    // 1.导入 CIImage图片
    if (types.count == 0 || types == nil) {
        return [UIImage imageNamed:imageName];
    }
    
    CIImage * ciImage = [[CIImage alloc] initWithImage:[UIImage imageNamed:imageName]];
    
    CIImage * outCIImage = nil;
    
    for (int i = 0; i < types.count; i++) {
        
        NSDictionary * dic = types[i];
        
        NSString * type = [dic objectForKey:@"type"];
        
        /**
         *  特别注意，不同type对应不同key,所以key不是固定的
         */
        NSString * value = [dic objectForKey:@"value"];
        
        NSString * valueKey = [dic objectForKey:@"valueKey"];
        
        CIImage * currentCIImage = nil;
        
        if (i == 0 && types.count == 1) {
            
            outCIImage = [self ciImage:ciImage
                           effectValue:[NSNumber numberWithInteger:[value integerValue]]
                            valueKey:valueKey
                            filterType:type];
            
        }else if (i == 0 && types.count > 1){
        
            outCIImage = [self ciImage:ciImage
                           effectValue:[NSNumber numberWithInteger:[value integerValue]]
                              valueKey:valueKey
                            filterType:type];
        
        }else{
        
            currentCIImage = [self ciImage:outCIImage
                               effectValue:[NSNumber numberWithInteger:[value integerValue]]
                                  valueKey:valueKey
                                filterType:type];
            
            // 最后一张
            if (i == types.count-1) {
                outCIImage = currentCIImage;
            }

        }
        
    }
    
    // 3.用CIContext将滤镜中的图片渲染出来，保存到一个结构体中
    CIContext * context = [CIContext contextWithOptions:nil];
    
    CGImageRef cgImage = [context createCGImage:outCIImage fromRect:[outCIImage extent]]; //如果想指定一个区域可以修改rect
    
    // 4.导出图片
    UIImage * showImage = [UIImage imageWithCGImage:cgImage];
    
    CGImageRelease(cgImage);
    
    return showImage;

}

-(CIImage *)ciImage:(CIImage *)ciimage effectValue:(NSNumber *)effect valueKey:(NSString *)key filterType:(NSString *)ciImageFilterType
{
    CIFilter * filter = [CIFilter filterWithName:ciImageFilterType];
    
    /**
     *  想要设置其他效果可以从属性里面找
     */
    NSLog(@"%@",filter.attributes);
    
    [filter setValue:ciimage forKey:kCIInputImageKey];
    
    [filter setDefaults];
    
    if (effect && key) {
        [filter setValue:effect forKey:key];
    }
    
    CIImage * outImage = [filter valueForKey:kCIOutputImageKey];
    
    return outImage;
}
@end
