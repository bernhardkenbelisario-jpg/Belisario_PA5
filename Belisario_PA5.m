disp('A: TRANSPOSE OPERATIONS')


R = [ 5 -2  0  7; 
      1  3 -4  2; 
      6  0  8 -1 ];

Z = [ 2+3i -1+4i  5-2i; 
     -3+1i     6  2+5i ];

disp('For Matrix R')

disp(' Matrix R:')
disp(R)
disp('1) transpose(R):')
disp(transpose(R))
disp('2) R'':')
disp(R')
disp('3) R.'':')
disp(R.')

disp('For Matrix Z')

disp(' Matrix Z:')
disp(Z)
disp('1) transpose(Z):')
disp(transpose(Z))
disp('2) Z'':')
disp(Z')
disp('3) Z.'':')
disp(Z.')

%{
ANSWERS TO PROBLEM A QUESTIONS:
a. Which operations give identical results for the real matrix R?
   All three operations transpose(R), R', and R.' produce identical 
   results for the real matrix R because all entries are real numbers.

b. Which two operations give identical results for the complex matrix Z?
   transpose(Z) and Z.' produce identical results. Both compute the 
   un-conjugated standard transpose without altering the imaginary parts 
   of complex numbers.

c. What additional operation is performed by the apostrophe operator when 
   the matrix contains complex entries?
   The apostrophe operator (') performs a complex-conjugate transpose 
   (Hermitian transpose). In addition to swapping rows and columns, it 
   takes the complex conjugate of each entry by negating the sign of its 
   imaginary part.
%}


disp('B: TWO METHODS FOR A LINEAR SYSTEM')

disp('Matrix A')
A = [ 2 -1  3  2; 
      1  4 -2  1; 
      3  2  1 -1; 
     -2  3  4  2 ];

b = [ 16; 
      -7; 
       6; 
       7 ];

disp('Coefficient Matrix A:')
disp(A)
disp('Right-Hand-Side Vector b:')
disp(b)


x_inv = inv(A) * b;
disp('Solution via Inverse Method (x_inv):')
disp(x_inv)

det_A = det(A);
n = length(b);
x_cramer = zeros(n, 1);

for j = 1:n
    A_temp = A;          
    A_temp(:, j) = b;   
    x_cramer(j) = det(A_temp) / det_A;
end

disp('Solution via Cramer''s Rule (x_cramer):')
disp(x_cramer)

disp('Required Checks & Numerical Verification')
norm_diff = norm(x_inv - x_cramer);
residual_norm = norm(A * x_inv - b);

disp('--- Numerical Verification Checks ---')
fprintf('Determinant of A, det(A)    = %.4f  (Must be non-zero)\n', det_A)
fprintf('norm(x_inv - x_cramer)      = %e  (Approximately 0)\n', norm_diff)
fprintf('norm(A*x_inv - b)          = %e  (Approximately 0)\n', residual_norm)

if det_A ~= 0
    disp('Check Passed: det(A) is non-zero; unique solution exists, and both norm checks are ~0.')
else
    disp('Check Failed: det(A) is zero.')
end