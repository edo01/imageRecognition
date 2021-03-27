%package-> dataset
%imageCols
%imageRows
%NumberOfElements-> the number of distinct objects inside the dataset (ex: 10 digits)
%The image to recognize. It is a row vector c*r
%nameFormat-> name of the matrices (ex: 'train')
function showCentroids( imageCols, imageRows, numberOfElements, nameFormat, package)
    load(package);
    for i = 0:numberOfElements-1
        C(i+1,:) = mean(double(eval([nameFormat, int2str(i)])), 1);
        subplot(2,5, i+1);
        ima2(C(i+1,:),  imageCols, imageRows);
    end