function state= ruler(state,neighbor)
[row,col] = size(neighbor);
for i = 2:row+1%
    for j = 2:col+1
         neighbor_num = neighbor(i-1,j-1);%��������ھӵĸ���
         if neighbor_num== 3%���ĸ���Ϊ3
             state(i,j) = 1;
         else if neighbor_num== 2%���ĸ���Ϊ0
             else
              state(i,j) = 0;
             end
         end
    end
end
end

