function z = soft_thresh(x, l)
    z = sign(x) .* max(abs(x) -l, 0.);
end

