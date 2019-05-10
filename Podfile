# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'NavigationAula' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
	
	pod 'Firebase'
	pod 'Firebase/Database'
	pod 'MessageKit'
  	pod 'Firebase/Core'
  	pod 'Firebase/Auth'
  	pod 'Firebase/Database'
  	pod 'Firebase/Storage'
  	pod 'Firebase/Firestore'
  	pod 'CenteredCollectionView'
  	post_install do |installer|
    	  installer.pods_project.targets.each do |target|
      	    if target.name == 'MessageKit'
               target.build_configurations.each do |config|
          	  config.build_settings['SWIFT_VERSION'] = '4.2'
               end
      	    end
    	  end
  	end	

  # Pods for NavigationAula

  target 'NavigationAulaTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NavigationAulaUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
