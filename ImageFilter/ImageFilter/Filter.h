//
//  Filter.h
//  
//
//  Created by 信勇哥得水牛 on 15/9/8.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  滤镜设置参数
 */
#define TYPE @"type"
#define VALUEKEY @"valueKey"
#define VALUE @"value"

typedef NS_ENUM(NSInteger, CIImageFilterType) {
    CIAdditionCompositing = 0,
    CIAffineClamp,
    CIAffineTile,
    CIAffineTransform,
    CIBarsSwipeTransition,
    CIBlendWithAlphaMask,
    CIBlendWithMask,
    CIBloom,
    CIBumpDistortion,
    CIBumpDistortionLinear,
    CICheckerboardGenerator,
    CICircleSplashDistortion,
    CICircularScreen,
    CIColorBlendMode,
    CIColorBurnBlendMode,
    CIColorClamp,
    CIColorControls,
    CIColorCrossPolynomial,
    CIColorCube,
    CIColorCubeWithColorSpace,
    CIColorDodgeBlendMode,
    CIColorInvert,
    CIColorMap,
    CIColorMatrix,
    CIColorMonochrome,
    CIColorPolynomial,
    CIColorPosterize,
    CIConstantColorGenerator,
    CIConvolution3X3,
    CIConvolution5X5,
    CIConvolution9Horizontal,
    CIConvolution9Vertical,
    CICopyMachineTransition,
    CICrop,
    CIDarkenBlendMode,
    CIDifferenceBlendMode,
    CIDisintegrateWithMaskTransition,
    CIDissolveTransition,
    CIDotScreen,
    CIEightfoldReflectedTile,
    CIExclusionBlendMode,
    CIExposureAdjust,
    CIFalseColor,
    CIFlashTransition,
    CIFourfoldReflectedTile,
    CIFourfoldRotatedTile,
    CIFourfoldTranslatedTile,
    CIGammaAdjust,
    CIGaussianBlur,
    CIGaussianGradient,
    CIGlideReflectedTile,
    CIGloom,
    CIHardLightBlendMode,
    CIHatchedScreen,
    CIHighlightShadowAdjust,
    CIHoleDistortion,
    CIHueAdjust,
    CIHueBlendMode,
    CILanczosScaleTransform,
    CILightenBlendMode,
    CILightTunnel,
    CILinearGradient,
    CILinearToSRGBToneCurve,
    CILineScreen,
    CILuminosityBlendMode,
    CIMaskToAlpha,
    CIMaximumComponent,
    CIMaximumCompositing,
    CIMinimumComponent,
    CIMinimumCompositing,
    CIModTransition,
    CIMultiplyBlendMode,
    CIMultiplyCompositing,
    CIOverlayBlendMode,
    CIPhotoEffectChrome,
    CIPhotoEffectFade,
    CIPhotoEffectInstant,
    CIPhotoEffectMono,
    CIPhotoEffectNoir,
    CIPhotoEffectProcess,
    CIPhotoEffectTonal,
    CIPhotoEffectTransfer,
    CIPinchDistortion,
    CIPixellate,
    CIQRCodeGenerator,
    CIRadialGradient,
    CIRandomGenerator,
    CISaturationBlendMode,
    CIScreenBlendMode,
    CISepiaTone,
    CISharpenLuminance,
    CISixfoldReflectedTile,
    CISixfoldRotatedTile,
    CISmoothLinearGradient,
    CISoftLightBlendMode,
    CISourceAtopCompositing,
    CISourceInCompositing,
    CISourceOutCompositing,
    CISourceOverCompositing,
    CISRGBToneCurveToLinear,
    CIStarShineGenerator,
    CIStraightenFilter,
    CIStripesGenerator,
    CISwipeTransition,
    CITemperatureAndTint,
    CIToneCurve,
    CITriangleKaleidoscope,
    CITwelvefoldReflectedTile,
    CITwirlDistortion,
    CIUnsharpMask,
    CIVibrance,
    CIVignette,
    CIVignetteEffect,
    CIVortexDistortion,
    CIWhitePointAdjust,
};

@interface Filter : NSObject

/**
 *  滤镜器单例
 *
 *  @return 滤镜器
 */
+(Filter *)shareFilter;

/**
 *  通过枚举返回滤镜器类型名称
 *
 *  @param type 滤镜器类型
 *
 *  @return 滤镜器名称
 */
-(NSString *)filterNameWithType:(CIImageFilterType)type;

/**
 *  创建一张带滤镜效果的UIImage
 *
 *  @param imageFilterName 滤镜名称
 *
 *  @param imageName 图片名称
 *
 *  @return 添加滤镜效果之后的UIImage
 */
-(UIImage *)imageWithCIImageFilterTypeName:(CIImageFilterType)ciImageFilterType
                             withImageName:(NSString *)imageName;


/**
 *  创建一张混合效果的滤镜
 *
 *  @param types     滤镜效果数组
 *  @param imageName 图片名称
 *
 *  @return 添加混合滤镜效果之后的UIImage
 */
-(UIImage *)imageWIthMixFilterTypes:(NSArray *)types
                      withImageName:(NSString *)imageName;
@end







