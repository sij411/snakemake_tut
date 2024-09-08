# basic rule. snakemake will find other rules that will gen this input.
rule all: 
    input: "temp/wc_all.png"


rule count:
    input: 
        "data/{filename}.txt"
    output:
        "temp/wc_{filename}.txt"
    shell:
        "wc -w {input} > {output}"

rule concat:
    input:
        expand("temp/wc_{filename}.txt", filename=['A', 'B', 'C']) 
    output: 
        "temp/wc_all.csv"
    script:
        "concat.py"

rule plot:
    input: 
        "temp/wc_all.csv"
    output:
        "temp/wc_all.png"
    script:
        "plot.py"
    