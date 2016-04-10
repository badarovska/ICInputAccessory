task default: "ci:test"

namespace :ci do
  desc "Run tests on Travis CI with a specified OS version, default OS=latest"
  task :test, [:os] do |t, args|
    version = args[:os] || "latest"
    Rake::Task["framework:build"].invoke version
    # UI Testing requires iOS Simulator 9.0 or later.
    if version == "latest" || Gem::Version.new("9.0") <= Gem::Version.new(version)
      Rake::Task["example:test"].invoke version
    else
      Rake::Task["example:build"].invoke version
    end
  end
end

namespace :example do
  desc "Build the example project"
  task :build, [:os] do |t, args|
    version = args[:os] || "latest"
    sh %(xcodebuild -workspace ICInputAccessory.xcworkspace -scheme Example -sdk iphonesimulator -destination "name=iPhone 5,OS=#{version}" clean build | xcpretty -c && exit ${PIPESTATUS[0]})
    exit $?.exitstatus if not $?.success?
  end

  desc "Run the UI tests in the example project"
  task :test, [:os] do |t, args|
    version = args[:os] || "latest"
    sh %(xcodebuild -workspace ICInputAccessory.xcworkspace -scheme Example -sdk iphonesimulator -destination "name=iPhone 6,OS=#{version}" -enableCodeCoverage YES clean test GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES | xcpretty -c && exit ${PIPESTATUS[0]})
    exit $?.exitstatus if not $?.success?
  end
end

namespace :framework do
  desc "Build the framework project"
  task :build, [:os] do |t, args|
    version = args[:os] || "latest"
    sh %(xcodebuild -project ICInputAccessory.xcodeproj -scheme ICInputAccessory-iOS -sdk iphonesimulator -destination "name=iPhone 5,OS=#{version}" clean build | xcpretty -c && exit ${PIPESTATUS[0]})
    exit $?.exitstatus if not $?.success?
  end
end

desc "Collect coverage"
task :coverage do
  sh %(bundle exec slather coverage -s --input-format profdata --scheme Example --workspace ICInputAccessory.xcworkspace Example/Example.xcodeproj)
end
