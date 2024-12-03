params.outdir = 'results'

process FASTQC {
    tag "FASTQC on $sample_id"
    publishDir params.outdir, mode:'copy'
    memory '4 GB'
    cpus 2
    
    input:
    path reads1
    path reads2
    val sample_id 

    output:
    path "fastqc_${sample_id}_logs" 

    script:
    """
    echo "Running fastqc"
    bash /usr/bin/fastqc.sh "$sample_id" "$reads1 $reads2"
    echo "Command done"
    ls -Rl && sleep 60
    """
}
