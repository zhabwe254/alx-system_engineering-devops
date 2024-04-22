#!/usr/bin/python3
"""
Exports data gathered from an API to CSV format.
"""
import sys
import csv
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

    csv_filename = "{}.csv".format(employee_id)
    with open(csv_filename, mode='w', newline='') as file:
        writer = csv.writer(file, quoting=csv.QUOTE_ALL)
        writer.writerow(["USER_ID", "USERNAME", "TASK_COMPLETED_STATUS", "TASK_TITLE"])
        for task in todos_data:
            writer.writerow([employee_id, task.get("name"), task.get("completed"), task.get("title")])
