
class Utilities:
    """This Class Serves as an helper class to Perform Grouping Checks"""

    @staticmethod
    def check_subscriptability(pod):

        try:
            application_group = pod.metadata.labels['applicationGroup']
        except TypeError:
            application_group = None
        return application_group
