import os

def change_extension (filename, ext):
    path, filename = os.path.split (filename)
    basename = os.path.splitext (filename)[0]
    return os.path.join (path, basename + ext)


def get_path (file_path):
    path, filename = os.path.split (file_path)
    return path

def get_filename (file_path):
    path, filename = os.path.split (file_path)
    return filename


def get_filename_without_extension (file_path):
    path, filename = os.path.split (file_path)
    basename = os.path.splitext (filename)[0]
    return basename
