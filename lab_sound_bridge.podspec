Pod::Spec.new do |s|
    s.name         = "lab_sound_bridge"
    s.version      = '0.0.26'
    s.summary      = "Bridge to LabSound for Flutter"
    s.description      = <<-DESC
    This lib is used by the flutter plugin `lab_sound_flutter` to access the LabSound lib.
    It has been extracted to be isolated from Flutter and can be used with other frameworks 
    (for example pure dart).
                           DESC
    s.homepage     = "https://github.com/canardoux/lab_sound_bridge.git"
    s.license = { :type => "BSD", :file => "LICENSE" }
    s.author             = { "larpoux" => "larpoux@gmail.com" }
    s.source       = { :git => "https://github.com/canardoux/lab_sound_bridge.git", :branch => "main", :tag => "#{s.version}" }
    s.vendored_frameworks = "products/ios/LabSoundBridge.xcframework"
    s.platform = :ios
    s.swift_version = "5.7"
    s.ios.deployment_target  = '12.0'
    s.source_files =          ['bridge/**/*','LabSound/include/LabSound/*.h']
    s.public_header_files   = ['bridge/**/*.h','LabSound/include/LabSound/*.h']
    s.requires_arc = true
    s.xcconfig = { 'HEADER_SEARCH_PATHS' => [
        'LabSound/include/'
    ]}
end
