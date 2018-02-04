function [ kernel ] = computecmcpcosinekernel( labelATrain, dataATrain, dataATest, labelBTrain, dataBTrain, dataBTest, alpha, beta, k)
 
nATrain = size(dataATrain, 1);
nATest = size(dataATest, 1);
[dataATrain, dataATest] = znorm(dataATrain,dataATest);
kernelACosine = computecosinekernel([dataATrain; dataATest]);

nBTrain = size(dataBTrain, 1);
nBTest = size(dataBTest, 1);
[dataBTrain, dataBTest] = znorm(dataBTrain,dataBTest);
kernelBCosine = computecosinekernel([dataBTrain; dataBTest]);

kernel = computecmcpkernel(labelATrain, kernelACosine, labelBTrain, ...
    kernelBCosine, nATrain, nATest, nBTrain, nBTest, alpha, beta, k);

end

