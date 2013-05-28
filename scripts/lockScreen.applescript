my lockScreen()

on lockScreen()
	set theRubyScript to "require 'osx/cocoa';
bundle = OSX::NSBundle.bundleWithPath('/Applications/Utilities/Keychain Access.app/Contents/Resources/Keychain.menu/');
bundle.load();
theClass = bundle.classNamed('AppleKeychainExtra');
keyChain = theClass.alloc().initWithBundle(nil);
keyChain._lockScreenMenuHit(nil);
"
	return do shell script "/usr/bin/ruby -e " & quoted form of theRubyScript
end lockScreen
