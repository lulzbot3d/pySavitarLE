import shutil
from io import StringIO
from pathlib import Path

from conans import tools
from conan import ConanFile
from conan.tools.env import VirtualRunEnv
from conans.errors import ConanException


class PySavitarTestConan(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "VirtualRunEnv"

    def generate(self):
        venv = VirtualRunEnv(self)
        venv.generate()

    def build(self):
        # if self.settings.os == "Windows" and not tools.cross_building(self, skip_x64_x86=True):
        shutil.copy(Path(self.source_folder).joinpath("test.py"), Path(self.build_folder).joinpath("test.py"))

    def imports(self):
        if self.settings.os == "Windows" and not tools.cross_building(self, skip_x64_x86=True):
            self.copy("*.dll", dst=".", src="@bindirs")
            self.copy("*.pyd", dst=".", src="@libdirs")

    def test(self):
        if not tools.cross_building(self, skip_x64_x86=True):
            test_pysavitar = StringIO()

            try:
                self.run(f"python test.py", env="conanrun", output=test_pysavitar)
            except Exception:
                print("Test Failed to run: ", test_pysavitar.getvalue())

            if "True" not in test_pysavitar.get_value():
                raise ConanException("pySavitar wasn't built correctly")
