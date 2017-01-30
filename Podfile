source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'

use_frameworks!

def pods
	pod 'Moya', '~> 8.0'
	pod 'SnapKit', '~> 3.1'
	pod 'RealmSwift', '~> 2.3'
	pod 'ProcedureKit', '~> 4.0'
	pod 'Kingfisher', '~> 3.3'
	pod 'PromiseKit', '~> 4.1'
	pod 'Unbox', '~> 2.3'
	pod 'CryptoSwift', '~> 0.6'
	pod 'JSQCoreDataKit', '~> 6.0'
end

def testing_pods
	pod 'Quick', '~> 1.0'
	pod 'Nimble', '~> 6.0'
end

target 'swiftsampleprojectTests' do
	pods
	testing_pods
end

target 'swiftsampleprojectUITests' do
	pods
	testing_pods
end

target 'swiftsampleproject' do
	pods
end

post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
			config.build_settings['SWIFT_VERSION'] = '3.0'
		end
	end
end
