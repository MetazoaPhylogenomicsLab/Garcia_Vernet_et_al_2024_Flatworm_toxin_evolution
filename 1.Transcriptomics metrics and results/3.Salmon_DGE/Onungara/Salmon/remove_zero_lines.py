import pandas as pd

matrix_file=input("Give the matrix file you want to remove genes with zeros across all replicates:")
matrix_new=input("Now give the location and the new filename to store without zero lines:")
#with open("/home/klara/phD_data/DGE/LepN/no_transdecoder/D24_VS_Controls.gene.TMM.EXPR.matrix", "r+") as f:
with open(matrix_file, "r+") as f:
    df = pd.read_csv(f, sep='\t', lineterminator='\n', index_col=0)


#print(df)
#print((df == 0).astype(int).sum(axis=1))
#print(len(df))

df_no0 = df.loc[~(df==0).all(axis=1)]
#print(df_no0)
#df_withoutOutliers = df_no0.drop(['SMED215L2', 'SMED215L3', 'SMED224D1', 'SMED224D2'], axis=1)

matrix_no0 = df_no0.to_csv(matrix_new, sep='\t')

