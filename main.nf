/* 
 * Genome assembly pipeline
 * Authors: 
    Noah Reid


 */ 

 
include { assembly;       } from './workflows/assembly.nf'
include { repeatmask;     } from './workflows/repeatmask.nf'
include { read_qc;        } from './subworkflows/read_qc.nf'

// currently requires reads in fasta and fastq because shasta requires (does it still?) fasta input. 
    // should add a step to assembly pipeline to generate fasta from fastq instead of requiring both. 

workflow {

    read_qc    ( params.fastq, params.centrifugedb )
    assembly   ( params.fasta, params.medaka_model, params.augustus_config, params.busco_db ) 
    repeatmask ( assembly.out )
    // kat_sect()
    // purge()

}

