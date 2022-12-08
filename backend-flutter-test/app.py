from typing import Union

from fastapi import FastAPI
import json

app = FastAPI()

industries = [i["industry"] for i in json.load(open("data/industries.json"))]
skills = [s["skill"] for s in json.load(open("data/skills.json"))]
languages = [l["language"] for l in json.load(open("data/languages.json"))]

@app.get("/industry")
def get_all_industry():
    return industries


@app.get("/skills")
def read_item(query: str):

   return [*filter(lambda skill: skill.lower().startswith(query.lower()),skills)]

@app.get("/languages")
def read_item(query:str):
   return [*filter(lambda language: language.lower().startswith(query.lower()),languages)]