Pod::Spec.new do |s|
  s.name                = "EasyMailSender"
  s.version             = "0.0.1"
  s.summary             = "Easy to send e-mail by MFMailComposeViewController."
  s.homepage            = "https://github.com/azu/EasyMailSender"
  s.license             = {:type => "MIT", :file => "LICENSE"}
  s.author              = {"azu" => "info@efcl.info"}
  s.platform            = :ios
  s.source              = {
      :git => "https://github.com/azu/EasyMailSender.git",
      :tag => s.version.to_s}
  s.source_files        = "Classes", "Classes/**/*.{h,m}"
  s.ios.resource_bundle = {'EasyMailSender' => ['CLasses/Localizable/*.lproj']}
  s.framework           = "MessageUI"
  s.requires_arc        = true
end
