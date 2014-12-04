x0 = [1; -1; 2];
options = optimset('GradObj','off');
[f_min_unc, val] = fminunc(@fun, x0, options)
options = optimset('GradObj','on');
[f_min_unc, val] = fminunc(@fun, x0, options)
[f_min_search, val] = fminsearch(@fun, x0)