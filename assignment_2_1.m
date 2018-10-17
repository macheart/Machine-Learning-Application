%% Output is a numerical encoding of a protein sequence. Irrespective of sequence being 
% a completely valid protein sequence. If there is a non-amino acid 
% abbreviation at any position, then it outputs a warning message

%% Input a protein sequence as a string 'aaseq'
aaseq = ' adr &22' % protein sequence
encoding = zeros(1,length(aaseq)) % create a cell array with all zeroes
for aa = 1:length(aaseq) % Loops through each letter in the sequence
    if (aaseq(aa) == 'A' | aaseq(aa)=='a'); % check for this amino acid irrespective of character type
        encoding(aa) = 1 % assign it this value in the encoding
    elseif (aaseq(aa) == 'R' | aaseq(aa)=='r'); % check for this amino acid irrespective of character type
        encoding(aa) = 2  % assign it this value in encoding
    elseif (aaseq(aa) == 'N' | aaseq(aa)=='n');
        encoding(aa) = 3
    elseif (aaseq(aa) == 'D' | aaseq(aa)=='d');
        encoding(aa) = 4
    elseif (aaseq(aa) == 'B' | aaseq(aa)=='b');
        encoding(aa) = 5
    elseif (aaseq(aa) == 'C' | aaseq(aa)=='c');
        encoding(aa) = 6
    elseif (aaseq(aa) == 'E' | aaseq(aa)=='e');
        encoding(aa) = 7
    elseif (aaseq(aa) == 'Q' | aaseq(aa)=='q');
        encoding(aa) = 8
    elseif (aaseq(aa) == 'Z' | aaseq(aa)=='z');
        encoding(aa) = 9
    elseif (aaseq(aa) == 'G' | aaseq(aa)=='g');
        encoding(aa) = 10
    elseif (aaseq(aa) == 'H' | aaseq(aa)=='h');
        encoding(aa) = 11
    elseif (aaseq(aa) == 'I' | aaseq(aa)=='i');
        encoding(aa) = 12
    elseif (aaseq(aa) == 'L' | aaseq(aa)=='l');
        encoding(aa) = 13
    elseif (aaseq(aa) == 'K' | aaseq(aa)=='k');
        encoding(aa) = 14
    elseif (aaseq(aa) == 'M' | aaseq(aa)=='m');
        encoding(aa) = 15
    elseif (aaseq(aa) == 'F' | aaseq(aa)=='f');
        encoding(aa) = 16
    elseif (aaseq(aa) == 'P' | aaseq(aa)=='p');
        encoding(aa) = 17
    elseif (aaseq(aa) == 'S' | aaseq(aa)=='s');
        encoding(aa) = 18
    elseif (aaseq(aa) == 'T' | aaseq(aa)=='t');
        encoding(aa) = 19
    elseif (aaseq(aa) == 'W' | aaseq(aa)=='w');
        encoding(aa) = 20
    elseif (aaseq(aa) == 'Y' | aaseq(aa)=='y');
        encoding(aa) = 21
    elseif (aaseq(aa) == 'V' | aaseq(aa)=='v');
        encoding(aa) = 22
    else
        warning('May not be a competely valid protein sequence')
        encoding(aa) = -1 % assign spaces, and non-aa letters or numbers, a -1
    end
end
