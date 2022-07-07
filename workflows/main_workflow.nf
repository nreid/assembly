include { assembly_shasta;  } from './subworkflows/assembly_shasta.nf'
include { repeatmask;       } from './subworkflows/repeatmask.nf'
include { read_qc;          } from './subworkflows/read_qc.nf'
include { purge;            } from './subworkflows/purge.nf'

workflow main_workflow {

    read_qc             ( params.fastq, params.centrifugedb )
    assembly            ( params.fasta, params.medaka_model, params.augustus_config, params.busco_db ) 
    repeatmask          ( assembly.out )
    purge               ( params.fastq, assembly.out, params.purge, params.lowerbound, params.cutoff, params.upperbound )
    // kat_sect()

}
