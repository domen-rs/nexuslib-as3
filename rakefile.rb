gem 'asrake', ">=0.8"
require 'asrake'

FlexSDK::SDK_PATHS << 'C:\develop\sdk\flex_sdk_4.6.0.23201'

#############################################
# Tasks
#############################################

task :default => :build

desc "Build all projects"
task :build

desc "Package all projects"
task :package

desc "Clean all projects"
task :clean

desc "Clobber all projects"
task :clobber

%w{reflection enigma}.each do |project|
	project = project.to_sym

	namespace project do

		root = "projects/#{project}"
		proj = "nexuslib.#{project}"
		version_file = "#{root}/VERSION"
		version = "#{Version.current(version_file) || '0.0.0'}"
		
		desc "Build nexuslib.#{project}"
		build = ASRake::CompcTask.new :build do |compc|
			compc.target_player = 11.0
			compc.output = "#{root}/bin/#{proj}.swc"
			compc.debug = true
			compc.source_path << "#{root}/src"
			compc.statically_link_only_referenced_classes << "lib/blooddy_crypto_0.3.5/blooddy_crypto.swc"
			#compc.dump_config = "#{root}/src/compc_config.xml"
		end

		desc "Package #{proj}-#{version}.zip"
		ASRake::PackageTask.new :package => :build do |package|
			package.output = "#{build.output_dir}/#{proj}-#{version}.zip"
			package.files = {
				"license.txt" => "LICENSE",
				"#{proj}-#{version}.swc" => build.output
			}
		end

		ASRake::VersionTask.new :version, version_file

		ASRake::CleanTask.new build

	end

	#add to root tasks
	task :build => "#{project}:build"
	task :package => "#{project}:package"
	task :clean => "#{project}:clean"
	task :clobber => "#{project}:clobber"
end