params.outdir = 'results'

process MULTIQC {
    container 'quay.io/nextflow/rnaseq-nf:v1.3.0'
    publishDir params.outdir, mode:'copy'
    memory '4 GB'
    cpus 2
    
    input:
    path('*') 
    path(config) 

    output:
    path('multiqc_report.html')

    script:
    """
    echo "Running multi qc"
    cp $config/* .
    echo "custom_logo: \$PWD/logo.png" >> multiqc_config.yaml
    multiqc . || ls -lr && sleep 60
    """
}
