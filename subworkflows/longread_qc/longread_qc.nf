include { centrifuge;        } from '../../modules/centrifuge/centrifuge.nf'
include { centrifuge_filter; } from '../../modules/centrifuge/centrifuge_filter.nf'
include { nanoplot;          } from '../../modules/nanoplot/nanoplot.nf'

// options for centrifuge databases???

workflow longread_qc {
    take:
        fastq
        centrifugedb

    main:
        // if a centrifuge database is provided, run centrifuge and filter out all classified results
        if( centrifugedb ){
             centrifuge        ( fastq, centrifugedb )
             centrifuge_filter ( fastq, centrifuge.out.sequencelist )
            // ideally we would kill pipeline execution here if percent retained is too low. 
                // not sure how to do that. 
             centrifuge.out.percentretained.view()
        }
        nanoplot( fastq )

    // if a centrifuge database was provided, filtered fastq file, otherwise, original fastq file
    fastq_out = { centrifugedb ? centrifuge_filter.out.fastq : fastq }

    emit: 
        fastq_out
}
