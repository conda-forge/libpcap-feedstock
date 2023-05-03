set BISON_PKGDATADIR=%BUILD_PREFIX%\Library\share\winflexbison\data\

set _pcap_builddir=%SRC_DIR%\build
cmake ^
    -S%SRC_DIR% ^
    -GNinja ^
    -B%_pcap_builddir% ^
    -G "Ninja" ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX%;%LIBRARY_LIB% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_INSTALL_SYSTEM_RUNTIME_LIBS_SKIP=True ^
    -DBUILD_SHARED_LIBS=ON ^
    -DOPENSSL_ROOT_DIR="%LIBRARY_PREFIX%" ^
    %SRC_DIR%
if errorlevel 1 exit 1

:: Build.
cmake --build %_pcap_builddir% --config Release
if errorlevel 1 exit 1

:: Install.
cmake --build %_pcap_builddir% --config Release --target install
if errorlevel 1 exit 1
