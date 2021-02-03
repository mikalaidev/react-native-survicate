
Pod::Spec.new do |s|
  s.name         = "RNReactNativeSurvicate"
  s.version      = "1.0.0"
  s.summary      = "RNReactNativeSurvicate"
  s.description  = <<-DESC
                  RNReactNativeSurvicate
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNReactNativeSurvicate.git", :tag => "master" }
  s.source_files  = "RNReactNativeSurvicate/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency 'Survicate', '1.4.2'
  #s.dependency "others"

end

  