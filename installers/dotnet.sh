#!/bin/bash
wget https://download.visualstudio.microsoft.com/download/pr/2ea7ea69-6110-4c39-a07c-bd4df663e49b/5d60f17a167a5696e63904f7a586d072/dotnet-sdk-3.1.102-linux-arm64.tar.gz
mkdir $HOME/dotnet
tar zxf dotnet-sdk-3.1.102-linux-arm64.tar.gz -C $HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet