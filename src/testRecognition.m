%UU -> U of the svd. The matrix with the eigenVectors for all the elements
%NumberOfElements-> the number of distinct objects inside the dataset (ex: 10 digits)
%The image to recognize. It is a row vector c*r
%nameFormat-> name of the matrices (ex: 'train')
%package-> dataset

function testRecognition(UU, numberOfElements, nameFormat, package)
    load(package);
    for i= 0:numberOfElements -1 %ogni elemento del test set
       
        test = double(eval([nameFormat, int2str(i)]))'; 
        % per ogni elemento calcolo il residuo rispetto alla base (le componenti sono le colonne di UU(:,:,j+1))
        for j = 0:numberOfElements-1 
            %R è una matrice delle stesse dimensioni di test(k immagini x rows*columns)
            R = test - UU(:,:,j+1)*UU(:,:,j+1)'*test; % calcoliamo il residuo dalla base j+1-esima
            %calcolo la norma di ogni colonna e la salvo nella prima riga della
            %matrice norma. Questa conterrà la norma di ogni immagine rispetto ad
            %ogni elemento del dataset(numberOfElements x k immagini)
            norma(j+1,1:size(test,2)) = sqrt(sum(R.^2));
        end
        %calcolo la percentuale di successo di ogni test
        [minval,ival] = min(norma);
        perc(i+1) = sum((ival-1)==i)*100/size(test,2);
    end
    %stampa della percentuale di successo di ogni test
    [(0:numberOfElements-1)', perc']
end