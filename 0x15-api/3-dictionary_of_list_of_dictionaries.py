#!/usr/bin/python3
"""Exports to-do list information of all employees to JSON format."""
import json
import requests

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    users = requests.get(url + "users").json()

    all_todos = {}
    for user in users:
        user_id = user.get("id")
        username = user.get("username")
        todos = requests.get(url + "todos", params={"userId": user_id}).json()
        all_todos[user_id] = [{"task": t.get("title"), "completed": t.get("completed"), "username": username} for t in todos]

    with open("todo_all_employees.json", "w") as jsonfile:
        json.dump(all_todos, jsonfile, indent=4)
