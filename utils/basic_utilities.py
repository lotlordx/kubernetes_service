
class Utilities:
    """This Class Serves as an helper class to Perform Grouping Checks"""

    @staticmethod
    def check_subscriptability(pod):
        """Checks if an Application Grouping is Subscriptable

        :param str pod: Defines Pod objedct returned from getting deployment Pods.
        :return: str application group
                 If the method is called asynchronously,
                 returns the request thread.
        """

        try:
            application_group = pod.metadata.labels['applicationGroup']
        except TypeError:
            application_group = None
        return application_group
