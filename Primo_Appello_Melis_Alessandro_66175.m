% Esercizio 1
% while 1
%     
%     x = input("Inserisci un numero ")
% 
%     if((x > 0) && (x < 10))
%         x = x^2
%         fprintf("\nQuadrato : %d\n", x)
%         break
%     else
%         warning("\nIl numero inserito deve essere compreso tra 0 e 10\n")
%     end
% end

% Esercizio 2
R = (200-2).*rand(8,10)+2
% R = randi([2,200],8,10)

n1 = norm(R, 1)
n2 = norm(R)
nInf = norm(R, "inf")

fprintf("\nNorma 1: %d, Norma 2: %d, Norma inf: %d\n",n1,n2,nInf)

% Esercizio 3
% while 1
%     A = rand(5)
% 
%     if det(A) ~= 1e-10
%         A = A*A'
%         lambda = eig(A)
%         rho = max(abs(lambda))
%         fprintf("\nAutovalori: %d\n", lambda)
%         fprintf("\nRaggio spettrale: %d\n", rho)
%         break
%     else
%         warning("\nMatrice non invertibile!\n")
%     end
% end

% Esercizio 4
% fun =  @(x) cos(3.*x) - sin(2.*x);
% x = linspace(-10,10,500)';
% y = fun(x);
% plot(x, y)
% title('Esercizio 4')
% xlabel('x')
% ylabel('y')


