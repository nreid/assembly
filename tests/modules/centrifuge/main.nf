include { centrifuge;        } from '../../../modules/centrifuge/centrifuge.nf'
include { centrifuge_filter; } from '../../../modules/centrifuge/centrifuge_filter.nf'

workflow CENTRIFUGE_FUNDULUS {

    centrifuge( params.fundulusONT, params.centrifugedb )

    centrifuge.out.percentretained.view{ p -> "$p% of reads were retained after contamination filtering" }

}

workflow CENTRIFUGE_FILTER_FUNDULUS {

    centrifuge_filter(params.fundulusONT, params.fundulusONT_keepseqs)    

}