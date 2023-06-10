reset:
	fvm flutter clean &&\
	rm -Rf ios/Pods &&\
	rm -Rf ios/Podfile.lock &&\
	rm -Rf ios/.symlinks &&\
	rm -Rf ios/Flutter/Flutter.framework &&\
	rm -Rf ios/Flutter/Flutter.podspec &&\
	fvm flutter pub get &&\
	fvm flutter packages pub get &&\
	fvm flutter precache --ios &&\
	cd ios &&\
	arch -x86_64 pod install --repo-update &&\
	cd ..
	
setup:
	fvm install --verbose

clean:
	fvm flutter clean &&\
	fvm flutter pub cache clean

get:
	fvm flutter pub get &&\
	fvm flutter packages pub get
