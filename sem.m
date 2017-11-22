function SEM = sem(data,dim)

s = size(data);
if dim > max(s)
  error(strcat('Data matrix has fewer than',32,num2str(s),' dimensions'))
end

SEM = nanstd(data,0,dim)./sqrt(sum(~isnan(data),dim));