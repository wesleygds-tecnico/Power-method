
function [lam1,eigvec,it] = Potencias(A,y,erromax)
n = length(A); % ver ordem da matriz A
z = A * y % c�lculo do primeiro z
lamold = z./y % primeira aproxima��o para lambda 1
alpha = max(abs(z)) % c�lculo do alpha
for it = 1:10000
    a = input('Continuar? \n')
    if(a == 1)
    else
        return
    end
    y = z / alpha
    z = A * y
    alpha = max(abs(z))
    lam = z./y
    %err = abs(lam-lamold)./abs(lam);
    [erro,p] = min(abs(lam-lamold)./max(abs(lam),1.))
    if (erro<erromax)
        lam1 = lam(p);
        eigvec = y;
        break;
    end
    lamold = lam;
end
fprintf('Autovalor \n')
disp(lam1)
fprintf('Autovetor \n')
disp(eigvec)
fprintf('N�mero de itera��es \n')
disp(it)
fprintf('Verifica��o')
(A*eigvec)/lam1
end