function [ kernelCmcp ] = computecmcpkernel( labelATrain, kernelASimilarity, labelBTrain, kernelBSimilarity, nATrain, nATest, nBTrain, nBTest, alpha, beta, k)
 
PARAM_BETAA = beta;
PARAM_ALPHAA = alpha;
PARAM_KA = k; 
PARAM_BETAB = beta;
PARAM_ALPHAB = alpha;
PARAM_KB = k;

labelConsistentMatrix = double((repmat(labelATrain,1,nBTrain))==(repmat(labelBTrain,1,nATrain))');
labelNotConsistentMatrix = labelConsistentMatrix-1;

labelConsistentMatrix = labelConsistentMatrix./repmat(sum(labelConsistentMatrix),nATrain,1);
labelNotConsistentMatrix = -1*labelNotConsistentMatrix./repmat(sum(labelNotConsistentMatrix),nATrain,1);

labelConsistentMatrix = labelConsistentMatrix+labelNotConsistentMatrix;

labelCosistentMatrix = [labelConsistentMatrix;0*ones(nATest,nBTrain)];
YstarTI = ssl_knn(kernelASimilarity, labelCosistentMatrix, PARAM_KA, PARAM_ALPHAA, PARAM_BETAA);

labelCosistentMatrix = YstarTI;
labelCosistentMatrix = [labelCosistentMatrix, 0*ones(nATrain+nATest,nBTest)];
labelCosistentMatrix = labelCosistentMatrix';
YstarTI = ssl_knn(kernelBSimilarity, labelCosistentMatrix, PARAM_KB, PARAM_ALPHAB, PARAM_BETAB);
YstarTI = YstarTI';
kernelCmcp = YstarTI(nATrain+1:nATrain+nATest,nBTrain+1:nBTrain+nBTest);

end

