package org.redhat.qe.clustering;

import org.junit.After;
import org.junit.Test;
import org.wildfly.extras.sunstone.api.CloudProperties;
import org.wildfly.extras.sunstone.api.CloudProvider;
import org.wildfly.extras.sunstone.api.Node;

public class SunstoneShhContainerTestCase {

    @Test
    public void test() {
        System.out.println("TEST START");
        CloudProperties.getInstance().load("sunstone-docker.properties");

        try (CloudProvider cloudProvider = CloudProvider.create("myprovider")) {
            try (Node node1 = cloudProvider.createNode("node1")) {
                node1.start();
            }
        }

        System.out.println("TEST END");
    }

    @After
    public void tearDown() throws Exception {

    }
}
