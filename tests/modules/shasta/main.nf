include { shasta; } from '../../../modules/shasta/shasta.nf'
include { fastq2fasta; } from '../../../modules/shasta/fastq2fasta.nf'

workflow FASTQ2FASTA_FUNDULUS {

    fastq2fasta( params.fundulusONT )

}

workflow SHASTA_PRESET_FUNDULUS {

    shasta( params.fundulusONT_fasta, params.shasta_config_preset, params.shasta_config_file, params.shasta_opts )

}

workflow SHASTA_CONFIGFILE_FUNDULUS {

    shasta( params.fundulusONT_fasta, params.shasta_config_preset, params.shasta_config_file, params.shasta_opts )

}