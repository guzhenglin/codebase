import random
from matplotlib import pyplot as plt


def roll_dice():
    dice_num = random.randint(1, 6)
    return dice_num


total_times = int(input('How many times='))

result_list = [0, 0, 0, 0, 0, 0]
roll_list = list(range(1, 7))
t_list = [0]
colors = ['darkblue', 'green', 'gray', 'red', 'black', 'brown']
proba = [[0], [0], [0], [0], [0], [0]]

plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

plt.ion()
for i in range(total_times):
    t_list.append(i + 1)
    roll = roll_dice()
    for j in range(1, 7):
        if roll == j:
            result_list[j - 1] += 1
    sums = sum(result_list)
    for k in range(6):
        proba[k].append(result_list[k] / sums)
        plt.plot(t_list, proba[k], colors[k])
    plt.pause(0.1)
plt.ioff()
for i, result in enumerate(result_list):
    print("number{}times{}，frequency{}".format(i + 1, result, result / total_times))
plt.figure(2)
plt.bar(roll_list, result_list)
plt.title("chart", size=20)
plt.xlabel("number", size=16)
plt.ylabel("frequency", size=16)
plt.show()
