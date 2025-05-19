
function w = calculate_w(R_n,R_t)

if isequal(R_n, R_t)
    w = [0,0,0]';
else
    R_err = R_n' * R_t;
    Err_th = acos((R_err(1,1) + R_err(2,2) + R_err(3,3) - 1)/2);
    if Err_th == 0
        w = [0,0,0]';
    else
        w = (Err_th / (2 * sin(Err_th))) * [  R_err(3,2)-R_err(2,3),  R_err(1,3)-R_err(3,1),  R_err(2,1)-R_err(1,2)  ]';
    end
end

end
