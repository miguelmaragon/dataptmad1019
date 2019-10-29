#1. Use a list comprehension to create and print a list of consecutive integers starting with 1 and ending with 50.
lst = [i+1 for i in range(50)]
print(lst)

#2. Use a list comprehension to create and print a list of even numbers starting with 2 and ending with 200.
lst = [i+1 for i in range(200) if i%2 != 0]
print(lst)

#3. Use a list comprehension to create and print a list containing all elements of the 10 x 4 Numpy array below.
a = np.array([[0.84062117, 0.48006452, 0.7876326 , 0.77109654],
       [0.44409793, 0.09014516, 0.81835917, 0.87645456],
       [0.7066597 , 0.09610873, 0.41247947, 0.57433389],
       [0.29960807, 0.42315023, 0.34452557, 0.4751035 ],
       [0.17003563, 0.46843998, 0.92796258, 0.69814654],
       [0.41290051, 0.19561071, 0.16284783, 0.97016248],
       [0.71725408, 0.87702738, 0.31244595, 0.76615487],
       [0.20754036, 0.57871812, 0.07214068, 0.40356048],
       [0.12149553, 0.53222417, 0.9976855 , 0.12536346],
       [0.80930099, 0.50962849, 0.94555126, 0.33364763]])
lst = [y for x in a for y in x]
print(lst)

#4. Add a condition to the list comprehension above so that only values greater than or equal to 0.5 are printed.
lst = [y for x in a for y in x if y >= 0.5]
print(lst)

#5. Use a list comprehension to create and print a list containing all elements of the 5 x 2 x 3 Numpy array below.
b = np.array([[[0.55867166, 0.06210792, 0.08147297],
        [0.82579068, 0.91512478, 0.06833034]],

       [[0.05440634, 0.65857693, 0.30296619],
        [0.06769833, 0.96031863, 0.51293743]],

       [[0.09143215, 0.71893382, 0.45850679],
        [0.58256464, 0.59005654, 0.56266457]],

       [[0.71600294, 0.87392666, 0.11434044],
        [0.8694668 , 0.65669313, 0.10708681]],

       [[0.07529684, 0.46470767, 0.47984544],
        [0.65368638, 0.14901286, 0.23760688]]])
#5. Add a condition to the list comprehension above so that the last value in each subarray is printed, but only if it is less than or equal to 0.5.
lst = [c for x in b for y in x for c in y if c <= 0.5]
print(lst)
