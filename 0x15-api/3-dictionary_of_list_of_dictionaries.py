#!/usr/bin/python3
"""
Exports data gathered from an API to JSON format containing tasks from all employees.
"""
import json
import requests

if __name__ == "__main__":
    base_url = "https://jsonplaceholder.typicode.com"
    users_url = "{}/users".format(base_url)

    try:
        users_response = requests.get(users_url)
        users_data = users_response.json()
    except Exception as e:
        sys.exit("Error: {}".format(str(e)))

    if users_response.status_code != 200:
        sys.exit("Error: User data not found")

    all_tasks = {}
    for user in users_data:
        user_id = user.get("id")
        todos_url = "{}/todos?userId={}".format(base_url, user_id)
        try:
            todos_response = requests.get(todos_url
