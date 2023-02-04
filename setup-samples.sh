mkdir samples
mkdir samples/animals
mkdir samples/animals/countries
mkdir samples/animals/countries/movies

ANIMALS=('Apes' 'Elephants' 'Elephant babies' 'Monkies' 'apes')
COUNTRIES=('Denmark' 'Sweden' 'USA' 'France' 'Italy' '.apes' 'North Korea')
MOVIES=('Batman' 'Sex And The City' 'JFK' 'Poltergeist' 'Germany')

cd samples/animals 
for id in "${ANIMALS[@]}"
do
echo "$id" >> "$id.txt"
done

cd countries
for id in "${COUNTRIES[@]}"
do
echo "$id" >> "$id.txt"
done

cd movies
for id in "${MOVIES[@]}"
do
echo "$id" >> "$id.txt"
done
