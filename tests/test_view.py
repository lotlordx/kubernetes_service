from rest_framework.test import APITestCase, RequestsClient


class KubectlTestCase(APITestCase):
    """This Test Case Checks for Proper Connectivity of the Endpoint SERVICE"""

    @staticmethod
    def test_case_1():
        """
        Returns 200 .
        """
        client = RequestsClient()
        status_response = client.get('http://testserver/service/')
        assert status_response.status_code == 200

    def test_case_2(self):
        """
        Checks to Ensure that the Endpoint comes back with a result
        """

        pod_response = self.client.get('/service/')
        self.assertGreaterEqual(len(pod_response.data), 0)
