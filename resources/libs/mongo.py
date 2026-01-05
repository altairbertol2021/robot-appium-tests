from robot.api.deco import keyword
from pymongo import MongoClient

client = MongoClient('mongodb+srv://qax:xperience@cluster0.hfdgyut.mongodb.net/markX?appName=Cluster0')

db = client['markX'] 

@keyword('Remove tarefa do banco de dados')
def remove_task_by_name(task_name):
    collections = db['tasks']
    collections.delete_many({'text': task_name})
    print('Removendo a tarefa ' + task_name)