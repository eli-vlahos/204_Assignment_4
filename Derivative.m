function Derivative(D)
    arguments
        %specifies the type of input
        D (:,2) {mustBeNumeric, mustBeFinite};
    end
    %input
    p = input("At what point would you like to evaluate? ");

    %size of matrix
    s = size(D);
    s = s(1,1);
    
    %kept track to see if the changes were the same throughout the data.
    %keep track of the minimum so it can be used later
    change = -D(1,1)+D(2,1);
    last_change = change;
    minimum = change;
    
    bool = 1;
    equal = 0;
    
    %checked to see if the difference was constant and if not what the
    %minimum was
    for i = 1:s
        
        if i < s
            if change ~= last_change
                minimum = change;
                bool = 0;
            end

            last_change = change;
            change = -D(i,1)+D(i+1,1);

        end
        
        if D(i,1) == p
            equal = 1;
        end
        
    end
    
    %if all conditions are true use CDD immediately, otherwise call
    %function
    if equal && bool
        lower = find(D(:,1) == p-change);
        higher = find(D(:,1) == p+change);
        f_x = find(D(:,1) == p);
        
        derivative = (D(higher,2)-D(lower,2))/(2*change)
    else
        derivative = Polynomial_Derivative(D,p,change)
    end
    
    

     
end