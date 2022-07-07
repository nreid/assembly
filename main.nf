/* 
 * Genome assembly pipeline
 * Authors: 
    Noah Reid


 */ 

// currently requires reads in fasta and fastq because shasta requires (does it still?) fasta input. 
    // should add a step to assembly pipeline to generate fasta from fastq instead of requiring both. 


include { main_workflow } from './workflows/main_workflow.nf'

workflow {

    main_workflow()

    }