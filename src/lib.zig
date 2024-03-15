// Library Imports

// Py Imports
const py = @cImport({
    @cDefine("Py_LIMITED_API", "3");
    @cDefine("PY_SSIZE_T_CLEAN", {});
    @cInclude("Python.h");
});

const PyObject = py.PyObject;
const PyMethodDef = py.PyMethodDef;
const PyModuleDef = py.PyModuleDef;
const PyModuleDef_Base = py.PyModuleDef_Base;
const Py_BuildValue = py.Py_BuildValue;
const PyModule_Create = py.PyModule_Create;
const METH_NOARGS = py.METH_NOARGS;

fn zaml_load() !void {}

// Module Definition
var ZiPyMethods = [_]PyMethodDef{
    PyMethodDef{
        .ml_name = "load",
        .ml_meth = zaml_load,
        .ml_flags = METH_NOARGS,
        .ml_doc = "Load some tasty YAML.",
    },
    PyMethodDef{
        .ml_name = null,
        .ml_meth = null,
        .ml_flags = 0,
        .ml_doc = null,
    },
};

var ZiPyModule = PyModuleDef{
    .m_base = PyModuleDef_Base{
        .ob_base = PyObject{
            .ob_refcnt = 1,
            .ob_type = null,
        },
        .m_init = null,
        .m_index = 0,
        .m_copy = null,
    },
    .m_name = "ZiPyFilter",
    .m_doc = null,
    .m_size = -1,
    .m_methods = &ZiPyMethods,
    .m_slots = null,
    .m_traverse = null,
    .m_clear = null,
    .m_free = null,
};

// Module Creation
pub export fn PyInit_ZiPy() [*]PyObject {
    return PyModule_Create(&ZiPyModule);
}
