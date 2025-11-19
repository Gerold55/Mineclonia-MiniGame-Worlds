#!/bin/sh

# run this script to automatically get all the required mods

mods=(
    https://codeload.github.com/minetest-mods/mesecons/zip/master,mesecons
    https://codeload.github.com/LNJ2/carpet/zip/master,carpet
    https://codeload.github.com/minetest-mods/crops/zip/master,crops
    https://codeload.github.com/minetest-mods/flowerpot/zip/master,flowerpot
    https://codeload.github.com/minetest-mods/lapis/zip/master,lapis
    https://codeload.github.com/minetest-mods/quartz/zip/master,quartz
    https://codeload.github.com/minetest-mods/xdecor/zip/master,xdecor
    https://codeload.github.com/oOChainLynxOo/hardenedclay/zip/master,hardenedclay
    https://codeload.github.com/minetest-mods/nether/zip/master,nether
    https://codeload.github.com/ShadowNinja/minetest_bedrock/zip/master,minetest_bedrock
    https://gitlab.com/VanessaE/basic_materials/-/archive/master/basic_materials-master.zip,basic_materials
    https://gitlab.com/VanessaE/biome_lib/-/archive/master/biome_lib-master.zip,biome_lib
    https://gitlab.com/VanessaE/plantlife_modpack/-/archive/master/plantlife_modpack-master.zip,plantlife_modpack
    https://gitlab.com/VanessaE/signs_lib/-/archive/master/signs_lib-master.zip,signs_lib
)

cd worldmods

for item in ${mods[@]} ; do
(
    url=$(echo $item | cut -d, -f1)
    mod=$(echo $item | cut -d, -f2)
    echo "Fetching: $mod"
    curl -q -L -o $mod.zip $url
    unzip -qq $mod.zip
    rm $mod.zip
    mv $mod-master $mod
    mv minetest_bedrock bedrock
)
done

# remove unneeded/unwanted submods
for ex in plantlife_modpack/dryplants plantlife_modpack/along_shore plantlife_modpack/molehills plantlife_modpack/woodsoils plantlife_modpack/bushes plantlife_modpack/bushes_classic plantlife_modpack/youngtrees plantlife_modpack/3dmushrooms plantlife_modpack/cavestuff plantlife_modpack/poisonivy plantlife_modpack/trunks; do
    echo "Pruning: $ex"
    rm -rf $ex
done
