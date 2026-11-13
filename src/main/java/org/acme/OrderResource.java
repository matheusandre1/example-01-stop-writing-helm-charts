package org.acme;

import java.util.List;

import jakarta.transaction.Transactional;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Response;

@Path("/orders")
public class OrderResource {

    @GET
    public List<Order> list() {
        return Order.listAll();
    }

    @POST
    @Transactional
    public Response create(Order order) {
        order.persist();
        return Response.status(Response.Status.CREATED).entity(order).build();
    }
}
