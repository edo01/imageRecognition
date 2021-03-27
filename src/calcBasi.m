%k-> how many eigenvectors
%NumberOfElements-> the number of distinct objects inside the dataset (ex: 10 digits)
%nameFormat-> name of the matrices (ex: 'train')
%package-> dataset

function UU = calcBasi(k, numberOfElements, nameFormat, package )
    load(package);
    for j = 0: numberOfElements-1
        train = double(eval([nameFormat, int2str(j)]));
        [uu, ss, vv] = svds(train', k);
        UU(:,:,j+1) = uu;
    end
end
