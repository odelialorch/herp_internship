from Bio.Nexus import Nexus
from Bio import SeqIO
from Bio.Seq import Seq
from Bio.Alphabet import generic_dna
import numpy as np

# turns ? and - into N so BioPython can read it
def clean_data(data):
  data[data == '-'] = 'N'
  data[data == '?'] = 'N'
  return data

#turns nexus file into an array (list of snakes, each of which is a list of bases)
handle = open("snakegenomes.nex", "rU")
sequence = np.array((list(SeqIO.parse(handle, "nexus"))))

#turns numpy array into a list of strings, each of which is a snake's genome
snakestrings = []
for snake in sequence:
  temp = ''.join(clean_data(snake))
  snakestrings.append(temp)

#translates each string into amino acids
  # * = stop codon
  # X = N codon 
  # Amino acid letters:
      # F = Phe     S = Ser     C = Cys
      # L = Leu     P = Pro     W = Trp
      # I = Ile     T = Thr     R = Arg
      # M = Met     A = Ala     S = Ser
      # V = Val     Y = Tyr     G = Gly
snakeAAs = []

for snake in snakestrings:
  dna = Seq(snake, generic_dna)
  snakeAAs.append(str(dna.translate()))

print snakeAAs

fourfolds = ['L', 'V', 'S', 'P', 'T', 'A', 'R', 'G']
indexesoffourfolds = []

snake = snakeAAs[0]
for AA in snake:
  for i in range(8):
    if AA == fourfolds[i]:
      indexesoffourfolds.append(snake.index(AA))


print indexesoffourfolds
