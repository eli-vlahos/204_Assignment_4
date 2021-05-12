function Integral(D)

    arguments
        %specifies the type of input
        D (:,2) {mustBeNumeric, mustBeFinite};
    end
    
    %asks what the values are
    p_1 = input("What will be the lower point? ");
    p_2 = input("What will be the upper point? ");
    n = input("What number of segments do you want? ");
    
    %find size of input
    s = size(D);
    s = s(1,1);
    
    
    %rows where the lower and upper limit are found
    sum = 0;
    row_a = find(D(:,1) == p_1);
    row_b = find(D(:,1) == p_2);
    
    %creates linearly spaced vector
    X_new = linspace(p_1,p_2,n+1);
    change = X_new(2)-X_new(1);

    %uses a boolean value to check to see whether or not values within the
    %matrix are equal
    equal = 1;
    
    if n <= s
        for i = 1:n
            if ~(abs((X_new(i) - D(row_a+i-1,1))) < 0.01)
                equal = 0;
            end
        end
    else
        equal = 0;
    end
    
    % checks to see if input is compatible with data
    if p_1 >= D(1,1) && p_2 <= D(s,1)
        bool = 1;
    else
        bool = 0;
    end
    
    %if both conditions are true can proceed as normal, otherwise need
    %polynomial regression
    if equal && bool
        f_a = D(row_a,2);
        f_b = D(row_b,2);
        
        for i = 1:n-1
            sum = sum+D(row_a+i,2);
        end
        
        integral = ((p_2-p_1)/(2*n))*(f_a+2*sum+f_b)
        
    elseif ~equal && bool
        integral = Polynomial_Integral(D,p_1,p_2,n)
    else
        %gives warning
        disp("one of the p values is out of range")
    end

     
end