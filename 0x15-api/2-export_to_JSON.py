#!/usr/bin/python3
"""
Exports data gathered from an API to JSON format.
"""
import sys
import json
import requests

if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit("Usage: {} <employee_id>".format(sys.argv[0]))

    employee_id = sys.argv[1]
    base_url = "https://jsonplaceholder.typicode.com"
    todos_url = "{}/todos?userId={}".format(base_url, employee_id)

    try:
        todos_response = requests.get(todos_url)
        todos_data = todos_response.json()
    except Exception as e:
        sys.exit("Error: {}".format(str(e)))

    if todos_response.status_code != 200:
        sys.exit("Error: TODO list data not found")

    json_data = {employee_id: [{"task": task.get("title"), "completed": task.get("completed"), "username": task.get("name")} for task in todos_data]}
    json_filename = "{}.json".format(employee_id)
    with open(json_filename, mode='w') as file:
        json.dump(json_data, file)
