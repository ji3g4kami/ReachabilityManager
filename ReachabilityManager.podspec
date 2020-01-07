Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '9.0'
s.name = "ReachabilityManager"
s.module_name = 'ReachabilityManager'
s.summary = "Monitor connection and to implement the functions you wanted"
s.requires_arc = true

# 2
s.version = "1.0.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "吳登秝" => "ji3g4kami@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/ji3g4kami/ReachabilityManager"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/ji3g4kami/ReachabilityManager.git",
             :tag => "#{s.version}" }

# 7 - Frameworks, libraries and dependencies
s.framework = 'SystemConfiguration'

# 8
s.source_files = ["ReachabilityManager/*.swift", "ReachabilityManager/ReachabilityManager.h"]
s.public_header_files = ["ReachabilityManager/ReachabilityManager.h"]

# 10
s.swift_version = "5.0"

# 11
s.dependency 'ReachabilitySwift'

s.static_framework = true
end
