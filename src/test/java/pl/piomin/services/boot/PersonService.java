package pl.piomin.services.boot.service;

import org.springframework.stereotype.Service;
import pl.piomin.services.boot.model.Person;

import java.util.List;
import java.util.ArrayList;

@Service
public class PersonService {

    private List<Person> persons = new ArrayList<>();

    public Person addPerson(Person person) {
        person.setId((long) (persons.size() + 1)); // Setting id
        persons.add(person);
        return person;
    }

    public List<Person> getAllPersons() {
        return persons;
    }

    public Person getPersonById(Long id) {
        return persons.stream()
                .filter(person -> person.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    public Person updatePerson(Long id, Person person) {
        for (int i = 0; i < persons.size(); i++) {
            if (persons.get(i).getId().equals(id)) {
                persons.set(i, person);
                return person;
            }
        }
        return null;
    }

    public void deletePerson(Long id) {
        persons.removeIf(person -> person.getId().equals(id));
    }
}
