from fastapi import APIRouter

router = APIRouter()

@router.get("/")
def inicio():
    return {"mensaje": "Ruta funcionando desde routes"}