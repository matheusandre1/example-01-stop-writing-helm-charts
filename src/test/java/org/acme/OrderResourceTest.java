package org.acme;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.notNullValue;

import org.junit.jupiter.api.Test;

import io.quarkus.test.junit.QuarkusTest;
import io.restassured.http.ContentType;

@QuarkusTest
class OrderResourceTest {

    @Test
    void createsAndListsOrders() {
        given()
                .contentType(ContentType.JSON)
                .body("{\"customer\":\"Ana\",\"product\":\"Keyboard\",\"quantity\":2}")
                .when().post("/orders")
                .then()
                .statusCode(201)
                .body("id", notNullValue());

        given()
                .when().get("/orders")
                .then()
                .statusCode(200)
                .body("product", hasItem("Keyboard"));
    }
}
