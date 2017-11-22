function nLL = normNLL(mdl)

phat = mle(mdl.residuals,'distribution', 'norm');
nLL = normlike(phat, mdl.residuals);

end