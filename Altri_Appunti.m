%Roba di Valeria
%Esercizio n. “3”
clear, clc
T=zeros(10,2); %matrice di supporto per tabella
tau=1e-7;

for dim=(1:1:10) %matrici di dimensione crescente da 1 a 10, con passo 1
    flag=1; 
    while flag
    B=randi([0,20],dim); %creata una matrice B con numeri pseudo-casuali interi tra 0 e 20
    U=triu(B); % estratta la parte triangolare superiore U
    if(det(U)>tau) %effettuato il controllo sull’invertibilità della matrice U
       flag=0; 
    else 
        flag=1;
    end
    end
    x=ones(dim); %si imponga una soluzione nota x contenente elementi uguali a 1
    b=U*x; %si calcoli il termine noto b
    x1=U\b; %e si risolva il sistema lineare

    err=norm(x1-x)/norm(x); % si calcoli l’errore relativo tra la soluzione vera x equella ottenuta x1
    T(dim,:)=[dim,err]; %popolo la matrice della tabella
   
end
tabella=array2table(T,"VariableNames",{'dim','err'}); %genero la tabella
disp(tabella)

% Roba di Michele

flag = true;
while(flag==true)

x=input("Inserisca un numero pari e positivo");
b=mod(x,2);
if(x>0 && b==0)

    A=7*ones(x,x-2);
    
    disp(A);
    flag=false;
   
else
warning("il numero inserito non è pari e positivo ")
end

end








clear clc
flag=true;
while(flag==true)
A=randn(8);
if(det(A)<5e-10)
    flag=false;
end
end
x=[1 1 1 1 1 1 1 1]';
b=A*x;
x1=A\b;
error=norm(x-x1)/norm(x);
disp(A);
disp(x);
disp(x1);
disp(b);
disp(error);





clear,clc

n=[1 2 3 4 5 6 7 8 9 10]';
error=ones(10,1);
for i=1:10
    flag=true;
   while(flag==true)
        B=randi(20,i,i);
        
         U=triu(B);

        if(det(U)>1e-9)
            flag=false;
        end
    end

    x=ones(i,1);
    b=U*x;
    x1=U\b;
    error(i)=norm(x-x1)/norm(x);
  

end
 T=table(n,error);
    disp(T);

% Inizializzazione delle variabili per la tabella
dimensioni = 1:10;
errori_relativi = zeros(1, length(dimensioni));

for dim = dimensioni
    % Creazione di una matrice B con numeri pseudo-casuali interi tra 0 e 20
    B = randi([0, 20], dim, dim);
    
    % Estrazione della parte triangolare superiore
    U = triu(B);
    
    % Controllo sull'invertibilità della matrice U
    while rank(U) < dim
        % Se U non è invertibile, genera una nuova matrice B e ripeti il processo
        B = randi([0, 20], dim, dim);
        U = triu(B);
    end
    
    % Imposta una soluzione nota x contenente elementi uguali a 1
    x = ones(dim, 1);
    
    % Calcola il termine noto b
    b = U * x;
    
    % Risoluzione del sistema lineare
    x1 = U \ b;
    
    % Calcolo dell'errore relativo tra la soluzione vera x e quella ottenuta x1
    errore_relativo = norm(x - x1) / norm(x);
    
    % Memorizza l'errore relativo nella tabella degli errori
    errori_relativi(dim) = errore_relativo;
end

% Visualizzazione della tabella con dimensione ed errore relativo
disp('Dimensione   Errore Relativo');
disp([dimensioni', errori_relativi']);

R = (b-a).*rand(n)+a //Genera numeri casuali nell’intervallo a e b