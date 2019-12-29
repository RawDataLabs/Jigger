package main

import (
        "fmt"
        // "log"

        metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
        corev1client "k8s.io/client-go/kubernetes/typed/core/v1"
        "k8s.io/client-go/tools/clientcmd"

        // "github.com/gomodule/redigo/redis"

)

type struc 
func main(){
    ListKubePods()

}

func RedisStart() {

}
func ListKubePods() {
        // Instantiate loader for kubeconfig file.
        kubeconfig := clientcmd.NewNonInteractiveDeferredLoadingClientConfig(
                clientcmd.NewDefaultClientConfigLoadingRules(),
                &clientcmd.ConfigOverrides{},
        )

        // Determine the Namespace referenced by the current context in the
        // kubeconfig file.
        namespace, _, err := kubeconfig.Namespace()
        if err != nil {
                panic(err)
        }

        // Get a rest.Config from the kubeconfig file.  This will be passed into all
        // the client objects we create.
        restconfig, err := kubeconfig.ClientConfig()
        if err != nil {
                panic(err)
        }

        // Create a Kubernetes core/v1 client.
        coreclient, err := corev1client.NewForConfig(restconfig)
        if err != nil {
                panic(err)
        }

        // List all Pods in our current Namespace.
        pods, err := coreclient.Pods(namespace).List(metav1.ListOptions{})
        if err != nil {
                panic(err)
        }
        // var images []string
        
        fmt.Printf("Pods in namespace %s:\n", namespace)
        for _, pod := range pods.Items {
                // fmt.Printf("  %s\n", pod.Name)
                // fmt.Printf("  %+v\n", pod)
                fmt.Println(pod.Name, pod.Spec.Containers[0].Image)
        }


         // List all Pods in our current Namespace.
        // svc, err := coreclient.Services(namespace).List(metav1.ListOptions{})
        // if err != nil {
        //         panic(err)
        // }

        // fmt.Printf("svc in namespace %s:\n", namespace)
        // for _, sv := range svc.Items {
        //         fmt.Printf("  %s\n", sv.Name)
        //         fmt.Printf("%+v\n", sv)

        //         fmt.Printf("ClusterIP  %s\n", sv.Spec.ClusterIP)
        //         fmt.Printf("PORT  %s\n", sv.Spec.Ports[0].Port)

        // }
}