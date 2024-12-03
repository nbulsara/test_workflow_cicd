
process INDEX {
    tag "$transcriptome.simpleName"
    memory '4 GB'
    cpus 2
    
    input:
    path transcriptome 

    output:
    path 'index' 

    script:
    """
    echo "Running salmon index"
    salmon index --threads $task.cpus -t $transcriptome -i index
    echo "Command done"
    ls -lR && sleep 60
    """
}
