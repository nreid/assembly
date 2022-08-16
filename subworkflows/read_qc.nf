include { centrifuge;       } from '../modules/tasks_read_qc.nf'
include { nanoplot;         } from '../modules/tasks_read_qc.nf'

// add a filtering step based on classification results? 
// don't really trust centrifuge for this. 

// options for centrifuge databases???

workflow read_qc {
    take:
        fastq
        centrifugedb

    main:
        if( centrifugedb ){
             centrifuge( fastq, centrifugedb )
        }
        nanoplot( fastq )

}
