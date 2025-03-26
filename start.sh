#!/bin/bash
chmod +x ./pocketbase.exe  # Asegura que el archivo tenga permisos de ejecución
./pocketbase.exe serve --http 0.0.0.0:10000 --dir ./pb_data
