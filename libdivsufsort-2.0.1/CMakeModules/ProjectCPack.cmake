# If the cmake version includes cpack, use it
IF(EXISTS "${CMAKE_ROOT}/Modules/CPack.cmake")
  SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "${PROJECT_DESCRIPTION}")
  SET(CPACK_PACKAGE_VENDOR "${PROJECT_VENDOR}")
  SET(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/COPYING")
  SET(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/COPYING")
  SET(CPACK_PACKAGE_VERSION_MAJOR "${PROJECT_VERSION_MAJOR}")
  SET(CPACK_PACKAGE_VERSION_MINOR "${PROJECT_VERSION_MINOR}")
  SET(CPACK_PACKAGE_VERSION_PATCH "${PROJECT_VERSION_PATCH}")
#  SET(CPACK_PACKAGE_INSTALL_DIRECTORY "${PROJECT_NAME} ${PROJECT_VERSION}")
  SET(CPACK_SOURCE_PACKAGE_FILE_NAME "${PROJECT_NAME}-${PROJECT_VERSION_FULL}")

  IF(NOT DEFINED CPACK_SYSTEM_NAME)
    SET(CPACK_SYSTEM_NAME "${CMAKE_SYSTEM_NAME}-${CMAKE_SYSTEM_PROCESSOR}")
  ENDIF(NOT DEFINED CPACK_SYSTEM_NAME)

  IF(${CPACK_SYSTEM_NAME} MATCHES Windows)
    IF(CMAKE_CL_64)
      SET(CPACK_SYSTEM_NAME win64-${CMAKE_SYSTEM_PROCESSOR})
    ELSE(CMAKE_CL_64)
      SET(CPACK_SYSTEM_NAME win32-${CMAKE_SYSTEM_PROCESSOR})
    ENDIF(CMAKE_CL_64)
  ENDIF(${CPACK_SYSTEM_NAME} MATCHES Windows)

  IF(NOT DEFINED CPACK_PACKAGE_FILE_NAME)
    SET(CPACK_PACKAGE_FILE_NAME "${CPACK_SOURCE_PACKAGE_FILE_NAME}-${CPACK_SYSTEM_NAME}")
  ENDIF(NOT DEFINED CPACK_PACKAGE_FILE_NAME)

  SET(CPACK_PACKAGE_CONTACT "${PROJECT_CONTACT}")
  IF(UNIX)
    SET(CPACK_STRIP_FILES "")
    SET(CPACK_SOURCE_STRIP_FILES "")
#    SET(CPACK_PACKAGE_EXECUTABLES "ccmake" "CMake")
  ENDIF(UNIX)
  SET(CPACK_SOURCE_IGNORE_FILES "/CVS/" "/build/" "/\\\\.build/" "/\\\\.svn/" "~$")
  # include CPack model once all variables are set
  INCLUDE(CPack)
ENDIF(EXISTS "${CMAKE_ROOT}/Modules/CPack.cmake")