# Introduction
This is the source code of our ICASSP 2012 paper "Cross-Modality Correlation Propagation for Cross-Media Retrieval", Please cite the following paper if you use our code.

Xiaohua Zhai, Yuxin Peng, and Jianguo Xiao, "Cross-Modality Correlation Propagation for Cross-Media Retrieval", 37th International Conference on Acoustics, Speech, and Signal Processing (ICASSP), pp. 2337-2340, Kyoto, Japan, Mar. 25-30, 2012. [[PDF]](http://59.108.48.34/mipl/tiki-download_file.php?fileId=286)

# Usage
Run our script to train and test:
 
    CMCP.m

The parameters are as follows:

    I_tr: the feature matrix of image instances for training, dimension : tr_n * d_i
    T_tr: the feature matrix of text instances for training, dimension : tr_n * d_t
    I_te: the feature matrix of image instances for test, dimension : te_n * d_i
    T_te: the feature matrix of text instances for test, dimension : te_n * d_t
    trainCat: the category list of data for training, dimension : tr_n * 1
    testCat: the category list of data for test, dimension : te_n * 1
    alpha: parameter, default: 0.6
    beta: parameter, default: 1
    k: kNN parameter, default: 30

XMedia dataset can be downloaded from [XMedia Dataset](http://59.108.48.34/mipl/xmedia)

For more information, please refer to our [paper](http://59.108.48.34/mipl/tiki-download_file.php?fileId=286)

# Our Related Work
If you are interested in cross-media retrieval, you can check our recently published overview paper on IEEE TCSVT:

Yuxin Peng, Xin Huang, and Yunzhen Zhao, "An Overview of Cross-media Retrieval: Concepts, Methodologies, Benchmarks and Challenges", IEEE Transactions on Circuits and Systems for Video Technology (TCSVT), 2017.[[PDF]](http://59.108.48.34/mipl/tiki-download_file.php?fileId=376)

Welcome to our [Benchmark Website](http://59.108.48.34/mipl/xmedia) and [Laboratory Homepage](http://www.icst.pku.edu.cn/mipl) for more information about our papers, source codes, and datasets.
