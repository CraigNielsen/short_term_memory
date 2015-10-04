import os

if __name__ == '__main__':
    directory = '/home/craig/Pictures/GTSRB/Final_Training/Images/ROUND 80/'
    for fname in os.listdir(directory):
        f = open(directory + fname, 'r')
        lines = f.readlines()
        f.close()
        
        f2 = open(directory + fname, 'w')
        for l in lines:
            f2.write(l.replace('__BEGIN__', '__CV_BEGIN__').replace('__END__', '__CV_END__').replace('EXIT', 'exit(0)'))
        f2.close()
    
