%% Практична робота №6. Варіант 8
% Тема: Розв'язування нелінійних рівнянь та систем рівнянь
% Виконавець: Варіант №8

clc; clear; close all;

%% --- Завдання 1. Алгебраїчне рівняння (roots) ---
% x^3 - 13x^2 + 55x - 75 = 0

disp('--- Завдання 1 ---');
coeffs = [1 -13 55 -75];
roots_result = roots(coeffs);
disp('Корені рівняння:');
disp(roots_result);

%% --- Завдання 2. Нелінійне рівняння (solve) ---
% e^(-3x) - 5x^3 + 6 = 0

disp('--- Завдання 2 ---');
syms x;
eq2 = exp(-3*x) - 5*x^3 + 6 == 0;
sol2 = vpasolve(eq2, x, [-2 2]); % пошук дійсного кореня
disp('Розвязок рівняння:');
disp(sol2);
disp('Перевірка:');
disp(subs(eq2, x, sol2));

%% --- Завдання 3. Рівняння для fzero ---
% x - sin(x) - 0.25 = 0

disp('--- Завдання 3 ---');
f3 = @(x) x - sin(x) - 0.25;
fplot(f3, [-1, 2]); grid on; title('Графік для завдання 3');
xlabel('x'); ylabel('f(x)');
x3 = fzero(f3, [0, 2]);
disp('Корінь рівняння fzero:');
disp(x3);

%% --- Завдання 4. Метод Ньютона ---
% x - log10(x) - 0.5 = 0

disp('--- Завдання 4 ---');
f4 = @(x) x - log10(x) - 0.5;
df4 = @(x) 1 - 1./(x*log(10));
x0 = 0.5; eps = 1e-4; max_iter = 50;
for k = 1:max_iter
    x1 = x0 - f4(x0)/df4(x0);
    if abs(x1 - x0) < eps
        break;
    end
    x0 = x1;
end
disp(['Корінь методом Ньютона: ', num2str(x1)]);
disp(['Кількість ітерацій: ', num2str(k)]);

%% --- Завдання 5. Система нелінійних рівнянь ---
% {
%   x^3/(y^2 + 1) + e^(-xy) - 1 = 0
%   5xy^2 - 3x^3 = 0
% }
% x0 = -0.05, y0 = 0.1

disp('--- Завдання 5 ---');
syms x y;
f1 = x^3/(y^2 + 1) + exp(-x*y) - 1;
f2 = 5*x*y^2 - 3*x^3;

% Метод Ньютона для системи
X = [-0.05; 0.1];
eps = 1e-4;
for iter = 1:50
    J = [diff(f1,x) diff(f1,y); diff(f2,x) diff(f2,y)];
    F = [subs(f1, [x y], X'); subs(f2, [x y], X')];
    J_val = double(subs(J, [x y], X'));
    F_val = double(F);
    delta = -J_val\F_val;
    X_new = X + delta;
    if norm(X_new - X) < eps
        break;
    end
    X = X_new;
end
disp('Розвязок системи методом Ньютона:');
disp(X);
disp(['Кількість ітерацій: ', num2str(iter)]);
