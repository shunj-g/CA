function state = initstate(state)
[row,col] = size(state);
%    �ȶ���
%     for i = 4:5
%        for j = 4:5
%            state(i,j) = 1;
%        end
%    end
%%
%���������
randd = 0.5;
for i= 1:row
    for j = 1:col
        if randd>=rand
            state(i,j) = 1;
        end
    end
end
%%
% for i = 1:row
%     for j = 1:col
%         if i == j
%            state(i,j) = 1;
%         end
%     end
% end
% for i = 1:row
%     for j = col:1
%         if (i+j)==(row+1)
%            state(i,j) = 1;
%         end
%     end
% end

end

