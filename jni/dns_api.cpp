// Part of measurement-kit <https://measurement-kit.github.io/>.
// Measurement-kit is free software. See AUTHORS and LICENSE for more
// information on the copying conditions.

#include <android/log.h>
#include <jni.h>
#include <measurement_kit/common.hpp>
#include <string>
#include "common.hpp"
#include "org_openobservatory_measurement_kit_jni_DnsApi.h"

JNIEXPORT void JNICALL
Java_org_openobservatory_measurement_1kit_jni_DnsApi_clearNameServers
  (JNIEnv * /*env*/, jclass /*clazz*/) {
    try {
        mk::clear_nameservers();
    } catch (...) {
        // XXX suppress
    }
}

JNIEXPORT jint JNICALL
Java_org_openobservatory_measurement_1kit_jni_DnsApi_countNameServers
  (JNIEnv * /*env*/, jclass /*clazz*/) {
    try {
        return mk::count_nameservers();
    } catch (...) {
        return -1;
    }
}

JNIEXPORT void JNICALL
Java_org_openobservatory_measurement_1kit_jni_DnsApi_addNameServer
  (JNIEnv * env, jclass /*clazz*/, jstring nameServer) {
    try {
        mk::add_nameserver(mk::jni::cxxstring(env, nameServer));
    } catch (...) {
        // XXX suppress
    }
}