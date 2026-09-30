idf_component_register(SRCS "vfs_port.c" "main.c"
                    INCLUDE_DIRS "."
                    REQUIRES cherry-embedded__cherryusb
                    REQUIRES vfs)
