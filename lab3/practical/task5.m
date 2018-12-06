# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-3.1

clc
clear all

task4

function printcell(cell)
  for k=1:size(cell)(3)
    for i=1:size(cell)(1)
      for j=1:size(cell)(2)
        fprintf(num2str(cell{i,j,k})); 
        if i>1
        fprintf("         ");
        else
        fprintf("   ");  
        endif
      end
      fprintf("\n");
    end
    fprintf("\n");
  end
  fprintf("\n");
end

mean(versicolor(1:50,:));
var(versicolor(1:50,:));

mv_array=cell(3,5,3);

mv_array(2,1,1) = "mean";
mv_array(3,1,1) = "variance";


mv_array(2,2:5,1)=num2cell(mean(versicolor(1:50,:)));
mv_array(3,2:5,1)=num2cell(var(versicolor(1:50,:)));

mv_array(1,2,:)="SepalLength";
mv_array(1,3,:)="SepalWith";
mv_array(1,4,:)="PetalLength";
mv_array(1,5,:)="PetalWidth";

printcell(mv_array);

