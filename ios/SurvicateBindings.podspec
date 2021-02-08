
Pod::Spec.new do |s|
  s.name         = "SurvicateBindings"
  s.version      = "1.0.0"
  s.summary      = "SurvicateBindings"
  s.description  = <<-DESC
                  React native module bridge between JS code and Survicate service
                   DESC
  s.homepage     = "https://github.com/mikalaidev/react-native-survicate.git"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/mikalaidev/react-native-survicate.git", :tag => "master" }
  s.source_files  = "*"
  s.requires_arc = true


  s.dependency "React"
  s.dependency 'Survicate', '1.4.3'
  #s.dependency "others"
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64', 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end

  
