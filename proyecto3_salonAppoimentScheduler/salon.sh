#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


#main menu
MAIN_MENU(){
  #mensaje cuando lafuncion es llamada
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\n~~~~~ MY SALON ~~~~~\n"
    echo "Welcome to My Salon, how can I help you?"
  fi 


  #show main meu 
  echo "$($PSQL "SELECT * FROM services")" | while read SERVICE_ID BAR NAME
  do 
    echo "$SERVICE_ID) $NAME"
  done 
  #guardar seleccion del servicio 
  echo -e "\nType the number of the service:"
  read SERVICE_ID_SELECTED
  
  #validar la seleccion de id
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # id de servicio invalido
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    #obtener el nombre del servicio
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    
    #guardar numero telefonnico
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    #validar numero
    CUSTOMER_PHONE_FORMATED=$(echo $CUSTOMER_PHONES_UNFORMATED | sed 's/[ |-]//g')

    CUSTOMER_PHONES_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE_FORMATED'")

    if [[ -z $CUSTOMER_PHONES_NAME ]]
    then
      # add customer to database
      ADD_CLIENT $CUSTOMER_PHONES_NAME
    fi
    CUSTOMER_PHONES_NAME=$CUSTOMER_NAME

    # guardar hora de cita
    APPOIMENT_TIME $SERVICE_NAME $CUSTOMER_PHONES_NAME

    # guardar cita en la base de datos
    ADD_APPOIMENT $SERVICE_TIME $CUSTOMER_PHONES_NAME $SERVICE_NAME $SERVICE_ID_SELECTED
  fi
}

#anadir cliente
ADD_CLIENT(){
  # pedir nombre de registro
  if [[ $2 ]]
  then
    echo -e "\n$2" 
  else
    echo -e "\nI don't have a record for that phone number, what's your name?"
  fi

  # guardar nombre
  read CUSTOMER_NAME

  # agregar a base de datos
  if [[ $CUSTOMER_NAME =~ ^[A-Z]+|^[a-z]+$ ]]
  then 
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$1', '$CUSTOMER_NAME')")
    # revisar si se agregar correctamente
    if [[ $INSERT_CUSTOMER == 'INSERT 0 1' ]]
    then
      echo -e "\nError"
      ADD_CLIENT $1 "That is not a valid name, What's your name?"
    fi
  #no es un nombre valido
  else
    ADD_CLIENT $1 "That is not a valid name, What's your name?"
  fi
}

APPOIMENT_TIME(){
  if [[ $3 ]]
  then
    echo -e "\n$3" 
  else
    echo -e "\nWhat time would you like your $1, $(echo $2 | sed -r 's/^ *| *$//g')?"
  fi
  
  read SERVICE_TIME

  #validar tiempo horas y minutos formato 24 horas
  if [[ ! $SERVICE_TIME =~ ^([01]?[0-9]|2[0-3]):[0-5][0-9]$ ]] 
  then
  # no es una hora valida
    APPOIMENT_TIME $1 $2 'That is not a valid time, type another time'
  fi
}

ADD_APPOIMENT(){
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$2'")
  
  INSERT_APPOIMENT=$($PSQL "INSER INTO appoiments(time, customer_id, service_id) VALUES('$1', $CUSTOMER_ID, $4)")

  if [[ $INSERT_APPOIMENT == 'INSERT 0 1' ]]
  then
    echo -e "\nI have put you down for a $3 at $1, $2."
  fi
}

MAIN_MENU