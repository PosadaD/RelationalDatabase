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
  read SERVICE_ID_SELECTED
  
  #validar la seleccion de id
  VALID_ID_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $VALID_ID_SELECTED ]]
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
    CUSTOMER_PHONES_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")


    if [[ -z $CUSTOMER_PHONES_NAME ]]
    then
      # add customer to database
      ADD_CLIENT $CUSTOMER_PHONE
      CUSTOMER_PHONES_NAME=$CUSTOMER_NAME
    fi
    
    # guardar hora de cita
    echo -e "\nWhat time would you like your $SERVICE_NAME, $(echo $CUSTOMER_PHONES_NAME | sed -r 's/^ *| *$//g')?"
  
    read SERVICE_TIME

    # guardar cita en la base de datos
    ADD_APPOINTMENT $SERVICE_TIME $CUSTOMER_PHONES_NAME $SERVICE_NAME $SERVICE_ID_SELECTED
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
      echo "Anadido"
    fi
  #no es un nombre valido
  else
    ADD_CLIENT $1 "That is not a valid name, What's your name?"
  fi
}


ADD_APPOINTMENT(){
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$2'")
  
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$1', $CUSTOMER_ID, $4)")

  if [[ $INSERT_APPOINTMENT == 'INSERT 0 1' ]]
  then
    echo -e "\nI have put you down for a $3 at $1, $2."
  fi
}

MAIN_MENU
