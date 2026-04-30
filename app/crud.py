from sqlalchemy.orm import Session
from . import models, schemas

def crear_estacion(db: Session, estacion: schemas.EstacionCreate):
    nueva_estacion = models.EstacionDB(**estacion.dict())
    db.add(nueva_estacion)
    db.commit()
    db.refresh(nueva_estacion)
    return nueva_estacion

def registrar_lectura(db: Session, lectura: schemas.LecturaCreate):
    nueva_lectura = models.LecturaDB(**lectura.dict())
    db.add(nueva_lectura)
    db.commit()
    return nueva_lectura