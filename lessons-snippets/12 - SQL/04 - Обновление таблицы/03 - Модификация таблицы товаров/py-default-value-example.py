from datetime import datetime
from time import sleep


def example(default=datetime.now()):
    print(default)


example()  # 2025-10-16 22:22:42.123456
sleep(1)
example()  # 2025-10-16 22:22:42.123456
sleep(1)
example()  # 2025-10-16 22:22:42.123456
