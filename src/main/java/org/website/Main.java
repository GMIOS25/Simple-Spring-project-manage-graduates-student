package org.website;

import java.util.Objects;

class user{
    String id;
    String name;

    public user(String id, String name) {
        this.id = id;
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        user user = (user) o;
        return Objects.equals(id, user.id) && Objects.equals(name, user.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name);
    }
}
public class Main {
    public static void main(String[] args) {
        user u1 = new user("237213","Cuong");
        user u2 = new user("237214","Cuong");
        System.out.println(u1.hashCode());
        System.out.println(u2.hashCode());
    }
}