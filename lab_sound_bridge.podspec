Pod::Spec.new do |s|
    s.name         = "lab_sound_bridge"
    s.version      = "0.0.2"
    s.summary      = "VeryUsefulFramework: VeryUsefulFramework"
    s.description  = "your description"
    s.homepage     = "https://github.com/canardoux/lab_sound_bridge.git"
    s.license = { :type => "MIT", :file => "LICENSE" }
    s.author             = { "Oguzhan Karakus" => "your@mail.com" }
    s.source       = { :git => "https://github.com/oguzhankarakus/VeryUsefulFramework.git", :branch => "main", :tag => "#{s.version}" }
    s.vendored_frameworks = "VeryUsefulFramework.xcframework"
    s.platform = :ios
    s.swift_version = "5.7"
    s.ios.deployment_target  = '16.0'
    s.requires_arc = true
end
