
%reads text file
A_1 = dlmread('test_1.txt');

%user chooses model
I = input("Derivative (1) or Integral? (2) ");

 if I == 1
     Derivative(A_1);
 elseif I == 2
     Integral(A_1);
 end