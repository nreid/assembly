# test nanoplot
nextflow run \
    ../nf_assembly/tests/modules/nanoplot/main.nf \
    -entry NANO_FUNDULUS \
    -c ../nf_assembly/tests/nextflow.config \
    --outdir 'testresults/nanoplot_fundulus'

# test centrifuge
nextflow run \
    ../nf_assembly/tests/modules/centrifuge/main.nf \
    -entry CENTRIFUGE_FUNDULUS \
    -c ../nf_assembly/tests/nextflow.config \
    --outdir 'testresults/centrifuge_fundulus'

# test centrifuge_filter
nextflow run \
    ../nf_assembly/tests/modules/centrifuge/main.nf \
    -entry CENTRIFUGE_FILTER_FUNDULUS \
    -c ../nf_assembly/tests/nextflow.config \
    --outdir 'testresults/centrifuge_filter_fundulus'

# test fastq2fasta
nextflow run \
    ../nf_assembly/tests/modules/shasta/main.nf \
    -entry FASTQ2FASTA_FUNDULUS \
    -c ../nf_assembly/tests/nextflow.config \
    --outdir 'testresults/fastq2fasta_fundulus'
    
# test shasta with preset config
nextflow run \
    ../nf_assembly/tests/modules/shasta/main.nf \
    -entry SHASTA_PRESET_FUNDULUS \
    -c ../nf_assembly/tests/nextflow.config \
    --outdir 'testresults/shasta_preset_fundulus' \
    --shasta_config_file "/path/to/nonexist/file.txt" # overwrites shasta config test file

# test shasta with config text file
nextflow run \
    ../nf_assembly/tests/modules/shasta/main.nf \
    -entry SHASTA_CONFIGFILE_FUNDULUS \
    -c ../nf_assembly/tests/nextflow.config \
    --outdir 'testresults/shasta_configfile_fundulus' \
    --shasta_preset false # sets shasta preset config to "false". should cause shasta module to use config file

