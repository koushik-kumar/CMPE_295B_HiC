FOR /L %%A IN (3300,100,6400) DO (
  ECHO %%A
  python scripts\hicplus pred_chromosome -i gm12878_in_situ_paternal.hic -m model\2020-11-11\model%%A.model -c 18 18
)