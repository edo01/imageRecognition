%package-> dataset
%UU -> U of the svd. The matrix with the eigenVectors for all the elements
%NumberOfElements-> the number of distinct objects inside the dataset (ex: 10 digits)
%z-> The image to recognize. It is a row vector
function element = recognition(UU, z,  numberOfElements, package)
   load(package);
   for j = 0:numberOfElements-1
       R(j+1) = norm(z - UU(:,:,j+1)*UU(:,:,j+1)'*z);
   end
   [minval,ival] = min(R); 
   element = ival-1;
   