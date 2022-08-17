include { centrifuge; } from '../../../modules/nanoplot/nanoplot.nf'

workflow CENTRIFUGE_FUNDULUS {

    centrifuge( params.fundulusONT, params.centrifugedb )

}