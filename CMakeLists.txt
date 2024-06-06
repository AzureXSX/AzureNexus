cmake_minimum_required(VERSION 3.16)

project(AzureNexus VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.7 COMPONENTS Quick REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS Widgets Multimedia)

qt_add_executable(appAzureNexus
    main.cpp
)

qt_add_qml_module(appAzureNexus
    URI AzureNexus
    VERSION 1.0
    QML_FILES main.qml
    SOURCES quicclient.h quicclient.cpp
    SOURCES appAzureNexus/proto/test.pb.h
    SOURCES appAzureNexus/proto/test.pb.cc
    SOURCES screencapture.h screencapture.cpp
    SOURCES voicecapture.h voicecapture.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appAzureNexus PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appAzureNexus
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appAzureNexus PRIVATE
    Qt6::Quick
    Qt6::Multimedia
    ${CMAKE_CURRENT_SOURCE_DIR}/appAzureNexus/MsQuic/bin/libmsquic.so
    protobuf
    absl_log_internal_check_op
    absl_log_internal_message
    absl_cord
    absl_cordz_info
)

include(GNUInstallDirs)
install(TARGETS appAzureNexus
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
