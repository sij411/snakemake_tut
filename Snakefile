rule count:
    input: 
        "data/{filename}.txt"
    output:
        "temp/wc_{filename}.txt"
    shell:
        "wc -w {input} > {output}"

rule concat:
    input:
        "temp/wc_A.txt",
        "temp/wc_B.txt",
        "temp/wc_C.txt"
    output: 
        "temp/wc_all.csv"
    script:
        "concat.py"