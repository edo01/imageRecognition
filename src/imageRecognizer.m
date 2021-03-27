%{
    Il dataset deve essere così
    composto:
    1. 2 tipi di matrici: test e train;
    2. Se il dataset è composto da k elementi dovranno essere presenti k
    file train e k file test del seguente formato: 'trainI' oppure 'testI'
    con I tra 0 e k-1;
    3. La matrice I-esima deve avere sulle righe l'immagine corrispondente
    all'elemento I-esimo e avrà le seguenti dimensioni: numeroDiImmagini x
    rows*columns.
%}

%package-> dataset
%c-> columns
%r-> rows
%k-> how many eigenvectors
%NumberOfElements-> the number of distinct objects inside the dataset (ex: 10 digits)
%z ->The image to recognize. It is a row vector c*r
function element = imageRecognizer(package, c, r, k, numberOfElements, z)
    train_format = 'train';

    load(package);
    UU = calcBasi(k, numberOfElements,  train_format, package);
    z = z';
    element = recognition(UU, z, numberOfElements, package);