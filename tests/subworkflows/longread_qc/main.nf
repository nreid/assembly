include { longread_qc; } from '../../../subworkflows/longread_qc/longread_qc.nf'

workflow LONGREAD_QC_FUNDULUS {

    longread_qc( params.fundulusONT, params.centrifugedb )

}
