file_contents = readFile('emailSample1.txt');
word_indices  = processEmail(file_contents);
vocabList = getVocabList();

n = 1899;

x = zeros(n, 1);


for i = 1:length(word_indices)
   
    idx = word_indices(i); 
    x(idx) = 1; 
end