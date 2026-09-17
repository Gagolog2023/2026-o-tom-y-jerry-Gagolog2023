object casa {
  var suciedad = 50
  const cuidadores = [tom,kitachan]
  const quilomberos = [jerry,diachan,tuffy]

  method suciedad(cambio) {
    suciedad += cambio
  }
  method muchoRuido() {
    cuidadores.forEach({cuidador => cuidador.interrumpirSueno()})
  }

  method limpiezaTotal(){
    suciedad = 0
  }

  method pasarElDia() {
    cuidadores.limpiarCasa()
    if (cuidadores.atraparQuilomberos(quilomberos)) {
      quilomberos.filter({quilombero => cuidadores.atraparQuilombero(quilombero)})
    }
  }

  //method sacarQuilombero(hola) {
    //hola.clear()
 // }

  method pasarLaNoche() {
    cuidadores.dormir()
    quilomberos.hacerQuilombo()
  }

  method hacerQuilomboPandilla(pandilla) {
    pandilla.map({quilombero => quilombero.hacerQuilombo()})
  }
}

//mjnhjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj
object tom { //Cuidador
  var energia = 100

  method velocidad() = 5 + energia/10

  method limpiarCasa() {
    casa.suciedad(-100)
    energia -= 40
  }

  method atraparQuilombero(quilombero) = self.velocidad() > quilombero.velocidad()

  method dormir() {
    energia += 50
  }

  method interrumpirSueno() {
    energia -= 20
  }
}

object robocat { //Cuidador

  method velocidad() {}

  method limpiarCasa() {
    casa.limpiezaTotal() //
  }

  method atraparQuilombero(quilombero) = true //

  method dormir() {} //
  
  method interrumpirSueno() {}
}
// dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd

object jerry { //quilombero
  var peso = 4 //idsk
  method hacerQuilombo() {
    casa.suciedad(110)
    peso += 1
  }
  method velocidad() = 10 - peso
}

object tuffy { //quilombero
  method hacerQuilombo() {
    casa.muchoRuido()
  }
  method velocidad() = 10
}

//cuidador y quilombero nuevo idk

object diachan { //quilombero
  var energia = 100
  var mufada = true

  method hacerQuilombo() {
    casa.muchoRuido()
    if (energia > 50) {
      mufada = false
      energia -= 15
    } else {
      mufada = true
      energia += 5
    }
  }

  method velocidad() {return if(mufada) 40 else 60}
}

object kitachan { //cuidador
  var energia = 100
  var humor = 3
  var velocidad = 50

  method limpiarCasa() {
    casa.limpiezaTotal()
    humor += 1
    energia += 10
  }

  method entrenamiento() {
    if(energia > 50) {
      energia -= 20
      velocidad += humor + 5
    } else {
      humor -= 1
      velocidad -= 2
    }
  }

  method atraparQuilombero(quilombero) = (humor >= 5 || self.velocidad() > quilombero.velocidad())

  method dormir() {
    energia += 50
  }

  method interrumpirSueno() {
    energia -= 20
    humor -= 1
  }

  method velocidad() = velocidad
}

