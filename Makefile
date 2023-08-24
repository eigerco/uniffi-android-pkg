generate: init bindgen sharedlib

init:
	git submodule update --init

bindgen:
	cd ./uniffi-zcash-lib/lib/uniffi-zcash && cargo run -p uniffi-bindgen generate ./src/zcash.udl --config ./uniffi.toml --language kotlin --out-dir ../../../uniffi-android-pkg/src/main/java

sharedlib:
	./gradlew cargoBuild

publish:
	./gradlew publish
