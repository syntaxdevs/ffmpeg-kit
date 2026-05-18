require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = 'ffmpeg-kit-react-native'
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platform          = :ios
  s.requires_arc      = true
  s.static_framework  = true

  s.source = { :path => __dir__ }

  # Downloads iOS xcframeworks for the +full subspec (syntaxdevs release)
  s.prepare_command = <<-CMD
    set -e
    FRAMEWORKS_DIR="ffmpeg-kit-ios-full"
    ZIP_URL="https://github.com/syntaxdevs/ffmpeg-kit/releases/download/ios-binaries-6.0/ffmpeg-kit-ios-full.zip"
    if [ ! -d "${FRAMEWORKS_DIR}/ffmpegkit.xcframework" ]; then
      echo "Downloading FFmpegKit iOS full binaries..."
      curl -fsSL "${ZIP_URL}" -o "${TMPDIR:-/tmp}/ffmpeg-kit-ios-full.zip"
      unzip -o "${TMPDIR:-/tmp}/ffmpeg-kit-ios-full.zip" -d .
    fi
  CMD

  s.default_subspec   = 'full'

  s.dependency "React-Core"

  s.subspec 'min' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-min', "6.0"
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'min-lts' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-min', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

  s.subspec 'min-gpl' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-min-gpl', "6.0"
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'min-gpl-lts' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-min-gpl', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

  s.subspec 'https' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-https', "6.0"
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'https-lts' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-https', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

  s.subspec 'https-gpl' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-https-gpl', "6.0"
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'https-gpl-lts' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-https-gpl', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

  s.subspec 'audio' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-audio', "6.0"
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'audio-lts' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-audio', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

  s.subspec 'video' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-video', "6.0"
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'video-lts' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-video', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

  s.subspec 'full' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.vendored_frameworks = 'ffmpeg-kit-ios-full/*.xcframework'
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'full-lts' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-full', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

  s.subspec 'full-gpl' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-full-gpl', "6.0"
      ss.ios.deployment_target = '12.1'
  end

  s.subspec 'full-gpl-lts' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'ffmpeg-kit-ios-full-gpl', "6.0.LTS"
      ss.ios.deployment_target = '10'
  end

end
