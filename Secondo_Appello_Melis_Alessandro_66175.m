%Esercizio n. 1
% clear, clc
% 
% while 1
%     n = input("\nInserisci un numero ")
% 
%     if(mod(n,2) == 0 && n > 0)
%         m = zeros(n, n-2)+7
%         break
%     else
%         warning("\nIl numero deve essere pari e positivo!\n")
%     end
% end

%Esercizio n. 2
% clear, clc
% 
% while 1
%     %Genera numeri casuali nell%intervallo a e b
%     A = (10-(-10)).*rand(8)+(-10)
%     
%     if det(A) ~= 1e-10
%         x = ones(8,1)       % soluzione imposta
%         b = A*x             % Calcolo termine noto
%         x1 = A\b            % soluzione calcolata
%         err = norm(x1-x)/norm(x); % errore relativo
%         fprintf("\nErrore relativo: %d\n",err)
%         break
%     else
%         warning("\nMatrice non invertibile!\n")
%     end
% end

%Esercizio n. 3
% clear, clc
% 
% % Da 1 a 10
% arrayTabella = zeros(10,2); %matrice di supporto per la tabella
% for i=1:10
%     while 1
%         B = randi([0,20],i);
%         U = triu(B);
%         if det(U) >= 1e-10
%             x = ones(i,1);       % soluzione imposta
%             b = U*x;             % calcolo termine noto
%             x1 = U\b;            % risoluzione sistema lineare
%             err = norm(x1-x)/norm(x); % errore relativo
%             arrayTabella(i,:) = [i, err]; % riempio l'array che diventerà una tabella
%             break;
%         end
%     end
% end
% 
% tabella = array2table(arrayTabella, "VariableNames",{'dim','err'}); % genero l'array in una tabella
% disp(tabella) % stampo tabella

%Esercizio n. 4
% clear, clc
% 
% B = randi(10,10);
% U = triu(B);
% x = ones(10,1);       % soluzione imposta
% b = U*x;             % calcolo termine noto
% 
% [x] = sist_triu2(U, b)
% 
% % Visualizza il risultato
% disp('Soluzione del sistema Ux = b:');
% disp(x);
% 
% function x = sist_triu2(U, b)
%     % Controllo che la matrice U sia quadrata
%     [m, n] = size(U);
%     if m ~= n
%         error('La matrice U deve essere quadrata.');
%     end
% 
%     % Controllo che i vettori siano compatibili
%     if numel(b) ~= n
%         error('Le dimensioni di U e b non sono compatibili.');
%     end
% 
%     % Inizializzo il vettore delle soluzioni x
%     x = zeros(n, 1);
% 
%     % Algoritmo di sostituzione all'indietro
%     for i = n:-1:1
%         x(i) = (b(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
%     end
% end

%Esercizio n. 5
clear, clc

% Da 1 a 10
arrayTabella = zeros(10,2); %matrice di supporto per la tabella
for i=1:10
    while 1
        B = randi([0,20],i);
        U = triu(B);
        if det(U) >= 1e-10
            x = ones(i,1);       % soluzione imposta
            b = U*x;             % calcolo termine noto
            x1 = sist_triu2(U, b);
            err = norm(x1-x)/norm(x); % errore relativo
            arrayTabella(i,:) = [i, err]; % riempio l'array che diventerà una tabella
            break;
        end
    end
end

tabella = array2table(arrayTabella, "VariableNames",{'dim','err'}); % genero l'array in una tabella
disp(tabella) % stampo tabella

function x = sist_triu2(U, b)
    n=rank(U);

    % Inizializzo il vettore delle soluzioni x
    x = zeros(n, 1);

    % Algoritmo di sostituzione all'indietro
    for i = n:-1:1
        x(i) = b(i) / U(i, i);
        b(1:i-1) = b(1:i-1) - U(1:i-1, i) * x(i);
    end
end

