/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.12
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package io.ooni.mk.nettest.swig;

public class FailureReportCreateEvent {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected FailureReportCreateEvent(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(FailureReportCreateEvent obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        mk_swig_nettestJNI.delete_FailureReportCreateEvent(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public void setFailure(String value) {
    mk_swig_nettestJNI.FailureReportCreateEvent_failure_set(swigCPtr, this, value);
  }

  public String getFailure() {
    return mk_swig_nettestJNI.FailureReportCreateEvent_failure_get(swigCPtr, this);
  }

  public FailureReportCreateEvent() {
    this(mk_swig_nettestJNI.new_FailureReportCreateEvent(), true);
  }

  public final static String key = mk_swig_nettestJNI.FailureReportCreateEvent_key_get();
}
