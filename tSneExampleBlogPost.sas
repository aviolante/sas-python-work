###########################################################
#####                    SAS Proc                     #####
###########################################################

# Run t-SNE Action on Digits using SAS Proc
proc tsne data=mycaslib.digits_df
               ndims=2
               maxiter=1000
               perplexity=100
               learnrate=1000
               seed=12345;
   input var2-var65;
   id id;
   output out=mycaslib.digits_tsne_out copyvars=(var2 id);
run;

# Run t-SNE Action on MNIST using SAS Proc
proc tsne data=mycaslib.mnist_df
               ndims=2
               maxiter=1000
               perplexity=100
               learnrate=1000
               seed=12345;
   input var2-var785;
   id id;
   output out=mycaslib.mnist_tsne_out copyvars=(var2 id);
run;

###########################################################
#####               SAS CASL Language                 #####
###########################################################

# Run t-SNE Action on Digits using CASL
conn.tSne(output = {"casOut":{"name":"digits_tsne_out", "replace":True},
                            "copyVars":{"id", "var2"}},
           inputs = inputList,
           nDimensions = 2,
           perplexity = 100,
           learningRate = 1000,
           maxIters  = 1000,
           table = {"name":"digits_df"})

# Run t-SNE Action on MNIST using CASL
conn.tSne(output = {"casOut":{"name":"mnist_tsne_out", "replace":True},
                            "copyVars":{"id", "var2"}},
           inputs = inputList,
           nDimensions = 2,
           perplexity = 100,
           learningRate = 1000,
           maxIters  = 1000,
           table = {"name":"mnist_df"})
           
       
