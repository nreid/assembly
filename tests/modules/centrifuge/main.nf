include { centrifuge; } from '../../../modules/nanoplot/nanoplot.nf'

workflow CENTRIFUGE {

    centrifuge( params.fundulusONT, params.centrifugedb )

}