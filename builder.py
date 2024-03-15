import os
import platform
from setuptools.command.build_ext import build_ext


class ZigBuilder(build_ext):
    def build_extension(self, ext=None):
        # Ensure the build directory exists
        if not os.path.exists(self.build_lib):
            os.makedirs(self.build_lib)

        # Determine if we are on Windows
        windows = platform.system() == "Windows"

        # Command to build the Zig project
        command = [
            "zig",
            "build",
            *(["-Dtarget=x86_64-windows-msvc"] if windows else []),
            "-Drelease-fast=true",
        ]

        # Execute the build command
        self.spawn(command)

        # Define the output library name here, since `ext` is not used
        output_lib_name = "ZiPyFilter" 
        source_lib_path = os.path.join("zig-out", "lib", output_lib_name + (".dll" if windows else ".so"))

        dest_lib_path = os.path.join(self.build_lib, output_lib_name + (".dll" if windows else ".so"))

        if os.path.exists(source_lib_path):
            self.copy_file(source_lib_path, dest_lib_path)
        else:
            raise RuntimeError(f"Expected output library not found: {source_lib_path}")
