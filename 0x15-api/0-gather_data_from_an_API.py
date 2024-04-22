#!/usr/bin/python3
"""
Gathers data from an API for a given employee ID and returns their TODO list progress.
"""
import sys
import requests

if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit("Usage: {} <employee_id>".format(sys.argv[0]))

    employee_id = sys.argv[1]
    base_url = "https://jsonplaceholder.typicode.com"
    user_url = "{}/users/{}".format(base_url, employee_id)
    todos_url = "{}/todos?userId={}".format(base_url, employee_id)

    try:
        user_response = requests.get(user_url)
        user_data = user_response.json()
        todos_response = requests.get(todos_url)
        todos_data = todos_response.json()
    except Exception as e:
        sys.exit("Error: {}".format(str(e)))

    if user_response.status_code != 200:
        sys.exit("Error: User data not found")

    username = user_data.get("name")
    done_tasks = [task.get("title") for task in todos_data if task.get("completed")]
    total_tasks = len(todos_data)

    print("Employee {} is done with tasks({}/{}):".format(username, len(done_tasks), total_tasks))
    for task in done_tasks:
        print("\t{}".format(task))
