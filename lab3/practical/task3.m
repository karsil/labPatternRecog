clc
clear all
task2

function printcell(cell)
  for k=1:size(cell)(3)
    for i=1:size(cell)(1)
      for j=1:size(cell)(2)
        fprintf(num2str(cell{i,j,k})); 
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
end

printcell(iris1)
