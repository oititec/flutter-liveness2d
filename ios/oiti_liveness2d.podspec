Pod::Spec.new do |s|
  s.name              = 'oiti_liveness2d'
  s.version           = '1.0.0'
  s.summary           = 'A new Flutter plugin project.'
  s.description       = 'A new Flutter plugin project.'
  s.homepage          = 'https://oititec.com.br/'
  s.license           = { :type => "Copyright", :text => "Oiti." }
  s.author            = "Oiti"
  s.platform          = :ios, '11.0'
  s.swift_version     = '5.0'
  s.source            = { :path => '.' }
  s.source_files      = 'Classes/**/*'

  s.dependency 'Flutter'
  s.dependency 'FaceCaptcha', '~> 4.1.3'
#  s.dependency 'OISecurity', '~> 1.0.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
