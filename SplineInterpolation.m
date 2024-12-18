function result = SplineInterpolation(xa, ya, x)
    n = length(xa) - 1; 
    h = diff(xa);       

    A = zeros(n+1, n+1);
    rhs = zeros(n+1, 1);

    A(1,1) = 1; A(n+1,n+1) = 1;

    for i = 2:n
        A(i,i-1) = h(i-1);
        A(i,i)   = 2*(h(i-1) + h(i));
        A(i,i+1) = h(i);
        rhs(i)   = (3/h(i))*(ya(i+1) - ya(i)) - (3/h(i-1))*(ya(i) - ya(i-1));
    end
    M = A\rhs;
    a = ya(1:end-1);
    b = zeros(n,1);
    c = M(1:end-1);
    d = zeros(n,1);

    for i = 1:n
        b(i) = (ya(i+1) - ya(i))/h(i) - h(i)*(M(i+1) + 2*M(i))/3;
        d(i) = (M(i+1) - M(i))/(3*h(i));
    end
    for i = 1:n
        if x >= xa(i) && x <= xa(i+1)
            dx = x - xa(i);
            result = a(i) + b(i)*dx + c(i)*dx^2 + d(i)*dx^3;
            return;
        end
    end
    
 
