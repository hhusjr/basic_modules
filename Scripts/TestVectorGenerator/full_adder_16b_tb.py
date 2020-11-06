from random import randint
from tqdm import tqdm

def main():
    with open('../../TestVectors/full_adder_16b_tb.tv', 'w') as f:
        for i in tqdm(range(2 ** 8)):
            for j in range(2 ** 8):
                for ci in range(2):
                    s = (i + j + ci) & (2 ** 16 - 1)
                    co = (i + j + ci) >> 16
                    print('{:0>16b}_{:0>16b}_{:0>1b}_{:0>16b}_{:0>1b}'.format(i, j, ci, s, co), file=f);
                    
        for i in tqdm(range(2 ** 8)):
            for j in range(2 ** 8):
                for ci in range(2):
                    s = ((i << 8) + (j << 8) + ci) & (2 ** 16 - 1)
                    co = ((i << 8) + (j << 8) + ci) >> 16
                    print('{:0>16b}_{:0>16b}_{:0>1b}_{:0>16b}_{:0>1b}'.format(i << 8, j << 8, ci, s, co), file=f);

        for i in tqdm(range(2 ** 20)):
            for ci in range(2):
                a = randint(1, 2 ** 16 - 1);
                b = randint(1, 2 ** 16 - 1);
                s = (a + b + ci) & (2 ** 16 - 1)
                co = (a + b + ci) >> 16
                print('{:0>16b}_{:0>16b}_{:0>1b}_{:0>16b}_{:0>1b}'.format(a, b, ci, s, co), file=f);
            
if __name__ == '__main__':
    main()
