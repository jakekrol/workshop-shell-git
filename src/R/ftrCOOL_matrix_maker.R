install.packages("ftrCOOL")
install.packages("here")
library('ftrCOOL')
library('here')
here()
output_path <- here("../../data/")
input_fasta <- here(
  paste("../../data/ncbi_dataset/",
  "data/protein.faa",
  sep="")
)
input_fasta

# **Functions Below**

# make a kAA feature matrix; size (n_seqs, 20^k)
feature_kAA_csv <- function(fasta_path, k,  name, directory) {
  df_kAA <- kAAComposition(fasta_path, rng=k)
  out_file = paste(directory, name, sep="")
  write.csv(df_kAA, file = out_file)
  print(df_kAA)
  return(df_kAA)
}
# **Functions Above**

### Making kmer datasets where k range[2, 20]
write_kmers <- function(kmin, kmax, fasta_path, directory)
{
 for (k in seq(kmin, kmax)) {
   filename = paste(as.character(k), "mer-comp.csv", sep="")
   # call feature_kAA_csv() for each int in the range k
    # saves as [k]mer-comp.csv
   feature_kAA_csv(
     fasta_path=fasta_path,
     k=k,
     name = filename,
     directory=directory
                    )
 } 
}

write_kmers(
  kmin=2,
  kmax=3,
  fasta_path = input_fasta,
  directory = output_path
  )