{
    "id": "160fa145-2c8d-4b96-a10f-c2e3573827a7",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "gml_tasks",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": -1,
    "date": "2018-12-28 12:06:39",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "c0a624a4-62fb-4dc1-a6f7-cd55c93bfdc3",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": -1,
            "filename": "gml_tasks.gml",
            "final": "",
            "functions": [
                {
                    "id": "9dafe5d1-2bdf-4e06-adc5-886e41d2470a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gml_task_ini",
                    "help": "gml_task_ini()",
                    "hidden": false,
                    "kind": 2,
                    "name": "gml_task_ini",
                    "returnType": 2
                },
                {
                    "id": "3dc66403-7417-4f2b-b535-3916a8b467c3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "gml_task_cleanup",
                    "help": "gml_task_cleanup()",
                    "hidden": false,
                    "kind": 2,
                    "name": "gml_task_cleanup",
                    "returnType": 2
                },
                {
                    "id": "360490e6-7a01-41f3-b6dd-77b3797a9201",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gml_task_step",
                    "help": "gml_task_step()",
                    "hidden": false,
                    "kind": 2,
                    "name": "gml_task_step",
                    "returnType": 2
                },
                {
                    "id": "d95fc3af-1af7-4c06-a6eb-4ec1cdfacdc2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        1,
                        2,
                        2
                    ],
                    "externalName": "gml_task_create",
                    "help": "gml_task_create(name,fps_min,[scripts])",
                    "hidden": false,
                    "kind": 2,
                    "name": "gml_task_create",
                    "returnType": 2
                },
                {
                    "id": "54203304-cff1-45c3-a1f6-fa93ac8b1036",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "gml_task_cleanup_script",
                    "help": "gml_task_cleanup_script(task_map,script)",
                    "hidden": false,
                    "kind": 2,
                    "name": "gml_task_cleanup_script",
                    "returnType": 2
                },
                {
                    "id": "fd43960e-6644-480e-a0e4-f74b0fb2d3c7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "gml_task_progress_get",
                    "help": "gml_task_progress_get()",
                    "hidden": false,
                    "kind": 2,
                    "name": "gml_task_progress_get",
                    "returnType": 2
                },
                {
                    "id": "b15e921f-e0a0-42da-9e58-58dc81cdc316",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "gml_task_find",
                    "help": "gml_task_find(name)",
                    "hidden": false,
                    "kind": 2,
                    "name": "gml_task_find",
                    "returnType": 2
                },
                {
                    "id": "7d811304-a5ec-45db-84c7-0e7c08c1f0af",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gml_task_find_all",
                    "help": "gml_task_find_all()",
                    "hidden": false,
                    "kind": 2,
                    "name": "gml_task_find_all",
                    "returnType": 2
                },
                {
                    "id": "300fceeb-98c9-4e65-8c7e-11e27ec09722",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "gml_task_value_add",
                    "help": "gml_task_value_add(task_map,key_real,value_real)",
                    "hidden": false,
                    "kind": 2,
                    "name": "gml_task_value_add",
                    "returnType": 2
                },
                {
                    "id": "3221288c-b984-461d-8171-3e9acf9621d1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "gml_task_value_set",
                    "help": "gml_task_value_set(task_map,key_real,value_real)",
                    "hidden": false,
                    "kind": 2,
                    "name": "gml_task_value_set",
                    "returnType": 2
                },
                {
                    "id": "aa46fcb6-1c15-4f11-8952-a35b7303aed3",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "gml_task_value_get",
                    "help": "gml_task_value_get(task_map,key_real)",
                    "hidden": false,
                    "kind": 2,
                    "name": "gml_task_value_get",
                    "returnType": 2
                },
                {
                    "id": "ec177dc3-6b0c-44da-a7e4-0c3da2b6fbed",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "gml_task_time_system",
                    "help": "gml_task_time_system()",
                    "hidden": false,
                    "kind": 2,
                    "name": "gml_task_time_system",
                    "returnType": 2
                },
                {
                    "id": "aa6b397e-6b8f-43f7-a2f0-19496c243b60",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "gml_task_time_task",
                    "help": "gml_task_time_task(task_map)",
                    "hidden": false,
                    "kind": 2,
                    "name": "gml_task_time_task",
                    "returnType": 2
                },
                {
                    "id": "2c8b85b1-88ee-42af-a255-c94a7130fd63",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "externalName": "gml_task_remove",
                    "help": "gml_task_remove(task_map)",
                    "hidden": false,
                    "kind": 2,
                    "name": "gml_task_remove",
                    "returnType": 2
                }
            ],
            "init": "gml_task_ini",
            "kind": 2,
            "order": [
                "9dafe5d1-2bdf-4e06-adc5-886e41d2470a",
                "3dc66403-7417-4f2b-b535-3916a8b467c3",
                "360490e6-7a01-41f3-b6dd-77b3797a9201",
                "d95fc3af-1af7-4c06-a6eb-4ec1cdfacdc2",
                "54203304-cff1-45c3-a1f6-fa93ac8b1036",
                "fd43960e-6644-480e-a0e4-f74b0fb2d3c7",
                "b15e921f-e0a0-42da-9e58-58dc81cdc316",
                "7d811304-a5ec-45db-84c7-0e7c08c1f0af",
                "300fceeb-98c9-4e65-8c7e-11e27ec09722",
                "3221288c-b984-461d-8171-3e9acf9621d1",
                "aa46fcb6-1c15-4f11-8952-a35b7303aed3",
                "ec177dc3-6b0c-44da-a7e4-0c3da2b6fbed",
                "aa6b397e-6b8f-43f7-a2f0-19496c243b60",
                "2c8b85b1-88ee-42af-a255-c94a7130fd63"
            ],
            "origname": "",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosplistinject": "",
    "license": "",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "version": "0.0.1"
}