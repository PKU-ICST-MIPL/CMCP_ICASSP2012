function [mapIA, mapIT, mapTA, mapTI] = CMCP(I_tr, T_tr, I_te, T_te, trainCat, testCat, alpha, beta, k) 

% *************************************************************************
% *************************************************************************
% Parameters:
% I_tr: the feature matrix of image instances for training
%              dimension : tr_n * d_i
% T_tr: the feature matrix of text instances for training
%              dimension : tr_n * d_t
% I_te: the feature matrix of image instances for test
%              dimension : te_n * d_i
% T_te: the feature matrix of text instances for test
%              dimension : te_n * d_t
% trainCat: the category list of data for training
%              dimension : tr_n * 1
% testCat: the category list of data for test
%              dimension : te_n * 1
% alpha: parameter, default: 0.6
% beta: parameter, default: 1
% k: kNN parameter, default: 30
% *************************************************************************
% *************************************************************************

dataTextTrain = T_tr;
dataImageTrain = I_tr;
dataTextTest = T_te;
dataImageTest = I_te;

labelTrain = trainCat;
labelTest = testCat;

[dataImageTrain, dataImageTest] = znorm(dataImageTrain,dataImageTest);
[dataTextTrain, dataTextTest] = znorm(dataTextTrain,dataTextTest);

kernelImageCmcpCosine = computecmcpcosinekernel(labelTrain, ...
        dataImageTrain, dataImageTest, labelTrain, dataTextTrain, dataTextTest, alpha, beta, k);
kernelTextCmcpCosine = computecmcpcosinekernel(labelTrain, ...
        dataTextTrain, dataTextTest, labelTrain, dataImageTrain, dataImageTest, alpha, beta, k);

mapIT = evaluateMAPPR(kernelImageCmcpCosine, labelTest, labelTest);
mapTI = evaluateMAPPR(kernelTextCmcpCosine, labelTest, labelTest);

W_IT = kernelImageCmcpCosine;
W_TI = kernelTextCmcpCosine;
W_II = computecmcpcosinekernel(labelTrain, dataImageTrain, dataImageTest, labelTrain, dataImageTrain, dataImageTest, alpha, beta, k);
W_TT = computecmcpcosinekernel(labelTrain, dataTextTrain, dataTextTest, labelTrain, dataTextTrain, dataTextTest, alpha, beta, k);
W_I = [W_II W_IT];
mapIA = evaluateMAPPR(W_I, labelTest, [labelTest; labelTest]);
W_T = [W_TI W_TT];
mapTA = evaluateMAPPR(W_T, labelTest, [labelTest; labelTest]);