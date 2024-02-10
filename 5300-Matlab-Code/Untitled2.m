A = {'snw','apple', 'banana', 'cherry'};
str = 'apple';
[result,loc] = ismember(str, A);
if result
    disp('The string is in the cell array.')
else
    disp('The string is not in the cell array.')
end