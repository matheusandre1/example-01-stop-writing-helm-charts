package org.acme;

import io.quarkus.hibernate.orm.panache.PanacheEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "orders")
public class Order extends PanacheEntity {

    public String customer;
    public String product;
    public int quantity;
}
