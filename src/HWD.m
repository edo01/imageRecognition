
%{
    è possibile sostituire il dataset con un qualunque dataset così
    composto:
    1. 2 tipi di matrici: test e train;
    2. Se il dataset è composto da k elementi dovranno essere presenti k
    file train e k file test del seguente formato: 'trainI' oppure 'testI'
    con I tra 0 e k-1;
    3. La matrice I-esima deve avere sulle righe l'immagine corrispondente
    all'elemento I-esimo e avrà le seguenti dimensioni: numeroDiImmagini x
    rows*columns.
%}
package = 'mnist_all.mat';
train_format = 'train';
test_format = 'test';
r = 28;
c = 28;
numberOfElements = 10;
k = 20

load(file);
showCentroidi( c, numberOfElements, 10, train_format, package);

UU = calcBasi(k, numberOfElements,  train_format, package);

testRecognition(UU, numberOfElements, train_format, package);

zero_T = double(test0);
m = 11;
z = zero_T(m,:)';
ima2(z,28,28);
recognition(UU, z, numberOfElements, package)