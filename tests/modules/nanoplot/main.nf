// include 
include { nanoplot; } from '../../../modules/nanoplot/nanoplot.nf'

workflow NANO_FUNDULUS {

    nanoplot( params.fundulusONT )

}