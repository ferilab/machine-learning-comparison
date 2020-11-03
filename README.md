# machine-learning-comparison
A comparison of 23 popular machine learning techniques, and evaluation of their ensemble performance.

Dataset mnist_27 from dslab is used to compare the performance of the mathods.
The dataset includes a train and a test set of handwritten 2s and 7s.

1. setup.R loads the libs and dataset, and defines the list of benchmarked machine learning techniques. 
2. train.R trains all the 23 techniques with mnist_27 train set using their default parameters.
3. evaluate.R compares the perfoemance of the techniques and finally employes a ensemble classification on the test data to see if it overperforms all the single techniques.
4. plots are saved in fig subdirectory
5. data, the trained model, and list of techniques are saved in rdas subdirectory