Pod::Spec.new do |s|
    s.name         = "lab_sound_bridge"
    s.version      = '0.0.8'
    s.summary      = "Bridge to LabSound for Flutter"
    s.description      = <<-DESC
    This lib is used by the flutter plugin `lab_sound_flutter` to access the LabSound lib.
    It has been extracted to be isolated from Flutter and can be used with other frameworks 
    (for example pure dart).
                           DESC
    s.homepage     = "https://github.com/canardoux/lab_sound_bridge.git"
    s.license = { :type => "BSD", :file => "LICENSE" }
    s.author             = { "Xioxin" => "your@mail.com" }
    s.source       = { :git => "https://github.com/canardoux/lab_sound_bridge.git", :branch => "main", :tag => "#{s.version}" }
    s.vendored_frameworks = "build-ios/lipo/LabSoundBridge.framework/LabsSoundBridge"
    s.platform = :ios
    s.swift_version = "5.7"
    s.ios.deployment_target  = '12.0'
    #s.source_files = 'bridge/*'
    s.requires_arc = true
end
