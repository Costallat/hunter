include(CMakePackageConfigHelpers)
include(hunter_assert_not_empty_string)

function(hunter_install_libsodium_config)

    hunter_assert_not_empty_string("${HUNTER_libsodium_VERSION}")
    hunter_assert_not_empty_string("${HUNTER_PACKAGE_INSTALL_PREFIX}")
    hunter_assert_not_empty_string("${HUNTER_SELF}")

    set(templates "${HUNTER_SELF}/cmake/templates")
    set(configs   "${HUNTER_PACKAGE_INSTALL_PREFIX}/lib/cmake/libsodium")

    if(NOT BUILD_SHARED_LIBS)
        set(TARGET_INTERFACE_COMPILE_DEFINITIONS "INTERFACE_COMPILE_DEFINITIONS SODIUM_STATIC")
    endif()

    write_basic_package_version_file("${configs}/libsodiumConfig.cmake" VERSION "${HUNTER_libsodium_VERSION}" COMPATIBILITY ExactVersion)

    configure_file(
            "${templates}/libsodiumConfig.cmake.in"
            "${configs}/libsodiumConfig.cmake"
            @ONLY
    )

endfunction()


function(hunter_install_libsodium_targets)

    hunter_assert_not_empty_string("${HUNTER_PACKAGE_INSTALL_PREFIX}")
    hunter_assert_not_empty_string("${HUNTER_SELF}")
    hunter_assert_not_empty_string("${TARGET_CONFIGURATION}")
    hunter_assert_not_empty_string("${TARGET_LIB_FILE}")

    set(templates "${HUNTER_SELF}/cmake/templates")
    set(configs   "${HUNTER_PACKAGE_INSTALL_PREFIX}/lib/cmake/libsodium")

    configure_file(
            "${templates}/libsodiumTargets.cmake.in"
            "${configs}/libsodiumTargets-${TARGET_CONFIGURATION}.cmake"
            @ONLY
    )

endfunction()
