
# version 50001

data_pipeline_general

_rlnPipeLineJobCounter                      99
 

# version 50001

data_pipeline_processes

loop_ 
_rlnPipeLineProcessName #1 
_rlnPipeLineProcessAlias #2 
_rlnPipeLineProcessTypeLabel #3 
_rlnPipeLineProcessStatusLabel #4 
Import/job001/       None relion.import.movies  Succeeded 
Select/job002/       None relion.select.split  Succeeded 
MotionCorr/job005/       None relion.motioncorr.own  Succeeded 
MotionCorr/job006/       None relion.motioncorr.own  Succeeded 
CtfFind/job007/       None relion.ctffind.ctffind4  Succeeded 
ManualPick/job008/       None relion.manualpick  Succeeded 
AutoPick/job009/       None relion.autopick.log  Succeeded 
AutoPick/job010/       None relion.autopick.log  Succeeded 
Extract/job011/       None relion.extract  Succeeded 
Extract/job012/       None relion.extract  Succeeded 
Extract/job013/       None relion.extract  Succeeded 
Class2D/job015/       None relion.class2d  Succeeded 
Class2D/job016/       None relion.class2d  Succeeded 
AutoPick/job018/       None relion.autopick.log  Succeeded 
Import/job019/       None relion.import.other  Succeeded 
AutoPick/job021/       None relion.autopick.ref3d  Succeeded 
AutoPick/job022/       None relion.autopick.ref3d  Succeeded 
AutoPick/job023/       None relion.autopick.log  Succeeded 
Extract/job025/       None relion.extract  Succeeded 
Class2D/job026/       None relion.class2d  Succeeded 
AutoPick/job027/       None relion.autopick.log  Succeeded 
Extract/job028/       None relion.extract  Succeeded 
Class2D/job029/       None relion.class2d  Succeeded 
Import/job030/       None relion.import.other  Succeeded 
AutoPick/job031/       None relion.autopick.ref3d  Succeeded 
Import/job032/       None relion.import.other  Succeeded 
AutoPick/job033/       None relion.autopick.ref3d  Succeeded 
AutoPick/job034/       None relion.autopick.ref3d  Succeeded 
Select/job036/       None relion.select.class2dauto  Succeeded 
Select/job037/       None relion.select.class2dauto  Succeeded 
Select/job038/       None relion.select.interactive  Succeeded 
AutoPick/job040/       None relion.autopick.ref2d  Succeeded 
AutoPick/job041/       None relion.autopick.ref2d  Succeeded 
AutoPick/job042/       None relion.autopick.ref2d  Succeeded 
AutoPick/job043/       None relion.autopick.ref2d  Succeeded 
AutoPick/job044/       None relion.autopick.ref2d  Succeeded 
AutoPick/job045/       None relion.autopick.ref2d  Succeeded 
AutoPick/job046/       None relion.autopick.ref2d  Succeeded 
AutoPick/job047/       None relion.autopick.ref2d  Succeeded 
AutoPick/job048/       None relion.autopick.log  Succeeded 
Extract/job049/       None relion.extract  Succeeded 
Class2D/job050/       None relion.class2d  Succeeded 
Select/job051/       None relion.select.class2dauto  Succeeded 
Select/job052/       None relion.select.class2dauto  Succeeded 
Select/job053/       None relion.select.class2dauto  Succeeded 
Select/job055/       None relion.select.interactive  Succeeded 
InitialModel/job056/       None relion.initialmodel     Failed 
Class2D/job057/       None relion.class2d  Succeeded 
Select/job059/       None relion.select.interactive  Succeeded 
AutoPick/job060/       None relion.autopick.topaz.train  Succeeded 
AutoPick/job061/       None relion.autopick.topaz.pick  Succeeded 
AutoPick/job062/       None relion.autopick.topaz.pick  Succeeded 
AutoPick/job063/       None relion.autopick.topaz.pick  Succeeded 
Class3D/job064/       None relion.class3d  Succeeded 
Extract/job065/       None relion.extract  Succeeded 
Class2D/job066/       None relion.class2d    Aborted 
AutoPick/job067/       None relion.autopick.topaz.pick  Succeeded 
Extract/job068/       None relion.extract  Succeeded 
Class2D/job069/       None relion.class2d  Succeeded 
ManualPick/job070/       None relion.manualpick  Succeeded 
Select/job071/       None relion.select.class2dauto  Succeeded 
Select/job072/       None relion.select.interactive  Succeeded 
Class3D/job073/       None relion.class3d     Failed 
Extract/job074/       None relion.extract  Succeeded 
Extract/job075/       None relion.extract  Succeeded 
Class2D/job076/       None relion.class2d  Succeeded 
Class2D/job077/       None relion.class2d  Succeeded 
Class2D/job078/       None relion.class2d  Succeeded 
Select/job079/       None relion.select.interactive  Succeeded 
Class2D/job080/       None relion.class2d  Succeeded 
Select/job081/       None relion.select.class2dauto  Succeeded 
Class2D/job083/       None relion.class2d  Succeeded 
Select/job084/       None relion.select.class2dauto  Succeeded 
Select/job085/       None relion.select.class2dauto  Succeeded 
InitialModel/job086/       None relion.initialmodel  Succeeded 
Select/job087/       None relion.select.interactive  Succeeded 
InitialModel/job088/       None relion.initialmodel  Succeeded 
Class3D/job089/       None relion.class3d  Succeeded 
Refine3D/job091/       None relion.refine3d     Failed 
Refine3D/job092/       None relion.refine3d  Succeeded 
MaskCreate/job093/       None relion.maskcreate  Succeeded 
PostProcess/job094/       None relion.postprocess  Succeeded 
Refine3D/job095/       None relion.refine3d    Aborted 
Class3D/job096/       None relion.class3d  Succeeded 
Select/job097/       None relion.select.interactive  Succeeded 
Refine3D/job098/       None relion.refine3d    Running 
 

# version 50001

data_pipeline_nodes

loop_ 
_rlnPipeLineNodeName #1 
_rlnPipeLineNodeTypeLabel #2 
_rlnPipeLineNodeTypeLabelDepth #3 
Import/job001/movies.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split1.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split2.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split3.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split4.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split5.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split6.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split7.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split8.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split9.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split10.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split11.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split12.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split13.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split14.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split15.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split16.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split17.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split18.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split19.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split20.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split21.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split22.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split23.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split24.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split25.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split26.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split27.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split28.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split29.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split30.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split31.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split32.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split33.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split34.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split35.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split36.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split37.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split38.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split39.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split40.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split41.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split42.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split43.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split44.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split45.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split46.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split47.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split48.star MicrographMovieGroupMetadata.star.relion            1 
Select/job002/micrographs_split49.star MicrographMovieGroupMetadata.star.relion            1 
MotionCorr/job005/corrected_micrographs.star MicrographGroupMetadata.star.relion.motioncorr            1 
MotionCorr/job005/logfile.pdf LogFile.pdf.relion.motioncorr            1 
MotionCorr/job006/corrected_micrographs.star MicrographGroupMetadata.star.relion.motioncorr            1 
MotionCorr/job006/logfile.pdf LogFile.pdf.relion.motioncorr            1 
CtfFind/job007/micrographs_ctf.star MicrographGroupMetadata.star.relion.ctf            1 
CtfFind/job007/logfile.pdf LogFile.pdf.relion.ctffind            1 
CtfFind/job007/micrographs_ctf_10.star MicrographGroupMetadata.star.relion            1 
ManualPick/job008/micrographs_selected.star MicrographGroupMetadata.star.relion            1 
ManualPick/job008/manualpick.star MicrographCoordsGroup.star.relion.manualpick            1 
AutoPick/job009/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job009/logfile.pdf LogFile.pdf.relion.autopick            1 
AutoPick/job010/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job010/logfile.pdf LogFile.pdf.relion.autopick            1 
Extract/job011/particles.star ParticleGroupMetadata.star.relion            1 
Extract/job012/particles.star ParticleGroupMetadata.star.relion            1 
Extract/job013/particles.star ParticleGroupMetadata.star.relion            1 
Class2D/job015/run_it200_data.star ParticleGroupMetadata.star.relion.class2d            1 
Class2D/job015/run_it200_optimiser.star OptimiserData.star.relion.class2d            1 
Class2D/job016/run_it200_data.star ParticleGroupMetadata.star.relion.class2d            1 
Class2D/job016/run_it200_optimiser.star OptimiserData.star.relion.class2d            1 
AutoPick/job018/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job018/logfile.pdf LogFile.pdf.relion.autopick            1 
Import/job019/molmap_8t4e_vox128_vox16.mrc DensityMap.mrc            1 
AutoPick/job021/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job021/logfile.pdf LogFile.pdf.relion.autopick            1 
AutoPick/job022/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job022/logfile.pdf LogFile.pdf.relion.autopick            1 
AutoPick/job023/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job023/logfile.pdf LogFile.pdf.relion.autopick            1 
Extract/job025/particles.star ParticleGroupMetadata.star.relion            1 
Class2D/job026/run_it200_data.star ParticleGroupMetadata.star.relion.class2d            1 
Class2D/job026/run_it200_optimiser.star OptimiserData.star.relion.class2d            1 
AutoPick/job027/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job027/logfile.pdf LogFile.pdf.relion.autopick            1 
Extract/job028/particles.star ParticleGroupMetadata.star.relion            1 
Class2D/job029/run_it200_data.star ParticleGroupMetadata.star.relion.class2d            1 
Class2D/job029/run_it200_optimiser.star OptimiserData.star.relion.class2d            1 
Import/job030/molmap_8t4e_box400_vox_emdb.mrc DensityMap.mrc            1 
AutoPick/job031/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job031/logfile.pdf LogFile.pdf.relion.autopick            1 
Import/job032/emd_41028.map.mrc DensityMap.mrc            1 
AutoPick/job033/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job033/logfile.pdf LogFile.pdf.relion.autopick            1 
Select/job036/particles.star ParticleGroupMetadata.star.relion            1 
Select/job036/class_averages.star Image2DGroupMetadata.star.relion.classaverages            1 
Select/job036/rank_optimiser.star OptimiserData.star.relion.select            1 
Select/job037/particles.star ParticleGroupMetadata.star.relion            1 
Select/job037/class_averages.star Image2DGroupMetadata.star.relion.classaverages            1 
Select/job037/rank_optimiser.star OptimiserData.star.relion.select            1 
Select/job038/particles.star ParticleGroupMetadata.star.relion            1 
Select/job038/class_averages.star Image2DGroupMetadata.star.relion.classaverages            1 
AutoPick/job040/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job040/logfile.pdf LogFile.pdf.relion.autopick            1 
AutoPick/job041/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job041/logfile.pdf LogFile.pdf.relion.autopick            1 
AutoPick/job042/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job042/logfile.pdf LogFile.pdf.relion.autopick            1 
AutoPick/job043/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job043/logfile.pdf LogFile.pdf.relion.autopick            1 
AutoPick/job044/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job044/logfile.pdf LogFile.pdf.relion.autopick            1 
AutoPick/job045/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job045/logfile.pdf LogFile.pdf.relion.autopick            1 
AutoPick/job046/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job046/logfile.pdf LogFile.pdf.relion.autopick            1 
AutoPick/job047/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job047/logfile.pdf LogFile.pdf.relion.autopick            1 
AutoPick/job048/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job048/logfile.pdf LogFile.pdf.relion.autopick            1 
Extract/job049/particles.star ParticleGroupMetadata.star.relion            1 
Class2D/job050/run_it200_data.star ParticleGroupMetadata.star.relion.class2d            1 
Class2D/job050/run_it200_optimiser.star OptimiserData.star.relion.class2d            1 
Select/job051/particles.star ParticleGroupMetadata.star.relion            1 
Select/job051/class_averages.star Image2DGroupMetadata.star.relion.classaverages            1 
Select/job051/rank_optimiser.star OptimiserData.star.relion.select            1 
Select/job052/particles.star ParticleGroupMetadata.star.relion            1 
Select/job052/class_averages.star Image2DGroupMetadata.star.relion.classaverages            1 
Select/job052/rank_optimiser.star OptimiserData.star.relion.select            1 
Select/job053/particles.star ParticleGroupMetadata.star.relion            1 
Select/job053/class_averages.star Image2DGroupMetadata.star.relion.classaverages            1 
Select/job053/rank_optimiser.star OptimiserData.star.relion.select            1 
Select/job055/particles.star ParticleGroupMetadata.star.relion            1 
Select/job055/class_averages.star Image2DGroupMetadata.star.relion.classaverages            1 
InitialModel/job056/initial_model.mrc DensityMap.mrc.relion.initialmodel            1 
InitialModel/job056/run_it200_class001.mrc DensityMap.mrc.relion.initialmodel            1 
InitialModel/job056/run_it200_class002.mrc DensityMap.mrc.relion.initialmodel            1 
InitialModel/job056/run_it200_class003.mrc DensityMap.mrc.relion.initialmodel            1 
InitialModel/job056/run_it200_class004.mrc DensityMap.mrc.relion.initialmodel            1 
Extract/job049/particles_20000.star ParticleGroupMetadata.star.relion            1 
Class2D/job057/run_it200_data.star ParticleGroupMetadata.star.relion.class2d            1 
Class2D/job057/run_it200_optimiser.star OptimiserData.star.relion.class2d            1 
Select/job059/particles.star ParticleGroupMetadata.star.relion            1 
Select/job059/class_averages.star Image2DGroupMetadata.star.relion.classaverages            1 
AutoPick/job060/input_training_coords.star MicrographCoordsGroup.star.relion            1 
AutoPick/job062/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job062/logfile.pdf LogFile.pdf.relion.autopick            1 
Class3D/job064/run_it025_data.star ParticleGroupMetadata.star.relion.refine3d            1 
Class3D/job064/run_it025_optimiser.star OptimiserData.star.relion.class3d            1 
Class3D/job064/run_it025_class001.mrc DensityMap.mrc.relion.class3d            1 
Class3D/job064/run_it025_class002.mrc DensityMap.mrc.relion.class3d            1 
Class3D/job064/run_it025_class003.mrc DensityMap.mrc.relion.class3d            1 
Class3D/job064/run_it025_class004.mrc DensityMap.mrc.relion.class3d            1 
AutoPick/job063/autopick.star MicrographCoordsGroup.star.relion            1 
Extract/job065/particles.star ParticleGroupMetadata.star.relion            1 
Class2D/job066/run_it200_data.star ParticleGroupMetadata.star.relion.class2d            1 
Class2D/job066/run_it200_optimiser.star OptimiserData.star.relion.class2d            1 
AutoPick/job067/autopick.star MicrographCoordsGroup.star.relion.autopick            1 
AutoPick/job067/logfile.pdf LogFile.pdf.relion.autopick            1 
Extract/job068/particles.star ParticleGroupMetadata.star.relion            1 
Class2D/job069/run_it200_data.star ParticleGroupMetadata.star.relion.class2d            1 
Class2D/job069/run_it200_optimiser.star OptimiserData.star.relion.class2d            1 
ManualPick/job070/micrographs_selected.star MicrographGroupMetadata.star.relion            1 
ManualPick/job070/manualpick.star MicrographCoordsGroup.star.relion.manualpick            1 
Select/job071/particles.star ParticleGroupMetadata.star.relion            1 
Select/job071/class_averages.star Image2DGroupMetadata.star.relion.classaverages            1 
Select/job071/rank_optimiser.star OptimiserData.star.relion.select            1 
Select/job072/particles.star ParticleGroupMetadata.star.relion            1 
Select/job072/class_averages.star Image2DGroupMetadata.star.relion.classaverages            1 
Class3D/job073/run_it050_data.star ParticleGroupMetadata.star.relion.refine3d            1 
Class3D/job073/run_it050_optimiser.star OptimiserData.star.relion.class3d            1 
Class3D/job073/run_it050_class001.mrc DensityMap.mrc.relion.class3d            1 
Class3D/job073/run_it050_class002.mrc DensityMap.mrc.relion.class3d            1 
Class3D/job073/run_it050_class003.mrc DensityMap.mrc.relion.class3d            1 
Class3D/job073/run_it050_class004.mrc DensityMap.mrc.relion.class3d            1 
Extract/job074/particles.star ParticleGroupMetadata.star.relion            1 
Extract/job075/particles.star ParticleGroupMetadata.star.relion            1 
Class2D/job076/run_it025_data.star ParticleGroupMetadata.star.relion.class2d            1 
Class2D/job076/run_it025_optimiser.star OptimiserData.star.relion.class2d            1 
Class2D/job077/run_it200_data.star ParticleGroupMetadata.star.relion.class2d            1 
Class2D/job077/run_it200_optimiser.star OptimiserData.star.relion.class2d            1 
Class2D/job078/run_it200_data.star ParticleGroupMetadata.star.relion.class2d            1 
Class2D/job078/run_it200_optimiser.star OptimiserData.star.relion.class2d            1 
Select/job079/particles.star ParticleGroupMetadata.star.relion            1 
Select/job079/class_averages.star Image2DGroupMetadata.star.relion.classaverages            1 
Class2D/job080/run_it200_data.star ParticleGroupMetadata.star.relion.class2d            1 
Class2D/job080/run_it200_optimiser.star OptimiserData.star.relion.class2d            1 
Select/job081/particles.star ParticleGroupMetadata.star.relion            1 
Select/job081/class_averages.star Image2DGroupMetadata.star.relion.classaverages            1 
Select/job081/rank_optimiser.star OptimiserData.star.relion.select            1 
Class2D/job083/run_it200_data.star ParticleGroupMetadata.star.relion.class2d            1 
Class2D/job083/run_it200_optimiser.star OptimiserData.star.relion.class2d            1 
Select/job084/particles.star ParticleGroupMetadata.star.relion            1 
Select/job084/class_averages.star Image2DGroupMetadata.star.relion.classaverages            1 
Select/job084/rank_optimiser.star OptimiserData.star.relion.select            1 
Select/job085/particles.star ParticleGroupMetadata.star.relion            1 
Select/job085/class_averages.star Image2DGroupMetadata.star.relion.classaverages            1 
Select/job085/rank_optimiser.star OptimiserData.star.relion.select            1 
InitialModel/job086/initial_model.mrc DensityMap.mrc.relion.initialmodel            1 
InitialModel/job086/run_it200_class001.mrc DensityMap.mrc.relion.initialmodel            1 
InitialModel/job086/run_it200_class002.mrc DensityMap.mrc.relion.initialmodel            1 
InitialModel/job086/run_it200_class003.mrc DensityMap.mrc.relion.initialmodel            1 
InitialModel/job086/run_it200_class004.mrc DensityMap.mrc.relion.initialmodel            1 
Select/job087/particles.star ParticleGroupMetadata.star.relion            1 
Select/job087/class_averages.star Image2DGroupMetadata.star.relion.classaverages            1 
InitialModel/job088/initial_model.mrc DensityMap.mrc.relion.initialmodel            1 
InitialModel/job088/run_it200_class001.mrc DensityMap.mrc.relion.initialmodel            1 
InitialModel/job088/run_it200_class002.mrc DensityMap.mrc.relion.initialmodel            1 
InitialModel/job088/run_it200_class003.mrc DensityMap.mrc.relion.initialmodel            1 
InitialModel/job088/run_it200_class004.mrc DensityMap.mrc.relion.initialmodel            1 
Class3D/job089/run_it050_data.star ParticleGroupMetadata.star.relion.refine3d            1 
Class3D/job089/run_it050_optimiser.star OptimiserData.star.relion.class3d            1 
Class3D/job089/run_it050_class001.mrc DensityMap.mrc.relion.class3d            1 
Class3D/job089/run_it050_class002.mrc DensityMap.mrc.relion.class3d            1 
Class3D/job089/run_it050_class003.mrc DensityMap.mrc.relion.class3d            1 
Class3D/job089/run_it050_class004.mrc DensityMap.mrc.relion.class3d            1 
Refine3D/job091/run_data.star ParticleGroupMetadata.star.relion.refine3d            1 
Refine3D/job091/run_optimiser.star OptimiserData.star.relion.refine3d            1 
Refine3D/job091/run_half1_class001_unfil.mrc DensityMap.mrc.relion.halfmap.refine3d            1 
Refine3D/job091/run_class001.mrc DensityMap.mrc.relion.refine3d            1 
Refine3D/job092/run_data.star ParticleGroupMetadata.star.relion.refine3d            1 
Refine3D/job092/run_optimiser.star OptimiserData.star.relion.refine3d            1 
Refine3D/job092/run_half1_class001_unfil.mrc DensityMap.mrc.relion.halfmap.refine3d            1 
Refine3D/job092/run_class001.mrc DensityMap.mrc.relion.refine3d            1 
MaskCreate/job093/mask.mrc Mask3D.mrc.relion            1 
PostProcess/job094/postprocess.mrc DensityMap.mrc.relion.postprocess            1 
PostProcess/job094/postprocess_masked.mrc DensityMap.mrc.relion.postprocess.masked            1 
PostProcess/job094/logfile.pdf LogFile.pdf.relion.postprocess            1 
PostProcess/job094/postprocess.star ProcessData.star.relion.postprocess            1 
Refine3D/job095/run_data.star ParticleGroupMetadata.star.relion.refine3d            1 
Refine3D/job095/run_optimiser.star OptimiserData.star.relion.refine3d            1 
Refine3D/job095/run_half1_class001_unfil.mrc DensityMap.mrc.relion.halfmap.refine3d            1 
Refine3D/job095/run_class001.mrc DensityMap.mrc.relion.refine3d            1 
Class3D/job096/run_it025_data.star ParticleGroupMetadata.star.relion.refine3d            1 
Class3D/job096/run_it025_optimiser.star OptimiserData.star.relion.class3d            1 
Class3D/job096/run_it025_class001.mrc DensityMap.mrc.relion.class3d            1 
Class3D/job096/run_it025_class002.mrc DensityMap.mrc.relion.class3d            1 
Class3D/job096/run_it025_class003.mrc DensityMap.mrc.relion.class3d            1 
Class3D/job096/run_it025_class004.mrc DensityMap.mrc.relion.class3d            1 
Select/job097/particles.star ParticleGroupMetadata.star.relion            1 
Refine3D/job098/run_data.star ParticleGroupMetadata.star.relion.refine3d            1 
Refine3D/job098/run_optimiser.star OptimiserData.star.relion.refine3d            1 
Refine3D/job098/run_half1_class001_unfil.mrc DensityMap.mrc.relion.halfmap.refine3d            1 
Refine3D/job098/run_class001.mrc DensityMap.mrc.relion.refine3d            1 
 

# version 50001

data_pipeline_input_edges

loop_ 
_rlnPipeLineEdgeFromNode #1 
_rlnPipeLineEdgeProcess #2 
Import/job001/movies.star Select/job002/ 
Select/job002/micrographs_split49.star MotionCorr/job005/ 
Import/job001/movies.star MotionCorr/job006/ 
MotionCorr/job006/corrected_micrographs.star CtfFind/job007/ 
CtfFind/job007/micrographs_ctf_10.star ManualPick/job008/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job009/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job010/ 
CtfFind/job007/micrographs_ctf_10.star Extract/job011/ 
AutoPick/job010/autopick.star Extract/job011/ 
CtfFind/job007/micrographs_ctf_10.star Extract/job012/ 
AutoPick/job010/autopick.star Extract/job012/ 
CtfFind/job007/micrographs_ctf_10.star Extract/job013/ 
AutoPick/job010/autopick.star Extract/job013/ 
Extract/job013/particles.star Class2D/job015/ 
Extract/job013/particles.star Class2D/job016/ 
CtfFind/job007/micrographs_ctf.star AutoPick/job018/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job021/ 
Import/job019/molmap_8t4e_vox128_vox16.mrc AutoPick/job021/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job022/ 
Import/job019/molmap_8t4e_vox128_vox16.mrc AutoPick/job022/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job023/ 
CtfFind/job007/micrographs_ctf_10.star Extract/job025/ 
AutoPick/job023/autopick.star Extract/job025/ 
Extract/job025/particles.star Class2D/job026/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job027/ 
CtfFind/job007/micrographs_ctf_10.star Extract/job028/ 
AutoPick/job027/autopick.star Extract/job028/ 
Extract/job028/particles.star Class2D/job029/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job031/ 
Import/job030/molmap_8t4e_box400_vox_emdb.mrc AutoPick/job031/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job033/ 
Import/job032/emd_41028.map.mrc AutoPick/job033/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job034/ 
Import/job032/emd_41028.map.mrc AutoPick/job034/ 
Class2D/job029/run_it200_optimiser.star Select/job036/ 
Class2D/job029/run_it200_optimiser.star Select/job037/ 
Class2D/job029/run_it200_optimiser.star Select/job038/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job040/ 
Select/job038/class_averages.star AutoPick/job040/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job041/ 
Select/job038/class_averages.star AutoPick/job041/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job042/ 
Select/job038/class_averages.star AutoPick/job042/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job043/ 
Select/job038/class_averages.star AutoPick/job043/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job044/ 
Select/job038/class_averages.star AutoPick/job044/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job045/ 
Select/job038/class_averages.star AutoPick/job045/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job046/ 
Select/job038/class_averages.star AutoPick/job046/ 
CtfFind/job007/micrographs_ctf_10.star AutoPick/job047/ 
Select/job038/class_averages.star AutoPick/job047/ 
CtfFind/job007/micrographs_ctf.star AutoPick/job048/ 
CtfFind/job007/micrographs_ctf.star Extract/job049/ 
AutoPick/job048/autopick.star Extract/job049/ 
Extract/job049/particles.star Class2D/job050/ 
Class2D/job050/run_it200_optimiser.star Select/job051/ 
Class2D/job050/run_it200_optimiser.star Select/job052/ 
Class2D/job050/run_it200_optimiser.star Select/job053/ 
Class2D/job050/run_it200_optimiser.star Select/job055/ 
Select/job055/particles.star InitialModel/job056/ 
Extract/job049/particles_20000.star Class2D/job057/ 
Class2D/job057/run_it200_optimiser.star Select/job059/ 
CtfFind/job007/micrographs_ctf.star AutoPick/job060/ 
CtfFind/job007/micrographs_ctf.star AutoPick/job061/ 
CtfFind/job007/micrographs_ctf.star AutoPick/job062/ 
CtfFind/job007/micrographs_ctf.star AutoPick/job063/ 
Select/job055/particles.star Class3D/job064/ 
InitialModel/job056/run_it200_class002.mrc Class3D/job064/ 
CtfFind/job007/micrographs_ctf.star Extract/job065/ 
AutoPick/job063/autopick.star Extract/job065/ 
Extract/job065/particles.star Class2D/job066/ 
CtfFind/job007/micrographs_ctf.star AutoPick/job067/ 
CtfFind/job007/micrographs_ctf.star Extract/job068/ 
AutoPick/job067/autopick.star Extract/job068/ 
Extract/job068/particles.star Class2D/job069/ 
CtfFind/job007/micrographs_ctf_10.star ManualPick/job070/ 
Class2D/job069/run_it200_optimiser.star Select/job071/ 
Class2D/job069/run_it200_optimiser.star Select/job072/ 
Select/job072/particles.star Class3D/job073/ 
InitialModel/job056/run_it200_class002.mrc Class3D/job073/ 
CtfFind/job007/micrographs_ctf.star Extract/job074/ 
AutoPick/job067/autopick.star Extract/job074/ 
CtfFind/job007/micrographs_ctf.star Extract/job075/ 
AutoPick/job067/autopick.star Extract/job075/ 
Extract/job075/particles.star Class2D/job076/ 
Extract/job074/particles.star Class2D/job077/ 
Extract/job074/particles.star Class2D/job078/ 
Class2D/job078/run_it200_optimiser.star Select/job079/ 
Select/job079/particles.star Class2D/job080/ 
Class2D/job080/run_it200_optimiser.star Select/job081/ 
Select/job081/particles.star Class2D/job083/ 
Class2D/job083/run_it200_optimiser.star Select/job084/ 
Class2D/job083/run_it200_optimiser.star Select/job085/ 
Select/job084/particles.star InitialModel/job086/ 
Class2D/job083/run_it200_optimiser.star Select/job087/ 
Select/job087/particles.star InitialModel/job088/ 
Class2D/job083/run_it200_data.star Class3D/job089/ 
InitialModel/job088/initial_model.mrc Class3D/job089/ 
Class2D/job083/run_it200_data.star Refine3D/job091/ 
Class3D/job089/run_it050_class003.mrc Refine3D/job091/ 
Class2D/job083/run_it200_data.star Refine3D/job092/ 
Class3D/job089/run_it050_class003.mrc Refine3D/job092/ 
Refine3D/job092/run_class001.mrc MaskCreate/job093/ 
MaskCreate/job093/mask.mrc PostProcess/job094/ 
Refine3D/job092/run_half1_class001_unfil.mrc PostProcess/job094/ 
Class2D/job083/run_it200_data.star Refine3D/job095/ 
Class3D/job089/run_it050_class003.mrc Refine3D/job095/ 
MaskCreate/job093/mask.mrc Refine3D/job095/ 
Select/job085/particles.star Class3D/job096/ 
InitialModel/job088/initial_model.mrc Class3D/job096/ 
MaskCreate/job093/mask.mrc Class3D/job096/ 
Class3D/job096/run_it025_optimiser.star Select/job097/ 
Select/job097/particles.star Refine3D/job098/ 
Class3D/job096/run_it025_class002.mrc Refine3D/job098/ 
 

# version 50001

data_pipeline_output_edges

loop_ 
_rlnPipeLineEdgeProcess #1 
_rlnPipeLineEdgeToNode #2 
Import/job001/ Import/job001/movies.star 
Select/job002/ Select/job002/micrographs_split1.star 
Select/job002/ Select/job002/micrographs_split2.star 
Select/job002/ Select/job002/micrographs_split3.star 
Select/job002/ Select/job002/micrographs_split4.star 
Select/job002/ Select/job002/micrographs_split5.star 
Select/job002/ Select/job002/micrographs_split6.star 
Select/job002/ Select/job002/micrographs_split7.star 
Select/job002/ Select/job002/micrographs_split8.star 
Select/job002/ Select/job002/micrographs_split9.star 
Select/job002/ Select/job002/micrographs_split10.star 
Select/job002/ Select/job002/micrographs_split11.star 
Select/job002/ Select/job002/micrographs_split12.star 
Select/job002/ Select/job002/micrographs_split13.star 
Select/job002/ Select/job002/micrographs_split14.star 
Select/job002/ Select/job002/micrographs_split15.star 
Select/job002/ Select/job002/micrographs_split16.star 
Select/job002/ Select/job002/micrographs_split17.star 
Select/job002/ Select/job002/micrographs_split18.star 
Select/job002/ Select/job002/micrographs_split19.star 
Select/job002/ Select/job002/micrographs_split20.star 
Select/job002/ Select/job002/micrographs_split21.star 
Select/job002/ Select/job002/micrographs_split22.star 
Select/job002/ Select/job002/micrographs_split23.star 
Select/job002/ Select/job002/micrographs_split24.star 
Select/job002/ Select/job002/micrographs_split25.star 
Select/job002/ Select/job002/micrographs_split26.star 
Select/job002/ Select/job002/micrographs_split27.star 
Select/job002/ Select/job002/micrographs_split28.star 
Select/job002/ Select/job002/micrographs_split29.star 
Select/job002/ Select/job002/micrographs_split30.star 
Select/job002/ Select/job002/micrographs_split31.star 
Select/job002/ Select/job002/micrographs_split32.star 
Select/job002/ Select/job002/micrographs_split33.star 
Select/job002/ Select/job002/micrographs_split34.star 
Select/job002/ Select/job002/micrographs_split35.star 
Select/job002/ Select/job002/micrographs_split36.star 
Select/job002/ Select/job002/micrographs_split37.star 
Select/job002/ Select/job002/micrographs_split38.star 
Select/job002/ Select/job002/micrographs_split39.star 
Select/job002/ Select/job002/micrographs_split40.star 
Select/job002/ Select/job002/micrographs_split41.star 
Select/job002/ Select/job002/micrographs_split42.star 
Select/job002/ Select/job002/micrographs_split43.star 
Select/job002/ Select/job002/micrographs_split44.star 
Select/job002/ Select/job002/micrographs_split45.star 
Select/job002/ Select/job002/micrographs_split46.star 
Select/job002/ Select/job002/micrographs_split47.star 
Select/job002/ Select/job002/micrographs_split48.star 
Select/job002/ Select/job002/micrographs_split49.star 
MotionCorr/job005/ MotionCorr/job005/corrected_micrographs.star 
MotionCorr/job005/ MotionCorr/job005/logfile.pdf 
MotionCorr/job006/ MotionCorr/job006/corrected_micrographs.star 
MotionCorr/job006/ MotionCorr/job006/logfile.pdf 
CtfFind/job007/ CtfFind/job007/micrographs_ctf.star 
CtfFind/job007/ CtfFind/job007/logfile.pdf 
CtfFind/job007/ CtfFind/job007/micrographs_ctf_10.star 
ManualPick/job008/ ManualPick/job008/micrographs_selected.star 
ManualPick/job008/ ManualPick/job008/manualpick.star 
AutoPick/job009/ AutoPick/job009/autopick.star 
AutoPick/job009/ AutoPick/job009/logfile.pdf 
AutoPick/job010/ AutoPick/job010/autopick.star 
AutoPick/job010/ AutoPick/job010/logfile.pdf 
Extract/job011/ Extract/job011/particles.star 
Extract/job012/ Extract/job012/particles.star 
Extract/job013/ Extract/job013/particles.star 
Class2D/job015/ Class2D/job015/run_it200_data.star 
Class2D/job015/ Class2D/job015/run_it200_optimiser.star 
Class2D/job016/ Class2D/job016/run_it200_data.star 
Class2D/job016/ Class2D/job016/run_it200_optimiser.star 
AutoPick/job018/ AutoPick/job018/autopick.star 
AutoPick/job018/ AutoPick/job018/logfile.pdf 
Import/job019/ Import/job019/molmap_8t4e_vox128_vox16.mrc 
AutoPick/job021/ AutoPick/job021/autopick.star 
AutoPick/job021/ AutoPick/job021/logfile.pdf 
AutoPick/job022/ AutoPick/job022/autopick.star 
AutoPick/job022/ AutoPick/job022/logfile.pdf 
AutoPick/job023/ AutoPick/job023/autopick.star 
AutoPick/job023/ AutoPick/job023/logfile.pdf 
Extract/job025/ Extract/job025/particles.star 
Class2D/job026/ Class2D/job026/run_it200_data.star 
Class2D/job026/ Class2D/job026/run_it200_optimiser.star 
AutoPick/job027/ AutoPick/job027/autopick.star 
AutoPick/job027/ AutoPick/job027/logfile.pdf 
Extract/job028/ Extract/job028/particles.star 
Class2D/job029/ Class2D/job029/run_it200_data.star 
Class2D/job029/ Class2D/job029/run_it200_optimiser.star 
Import/job030/ Import/job030/molmap_8t4e_box400_vox_emdb.mrc 
AutoPick/job031/ AutoPick/job031/autopick.star 
AutoPick/job031/ AutoPick/job031/logfile.pdf 
Import/job032/ Import/job032/emd_41028.map.mrc 
AutoPick/job033/ AutoPick/job033/autopick.star 
AutoPick/job033/ AutoPick/job033/logfile.pdf 
Select/job036/ Select/job036/particles.star 
Select/job036/ Select/job036/class_averages.star 
Select/job036/ Select/job036/rank_optimiser.star 
Select/job037/ Select/job037/particles.star 
Select/job037/ Select/job037/class_averages.star 
Select/job037/ Select/job037/rank_optimiser.star 
Select/job038/ Select/job038/particles.star 
Select/job038/ Select/job038/class_averages.star 
AutoPick/job040/ AutoPick/job040/autopick.star 
AutoPick/job040/ AutoPick/job040/logfile.pdf 
AutoPick/job041/ AutoPick/job041/autopick.star 
AutoPick/job041/ AutoPick/job041/logfile.pdf 
AutoPick/job042/ AutoPick/job042/autopick.star 
AutoPick/job042/ AutoPick/job042/logfile.pdf 
AutoPick/job043/ AutoPick/job043/autopick.star 
AutoPick/job043/ AutoPick/job043/logfile.pdf 
AutoPick/job044/ AutoPick/job044/autopick.star 
AutoPick/job044/ AutoPick/job044/logfile.pdf 
AutoPick/job045/ AutoPick/job045/autopick.star 
AutoPick/job045/ AutoPick/job045/logfile.pdf 
AutoPick/job046/ AutoPick/job046/autopick.star 
AutoPick/job046/ AutoPick/job046/logfile.pdf 
AutoPick/job047/ AutoPick/job047/autopick.star 
AutoPick/job047/ AutoPick/job047/logfile.pdf 
AutoPick/job048/ AutoPick/job048/autopick.star 
AutoPick/job048/ AutoPick/job048/logfile.pdf 
Extract/job049/ Extract/job049/particles.star 
Extract/job049/ Extract/job049/particles_20000.star 
Class2D/job050/ Class2D/job050/run_it200_data.star 
Class2D/job050/ Class2D/job050/run_it200_optimiser.star 
Select/job051/ Select/job051/particles.star 
Select/job051/ Select/job051/class_averages.star 
Select/job051/ Select/job051/rank_optimiser.star 
Select/job052/ Select/job052/particles.star 
Select/job052/ Select/job052/class_averages.star 
Select/job052/ Select/job052/rank_optimiser.star 
Select/job053/ Select/job053/particles.star 
Select/job053/ Select/job053/class_averages.star 
Select/job053/ Select/job053/rank_optimiser.star 
Select/job055/ Select/job055/particles.star 
Select/job055/ Select/job055/class_averages.star 
InitialModel/job056/ InitialModel/job056/initial_model.mrc 
InitialModel/job056/ InitialModel/job056/run_it200_class001.mrc 
InitialModel/job056/ InitialModel/job056/run_it200_class002.mrc 
InitialModel/job056/ InitialModel/job056/run_it200_class003.mrc 
InitialModel/job056/ InitialModel/job056/run_it200_class004.mrc 
Class2D/job057/ Class2D/job057/run_it200_data.star 
Class2D/job057/ Class2D/job057/run_it200_optimiser.star 
Select/job059/ Select/job059/particles.star 
Select/job059/ Select/job059/class_averages.star 
AutoPick/job060/ AutoPick/job060/input_training_coords.star 
AutoPick/job062/ AutoPick/job062/autopick.star 
AutoPick/job062/ AutoPick/job062/logfile.pdf 
AutoPick/job063/ AutoPick/job063/autopick.star 
Class3D/job064/ Class3D/job064/run_it025_data.star 
Class3D/job064/ Class3D/job064/run_it025_optimiser.star 
Class3D/job064/ Class3D/job064/run_it025_class001.mrc 
Class3D/job064/ Class3D/job064/run_it025_class002.mrc 
Class3D/job064/ Class3D/job064/run_it025_class003.mrc 
Class3D/job064/ Class3D/job064/run_it025_class004.mrc 
Extract/job065/ Extract/job065/particles.star 
Class2D/job066/ Class2D/job066/run_it200_data.star 
Class2D/job066/ Class2D/job066/run_it200_optimiser.star 
AutoPick/job067/ AutoPick/job067/autopick.star 
AutoPick/job067/ AutoPick/job067/logfile.pdf 
Extract/job068/ Extract/job068/particles.star 
Class2D/job069/ Class2D/job069/run_it200_data.star 
Class2D/job069/ Class2D/job069/run_it200_optimiser.star 
ManualPick/job070/ ManualPick/job070/micrographs_selected.star 
ManualPick/job070/ ManualPick/job070/manualpick.star 
Select/job071/ Select/job071/particles.star 
Select/job071/ Select/job071/class_averages.star 
Select/job071/ Select/job071/rank_optimiser.star 
Select/job072/ Select/job072/particles.star 
Select/job072/ Select/job072/class_averages.star 
Class3D/job073/ Class3D/job073/run_it050_data.star 
Class3D/job073/ Class3D/job073/run_it050_optimiser.star 
Class3D/job073/ Class3D/job073/run_it050_class001.mrc 
Class3D/job073/ Class3D/job073/run_it050_class002.mrc 
Class3D/job073/ Class3D/job073/run_it050_class003.mrc 
Class3D/job073/ Class3D/job073/run_it050_class004.mrc 
Extract/job074/ Extract/job074/particles.star 
Extract/job075/ Extract/job075/particles.star 
Class2D/job076/ Class2D/job076/run_it025_data.star 
Class2D/job076/ Class2D/job076/run_it025_optimiser.star 
Class2D/job077/ Class2D/job077/run_it200_data.star 
Class2D/job077/ Class2D/job077/run_it200_optimiser.star 
Class2D/job078/ Class2D/job078/run_it200_data.star 
Class2D/job078/ Class2D/job078/run_it200_optimiser.star 
Select/job079/ Select/job079/particles.star 
Select/job079/ Select/job079/class_averages.star 
Class2D/job080/ Class2D/job080/run_it200_data.star 
Class2D/job080/ Class2D/job080/run_it200_optimiser.star 
Select/job081/ Select/job081/particles.star 
Select/job081/ Select/job081/class_averages.star 
Select/job081/ Select/job081/rank_optimiser.star 
Class2D/job083/ Class2D/job083/run_it200_data.star 
Class2D/job083/ Class2D/job083/run_it200_optimiser.star 
Select/job084/ Select/job084/particles.star 
Select/job084/ Select/job084/class_averages.star 
Select/job084/ Select/job084/rank_optimiser.star 
Select/job085/ Select/job085/particles.star 
Select/job085/ Select/job085/class_averages.star 
Select/job085/ Select/job085/rank_optimiser.star 
InitialModel/job086/ InitialModel/job086/initial_model.mrc 
InitialModel/job086/ InitialModel/job086/run_it200_class001.mrc 
InitialModel/job086/ InitialModel/job086/run_it200_class002.mrc 
InitialModel/job086/ InitialModel/job086/run_it200_class003.mrc 
InitialModel/job086/ InitialModel/job086/run_it200_class004.mrc 
Select/job087/ Select/job087/particles.star 
Select/job087/ Select/job087/class_averages.star 
InitialModel/job088/ InitialModel/job088/initial_model.mrc 
InitialModel/job088/ InitialModel/job088/run_it200_class001.mrc 
InitialModel/job088/ InitialModel/job088/run_it200_class002.mrc 
InitialModel/job088/ InitialModel/job088/run_it200_class003.mrc 
InitialModel/job088/ InitialModel/job088/run_it200_class004.mrc 
Class3D/job089/ Class3D/job089/run_it050_data.star 
Class3D/job089/ Class3D/job089/run_it050_optimiser.star 
Class3D/job089/ Class3D/job089/run_it050_class001.mrc 
Class3D/job089/ Class3D/job089/run_it050_class002.mrc 
Class3D/job089/ Class3D/job089/run_it050_class003.mrc 
Class3D/job089/ Class3D/job089/run_it050_class004.mrc 
Refine3D/job091/ Refine3D/job091/run_data.star 
Refine3D/job091/ Refine3D/job091/run_optimiser.star 
Refine3D/job091/ Refine3D/job091/run_half1_class001_unfil.mrc 
Refine3D/job091/ Refine3D/job091/run_class001.mrc 
Refine3D/job092/ Refine3D/job092/run_data.star 
Refine3D/job092/ Refine3D/job092/run_optimiser.star 
Refine3D/job092/ Refine3D/job092/run_half1_class001_unfil.mrc 
Refine3D/job092/ Refine3D/job092/run_class001.mrc 
MaskCreate/job093/ MaskCreate/job093/mask.mrc 
PostProcess/job094/ PostProcess/job094/postprocess.mrc 
PostProcess/job094/ PostProcess/job094/postprocess_masked.mrc 
PostProcess/job094/ PostProcess/job094/logfile.pdf 
PostProcess/job094/ PostProcess/job094/postprocess.star 
Refine3D/job095/ Refine3D/job095/run_data.star 
Refine3D/job095/ Refine3D/job095/run_optimiser.star 
Refine3D/job095/ Refine3D/job095/run_half1_class001_unfil.mrc 
Refine3D/job095/ Refine3D/job095/run_class001.mrc 
Class3D/job096/ Class3D/job096/run_it025_data.star 
Class3D/job096/ Class3D/job096/run_it025_optimiser.star 
Class3D/job096/ Class3D/job096/run_it025_class001.mrc 
Class3D/job096/ Class3D/job096/run_it025_class002.mrc 
Class3D/job096/ Class3D/job096/run_it025_class003.mrc 
Class3D/job096/ Class3D/job096/run_it025_class004.mrc 
Select/job097/ Select/job097/particles.star 
Refine3D/job098/ Refine3D/job098/run_data.star 
Refine3D/job098/ Refine3D/job098/run_optimiser.star 
Refine3D/job098/ Refine3D/job098/run_half1_class001_unfil.mrc 
Refine3D/job098/ Refine3D/job098/run_class001.mrc 
 
