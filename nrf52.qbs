import qbs

Project {
    property string target: "nrf52832_xxaa"
    property string board: "PCA10040"
    property string softdevice: "s132"

    references: [
        "nrf5_sdk",
    ]

    Product {
        name: "app.config"
        files: ["config/**"]

        Export {
            Depends {name: "cpp"}
            cpp.includePaths: ["config"]
        }
    }

    CppApplication {
        name: project.name
        type: ["application", "hex", "size"]
        Depends {name: "gcc-none"}
        Depends {name: "nrf5_sdk.ble"}

        files: [
            "main.c",
            "ble_app_hids_keyboard_gcc_nrf52.ld",
            "nrf5x_common.ld",
        ]

        Group {     // Properties for the produced executable
            fileTagsFilter: ["application", "hex", "bin"]
            qbs.install: true
        }
    }
}
