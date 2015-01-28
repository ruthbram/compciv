# download namesbystate.zip into a directory called "data-hold/names-by-state" 
mkdir -p data-hold/names-by-state
cd data-hold/names-by-state
curl http://stash.compciv.org/ssa_baby_names/namesbystate.zip -o namesbystate.zip
unzip namesbystate.zip
rm namesbystate.zip

# download name.zip into a directory called "data-hold/names-nationwide

mkdir names-nationwide
cd names-nationwide
curl http://stash.compciv.org/ssa_baby_names/names.zip -o names.zip
unzip names.zip
rm names.zip
