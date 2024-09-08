import pandas as pd


df = pd.read_csv(snakemake.input[0], index_col='fname')
plot = df.plot(kind='bar', rot=45)
fig = plot.get_figure()
fig.tight_layout()
fig.savefig(snakemake.output[0])
