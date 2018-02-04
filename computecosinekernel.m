function [ kernel ] = computecosinekernel( data )

D = pdist(data,'cosine');
Z = squareform(D);
Z = 1 - Z;
kernel = Z;
end

