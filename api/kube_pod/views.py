from rest_framework import viewsets, status
from rest_framework.response import Response
from kube_service.settings import INITIATE_APP
from utils.basic_utilities import Utilities


class DefaultNameSpacePods(viewsets.GenericViewSet):
    """Endpoint Name: Default Name Space Pods

    """
    permission_classes = []
    name_space = 'default'
    view_stat = status.HTTP_417_EXPECTATION_FAILED

    def list(self, *args, application_group=None):
        """This Endpoint Gets all pods in the Default name space.
            It accepts a string flag application_group, which defines
            the application group to filter query by. It returns
            DefaultNameSpacePods list object If the method is called asynchronously,
            returns the request thread
        """
        try:
            pod_data = []
            pod_object = {}
            response = INITIATE_APP.list_namespaced_deployment(namespace=self.name_space)
            for pod in response.items:
                application_grouping = Utilities.check_subscriptability(pod)
                pod_object['name'], pod_object['applicationGroup'], pod_object['runningPodsCount'] = pod.metadata.name, application_grouping, pod.status.available_replicas
                pod_data.append(pod_object)
                pod_object = {}
            if application_group is not None:
                pod_data = [k for k in pod_data if application_group in k.values()]

            # update status code based on object data
            self.view_stat = status.HTTP_200_OK if pod_data else status.HTTP_204_NO_CONTENT
            return Response(pod_data, status=self.view_stat)
        except:
            return Response({'status':'Kubernetes Instance not configured on this box'}, status=self.view_stat)




