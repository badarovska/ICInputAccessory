platform :ios, "8.0"
use_frameworks!

workspace "ICInputAccessory"
project "ICInputAccessory"
project "Example/Example"

target "Example" do
  pod "ICInputAccessory/KeyboardDismissTextField", path: "./"
  pod "ICInputAccessory/TokenField", path: "./"
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["SWIFT_VERSION"] = "3.0"
    end
  end
end
