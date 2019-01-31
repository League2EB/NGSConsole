Pod::Spec.new do |s|
  s.name         = "NGSConsole"
  s.version      = "1.0.1"
  s.summary      = "WTFNGS"
  s.description  = <<-DESC
  A much much longer description of MyFramework.
                   DESC
  s.homepage     = "https://github.com/League2EB/NGSConsole.git"
  s.license      = "Copyleft"
  s.author       = { "NGS" => "a@a.a" }
  s.source       = { :path => '.' }
  s.ios.deployment_target = '9.0'
  s.source_files  = "NGSConsole/**/*.swift"
  s.dependency "CryptoSwift"
  s.dependency "JWTDecode"
  s.dependency "RxCocoa"
  s.dependency "ObjectMapper"
  s.dependency 'Moya','~> 11.0'
  s.dependency 'Moya/RxSwift','~> 11.0'
  s.dependency 'Moya-ObjectMapper/RxSwift'
end