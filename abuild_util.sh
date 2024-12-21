echo "Creating apk-temp directory..."
mkdir -p ~/apk-temp && \
echo "Copying qotd-client binary..."
cp /qotd-client/qotd-client ~/apk-temp && \
echo "Copying APKBUILD file..."
cp /qotd-client/APKBUILD ~/apk-temp/ && \
echo "Changing directory to apk-temp..."
cd ~/apk-temp && \
echo "Running abuild checksum..."
abuild checksum && \
echo "Building the package..."
abuild -rF && \
echo "Copying the built package to release directory..."
cp ../packages/builduser/x86_64/qotd-client-1.0-r0.apk /qotd-client/release/ && \
echo "Package build and copy completed."