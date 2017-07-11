// WARNING! File autogenerated from "jni/wrappers/nettests.m4"
// by "./script/swig" using m4. DO NOT EDIT!

// Part of measurement-kit <https://measurement-kit.github.io/>.
// Measurement-kit is free software. See AUTHORS and LICENSE for more
// information on the copying conditions.
#ifndef MK_JNI_WRAPPERS_NETTESTS_HPP
#define MK_JNI_WRAPPERS_NETTESTS_HPP

#include "environment_.hpp"
#include <jni.h>
#include <measurement_kit/common.hpp>
#include <measurement_kit/nettests.hpp>

#ifdef __ANDROID__
#include <android/log.h>
#endif

typedef jobject mk_entry_callback_t;
typedef jobject mk_event_callback_t;
typedef jobject mk_progress_callback_t;
typedef jobject mk_log_callback_t;
typedef jobject mk_test_complete_callback_t;

dnl Since swig crashes if I'm using inheritance from a template and it does
dnl not support yet the `using` keyword, I'm using brute force.
define(MK_DECLARE_TEST, `
class $1 {
  public:
    $1() {}

    void set_verbosity(uint32_t verbosity) { test_.set_verbosity(verbosity); }

    void increase_verbosity() { test_.increase_verbosity(); }

    void add_input(std::string input) {
        test_.add_input(input);
    }

    void set_input_filepath(std::string fpath) {
        test_.set_input_filepath(fpath);
    }

    void set_output_filepath(std::string fpath) {
        test_.set_output_filepath(fpath);
    }

    void set_error_filepath(std::string fpath) {
        test_.set_error_filepath(fpath);
    }

    // TODO: in future MK we should allow one to both use the logcat and
    // receive input using the callback, which currently does not work since
    // the there is just one single callback for each logger object.
    void use_logcat() {
#ifdef __ANDROID__
        test_.on_log([](uint32_t level, const char *msg) {
            level &= MK_LOG_VERBOSITY_MASK;
            if (level <= MK_LOG_WARNING) {
                __android_log_print(ANDROID_LOG_WARN, "MK", "%s", msg);
            } else if (level <= MK_LOG_INFO) {
                __android_log_print(ANDROID_LOG_INFO, "MK", "%s", msg);
            } else {
                __android_log_print(ANDROID_LOG_DEBUG, "MK", "%s", msg);
            }
        });
#endif
    }

    void on_progress(mk_progress_callback_t delegate) {
        Environment environ;
        environ.trap_and_route_exceptions([delegate, this, &environ]() {
            jobject global_cb = environ.new_global_ref(delegate);
            test_.on_destroy([global_cb]() {
                Environment environ;
                environ.own_global(global_cb);
            });
            test_.on_progress([global_cb](double d, const char *message) {
                Environment environ;
                environ.trap_and_route_exceptions([global_cb, &d, &message,
                                                   &environ]() {
                    jdouble jd = d;
                    jstring java_message = environ.new_string_utf(message);
                    jclass clazz = environ.get_object_class(global_cb);
                    jmethodID meth_id = environ.get_method_id(clazz, "callback",
                                                     "(DLjava/lang/String;)V");
                    environ.call_void_method(global_cb, meth_id, jd,
                                             java_message);
                });
            });
        });
    }

    void on_log(mk_log_callback_t delegate) {
        Environment environ;
        environ.trap_and_route_exceptions([delegate, this, &environ]() {
            jobject global_cb = environ.new_global_ref(delegate);
            test_.on_logger_eof([global_cb]() {
                Environment environ;
                environ.own_global(global_cb);
            });
            test_.on_log([global_cb](uint32_t severity, const char *message) {
                Environment environ;
                environ.trap_and_route_exceptions([global_cb, &severity,
                                                   &message, &environ]() {
                    jlong java_severity = severity;
                    jstring java_message = environ.new_string_utf(message);
                    jclass clazz = environ.get_object_class(global_cb);
                    jmethodID meth_id = environ.get_method_id(clazz, "callback",
                                                     "(JLjava/lang/String;)V");
                    environ.call_void_method(global_cb, meth_id, java_severity,
                                             java_message);
                });
            });
        });
    }

    void on_event(mk_event_callback_t delegate) {
        Environment environ;
        environ.trap_and_route_exceptions([delegate, this, &environ]() {
            jobject global_cb = environ.new_global_ref(delegate);
            test_.on_logger_eof([global_cb]() {
                Environment environ;
                environ.own_global(global_cb);
            });
            test_.on_event([global_cb](const char *message) {
                Environment environ;
                environ.trap_and_route_exceptions([global_cb, &message,
                                                   &environ]() {
                    jstring java_message = environ.new_string_utf(message);
                    jclass clazz = environ.get_object_class(global_cb);
                    jmethodID meth_id = environ.get_method_id(clazz, "callback",
                                                     "(Ljava/lang/String;)V");
                    environ.call_void_method(global_cb, meth_id, java_message);
                });
            });
        });
    }

    void start(mk_test_complete_callback_t callback) {
        Environment environ;
        environ.trap_and_route_exceptions([callback, this, &environ]() {
            jobject global_cb = environ.new_global_ref(callback);
            test_.start([global_cb]() {
                Environment environ;
                environ.own_global(global_cb);
                environ.trap_and_route_exceptions([global_cb, &environ]() {
                    jclass clazz = environ.get_object_class(global_cb);
                    jmethodID meth_id = environ.get_method_id(clazz,
                            "callback", "()V");
                    environ.call_void_method(global_cb, meth_id);
                });
            });
        });
    }

    void on_entry(mk_entry_callback_t delegate) {
        Environment environ;
        environ.trap_and_route_exceptions([delegate, this, &environ]() {
            jobject global_cb = environ.new_global_ref(delegate);
            test_.on_destroy([global_cb]() {
                Environment environ;
                environ.own_global(global_cb);
            });
            test_.on_entry([global_cb](std::string entry) {
                Environment environ;
                environ.trap_and_route_exceptions([global_cb, &entry,
                                                   &environ]() {
                    jstring java_entry = environ.new_string_utf(entry.c_str());
                    jclass clazz = environ.get_object_class(global_cb);
                    jmethodID meth_id = environ.get_method_id(clazz, "callback",
                                                     "(Ljava/lang/String;)V");
                    environ.call_void_method(global_cb, meth_id, java_entry);
                });
            });
        });
    }

    void set_options(std::string key, std::string value) {
        test_.set_options(key, value);
    }

    void run() { test_.run(); }

  private:
    mk::nettests::$1 test_;
}
')

MK_DECLARE_TEST(DnsInjectionTest);
MK_DECLARE_TEST(HttpHeaderFieldManipulationTest);
MK_DECLARE_TEST(HttpInvalidRequestLineTest);
MK_DECLARE_TEST(MeekFrontedRequestsTest);
MK_DECLARE_TEST(MultiNdtTest);
MK_DECLARE_TEST(NdtTest);
MK_DECLARE_TEST(TcpConnectTest);
MK_DECLARE_TEST(WebConnectivityTest);

#endif