# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-3.1

function printcell(inVal)
  for k=1:size(inVal)(3)
    for i=1:size(inVal)(1)
      for j=1:size(inVal)(2)
        fprintf(num2str(inVal{i,j,k})); 
        if i>1
        fprintf("         ");
        else
        fprintf("  ");  
        endif
      end
      fprintf("\n");
    end
    fprintf("\n");
  end
  fprintf("\n");
endfunction